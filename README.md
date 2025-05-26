# 📘 Solidity Concepts: Importing, Interaction & Inheritance

This project demonstrates beginner-level Solidity concepts with three smart contracts:

-  Importing contracts
-  Interacting with other contracts
-  Inheritance & function overriding

## 📁 Contracts Overview

### ✅ SimpleStorage.sol

A basic contract to:
- Store and retrieve a `uint256` value (`favNumber`)
- Maintain a dynamic list of people using a `struct`

**Key Concepts:**
- State variables (`uint256`, `string`)
- `public` visibility
- `view` functions (read-only)
- Structs and dynamic arrays

**Main Functions:**
- `store(uint256 _favNum)`: Stores a favorite number (can be overridden)
- `retrive()`: Returns the stored favorite number
- `addPeople(uint256, string)`: Adds a new person to the `people` list

---

### ✅ StorageFactory.sol

A contract that creates and interacts with multiple `SimpleStorage` contracts.

**Key Concepts:**
- Importing external contracts with `import`
- Deploying contracts dynamically using `new`
- Interacting with contract instances stored in an array

**Main Functions:**
- `createSimpleStorageContract()`: Deploys a new `SimpleStorage` contract and stores it in an array
- `sfStore(index, number)`: Calls `store()` on a deployed contract at a specific index
- `sfGet(index)`: Calls `retrive()` on a deployed contract

---

### ✅ ExtraStorage.sol

Inherits from `SimpleStorage` and overrides the `store()` function.

**Key Concepts:**
- Contract inheritance using `is`
- Overriding parent functions using `override`
- Marking functions as `virtual` to allow overriding

**Override Behavior:**
- Adds `5` to the incoming number before storing it

---

## How to Test (in Remix)

1. Open [Remix IDE](https://remix.ethereum.org)
2. Create three files: `SimpleStorage.sol`, `StorageFactory.sol`, and `ExtraStorage.sol`
3. Paste the corresponding contract code into each file
4. Compile all contracts
5. Deploy and interact with:
   - `SimpleStorage` directly
   - `StorageFactory` to create & manage multiple storage contracts
   - `ExtraStorage` to see inheritance and function override in action

---
