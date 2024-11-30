# BTC DeFi Loan Smart Contract

## Overview

This smart contract provides a decentralized finance (DeFi) solution for managing Bitcoin-backed loans with advanced security features, mixer pools, and enhanced safety mechanisms. Deployed on the Stacks blockchain using Clarity, the contract offers a robust platform for crypto lending and fund mixing.

## Features

### Security Mechanisms

- Enhanced safety checks for all transactions
- Emergency pause functionality
- Daily transaction limits
- Maximum transaction amount controls

### Core Functionalities

- User deposits and withdrawals
- Mixer pool creation and participation
- Fund distribution with transparent mixing fees
- Protocol fee management

### Key Protections

- Prevents unauthorized access
- Validates transaction amounts
- Checks user balances
- Implements participant limits
- Provides emergency contract pause option

## Contract Constants

### Transaction Limits

- **Maximum Daily Limit**: 10,000,000,000 STX
- **Maximum Pool Participants**: 10
- **Maximum Transaction Amount**: 1,000,000,000,000 STX
- **Minimum Pool Amount**: 100,000 STX
- **Mixing Fee**: 2%

## Public Functions

### User Operations

- `deposit(amount)`: Deposit funds into the contract
- `withdraw(amount)`: Withdraw funds from the contract
- `get-user-balance(user)`: Check user's current balance
- `get-daily-limit-remaining(user)`: Check remaining daily transaction limit

### Mixer Pool Functions

- `create-mixer-pool(pool-id, initial-amount)`: Create a new mixer pool
- `join-mixer-pool(pool-id, amount)`: Join an existing mixer pool
- `distribute-pool-funds(pool-id)`: Distribute funds from a mixer pool

### Administrative Functions

- `initialize()`: Initialize the contract
- `toggle-contract-pause()`: Pause/unpause contract operations
- `withdraw-protocol-fees()`: Withdraw accumulated protocol fees

## Read-Only Functions

- `get-contract-status()`: Retrieve current contract status
- `get-pool-details(pool-id)`: Get details of a specific mixer pool

## Error Handling

The contract includes comprehensive error handling with specific error codes:

- `ERR-NOT-AUTHORIZED (u1000)`: Unauthorized access attempt
- `ERR-INVALID-AMOUNT (u1001)`: Invalid transaction amount
- `ERR-INSUFFICIENT-BALANCE (u1002)`: Insufficient user balance
- `ERR-CONTRACT-NOT-INITIALIZED (u1003)`: Contract not yet initialized
- `ERR-ALREADY-INITIALIZED (u1004)`: Contract already initialized
- (and more, see contract for full list)

## Security Considerations

1. Only contract owner can:

   - Initialize the contract
   - Pause/unpause contract
   - Withdraw protocol fees

2. Built-in protections against:
   - Unauthorized transactions
   - Excessive withdrawals
   - Pool manipulation

## Mixer Pool Mechanism

- Users can create and join mixer pools
- Each pool has:
  - Maximum 10 participants
  - Minimum initial amount of 100,000 STX
  - 2% mixing fee on total pool amount
- Funds are distributed equally among participants after pool is full

## Usage Example

```clarity
;; Initialize the contract
(initialize)

;; Deposit funds
(deposit u1000000)

;; Create a mixer pool
(create-mixer-pool u1 u500000)

;; Join the mixer pool
(join-mixer-pool u1 u500000)

;; Distribute pool funds
(distribute-pool-funds u1)
```

## Development and Deployment

### Requirements

- Clarinet (Stacks development environment)
- Clarity smart contract knowledge
- Understanding of DeFi principles

### Testing

Comprehensive testing is crucial. Use Clarinet to:

- Verify transaction limits
- Test error conditions
- Validate pool mechanics
- Check security mechanisms

## Contributing

Contributions are welcome! Please submit pull requests or open issues on the project repository.
