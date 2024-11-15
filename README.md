# MYtoken

`MYtoken` is a basic implementation of the ERC20 token standard written in Solidity. This smart contract defines a simple fungible token with the following key features:

- Fixed total supply of 1000 tokens.
- Ability for users to transfer tokens, approve allowances, and transfer tokens on behalf of others.
- Fully implements the ERC20 standard interface.

## Features

1. **ERC20 Standard Compliance**:
   - Implements the ERC20 interface with all required functions and events.
2. **Token Information**:
   - Total supply is fixed at 1000 tokens.
   - Token has no decimals (decimals = 0).
3. **Ownership**:
   - The deployer of the contract (founder) owns all tokens initially.
4. **Transfer Functionality**:
   - Users can transfer tokens to other addresses.
   - Allowances allow approved users to spend tokens on behalf of others.

---

## Smart Contract Details

### State Variables

- `founder`: Address of the contract deployer who initially owns all tokens.
- `totalSupply`: Total number of tokens (fixed at 1000).
- `balanceOfuser`: Mapping that tracks each user's token balance.
- `allowedToken`: Mapping that tracks approved allowances for each spender.

### Events

- `Transfer`: Emitted when tokens are transferred between addresses.
- `Approval`: Emitted when an allowance is set or updated for a spender.

### Functions

#### ERC20 Functions

1. `totalSupply()`: Returns the total supply of tokens.
2. `balanceOf(address account)`: Returns the balance of the given address.
3. `transfer(address to, uint256 value)`: Transfers tokens from the caller to another address.
4. `allowance(address owner, address spender)`: Returns the remaining number of tokens that a spender is allowed to spend on behalf of the owner.
5. `approve(address spender, uint256 value)`: Approves a spender to transfer a specified number of tokens on behalf of the caller.
6. `transferFrom(address from, address to, uint256 value)`: Allows a spender to transfer tokens on behalf of an owner, based on the approved allowance.

---

## Example Usage

### Deployment

1. Deploy the `MYtoken` contract on an Ethereum-compatible blockchain.
2. The deployer (founder) will hold the total supply of tokens initially.

### Interacting with the Contract

1. **Check Balance**:
   ```solidity
   uint256 balance = MYtoken.balanceOf(userAddress);
## Transfer Token
bool success = MYtoken.transfer(recipientAddress, amount);

## Approve Allowance
bool success = MYtoken.approve(spenderAddress, allowanceAmount);

## Transfer Tokens on Behalf of Another Address
bool success = MYtoken.transferFrom(ownerAddress, recipientAddress, amount);

## Check Allowance
uint256 remaining = MYtoken.allowance(ownerAddress, spenderAddress);


