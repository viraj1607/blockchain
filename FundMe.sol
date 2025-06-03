
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe{
     using PriceConverter for uint256;
     uint256 public MIN_USD=5e18;
     address[] public funders;
     mapping(address funder=> uint256 amountFunded) public addressToAmountFunded;
     address public immutable i_owner;

     constructor(){
        i_owner=msg.sender;
     }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MIN_USD,"Didn't send enoght ETH");  //1e18=1ETH= 1*10**18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner{
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");


    }

    modifier onlyOwner(){
       // require(msg.sender==i_owner,"only owner can call this function");
       if(msg.sender != i_owner){revert NotOwner();}
        _;
    }

    receive() external payable {
        fund();
     }

     fallback() external payable { 
        fund();
     }

}