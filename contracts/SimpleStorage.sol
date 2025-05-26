// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage{
    //boolean, unit(only positive number ), int, address, bytes, string

    uint256 public favNumber; //public: visibility specifier
    //People public person=People({favNumber:7,name:"Viraj"});

    struct People{
        uint256 favNumber;
        string name;
    }

    People[] public people;
    function store(uint256 _favNum )public {
        favNumber = _favNum;
    }

    //view and pure: functions disallow modification of state, it just read
    //Pure functions additionally disallow you to read from blockchain state
    function retrive() public view returns (uint256){
        return favNumber;
    }

    function addPeople(uint256 _favNumber,string memory _name) public{
        people.push(People(_favNumber,_name));
    }
}