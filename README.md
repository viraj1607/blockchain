````markdown
# FundMe - Smart Contract for Crowdfunding

This Solidity-based project is a simple, gas-optimized **crowdfunding smart contract** that covers a wide range of core Web3 and Solidity concepts.

It lets users fund the contract in **ETH**, checks the amount against a **minimum USD value**, and lets the **owner withdraw** the funds. The ETH-to-USD conversion is done using **Chainlink Price Feeds**.

---

## Features & Concepts Covered

### ETH to USD Conversion
- Uses Chainlink’s [`AggregatorV3Interface`](https://docs.chain.link/data-feeds/price-feeds/addresses) to fetch real-time ETH/USD price.
- Implemented using a **Solidity library** for clean, reusable logic:
  ```solidity
  function getConversionRate(uint256 ethAmount) internal view returns (uint256)
````

### Funding Logic

* Users can fund the contract using ETH.
* Ensures the ETH value is **at least \$5 USD** (adjustable).
* Tracks each funder’s contribution with a `mapping`.

### Withdraw Logic

* Only the **contract owner** can withdraw funds.
* Loops through all funders and resets their balances.
* Resets the funders array.
* Executes ETH transfer using **`.call{value: ...}()`** (modern & safe method).

### Owner Protection

* The contract includes a **custom error (`NotOwner`)** and a **modifier** to restrict withdrawal access:

  ```solidity
  modifier onlyOwner() {
      if (msg.sender != i_owner) revert NotOwner();
      _;
  }
  ```

### Solidity Best Practices

* `immutable` used for `i_owner` to save gas.
* Reverts used for gas-efficient error handling.
* `receive()` and `fallback()` functions redirect unexpected ETH to the `fund()` function.
* Uses the `library` keyword for modular, reusable conversion logic.
* `msg.sender` is used for identifying funders and setting the owner.
* The funding mapping is reset before withdrawal to avoid stale state.

### Security Considerations

* Ensures only valid ETH contributions are accepted.
* Prevents non-owners from withdrawing funds.
* Safe ETH transfers using `.call`.

---

##  Notable Concepts Used

* ✅ Chainlink Price Feeds (Interface usage)
* ✅ Custom errors (`error NotOwner();`)
* ✅ `receive()` and `fallback()` functions
* ✅ Solidity `library`
* ✅ `msg.sender`, `msg.value`
* ✅ `immutable` and `constructor()`
* ✅ Resetting state variables and arrays
* ✅ Function modifiers (`onlyOwner`)
* ✅ Modern ETH transfer using `.call`
* ✅ Gas optimization tips (no SafeMath needed in 0.8+)

---

##  What About SafeMath?

Solidity 0.8+ comes with built-in overflow/underflow protection, so **SafeMath is no longer necessary** unless you’re on an older version.

---

## 🔧 Requirements

* Solidity ^0.8.18
* Remix or Hardhat (for testing/deploying)
* Chainlink Price Feed (e.g., Sepolia ETH/USD)

---

