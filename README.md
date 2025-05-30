# SimpleStorage Smart Contract

This smart contract is a basic implementation in Solidity that lets you store a number, retrieve it, and keep a list of people with their favorite numbers.

## What It Does

* Stores a number on the blockchain
* Retrieves the stored number
* Adds people with a name and favorite number using a struct

## Concepts Covered

**State Variables**

* `uint256 favNumber`: Public variable to store a number
* `People[] people`: Dynamic array of a custom struct

**Structs**
Used to define a custom type:

```solidity
struct People {
    uint256 favNumber;
    string name;
}
```

**Functions**

* `store(uint256 _favNum)`: Stores a number on-chain
* `retrive()`: Returns the stored number (read-only)
* `addPeople(uint256 _favNumber, string memory _name)`: Adds a new person to the array

**Data Locations**

* `memory` is used for temporary input like `_name`
* `storage` is used for state variables like `people`

## Tools Used

* Solidity ^0.8.7
* Remix IDE

## File

* `SimpleStorage.sol`

## Note

I’ve created **different branches** in this repository for each topic I’ve learned (e.g. functions, memory vs storage, structs & arrays, visibility). Each branch focuses on a specific concept for better understanding and reference.
