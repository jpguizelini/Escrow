# Escrow Contract

This is an **Escrow** smart contract implemented in Solidity. The contract facilitates the transfer of funds from a depositor to a beneficiary under the approval of a designated arbiter.

## Overview

An **Escrow** is a financial arrangement where a third party (arbiter) holds and regulates the payment of funds required for two parties involved in a transaction. The depositor funds the contract, and the arbiter approves the release of funds to the beneficiary.

## Features

- The contract is initialized with three participants: the **depositor**, the **beneficiary**, and the **arbiter**.
- The **depositor** sends Ether to the contract when it's deployed.
- The **arbiter** has the sole authority to approve the release of funds to the **beneficiary**.
- The **beneficiary** receives the funds only after the arbiter's approval.

## How It Works

### Step 1: Contract Setup
The contract defines three key participants:
- **Depositor**: The address that deploys the contract and sends the Ether.
- **Arbiter**: The address with the power to approve the transfer of Ether.
- **Beneficiary**: The address that will receive the Ether upon approval.

### Step 2: Constructor (Initialization)
When the contract is deployed, the constructor is called, passing the **arbiter** and **beneficiary** addresses. The **depositor** is automatically set as the account deploying the contract. The depositor sends Ether at the time of contract creation.

### Step 3: Approving Funds
The **approve** function is used by the **arbiter** to release the funds. If someone other than the arbiter tries to approve, the contract will revert with a `NotAuthorized` error.

### Step 4: Event Emission
Once the **arbiter** approves, the contract sends the entire balance to the **beneficiary**, and an `Approved` event is emitted, logging the amount sent.

## Contract Functions

### `constructor(address _arbiter, address _beneficiary) payable`
- Initializes the contract with the **arbiter** and **beneficiary** addresses.
- The **depositor** sends Ether when the contract is deployed.

### `function approve() external`
- This function can only be called by the **arbiter**.
- Transfers the entire balance of the contract to the **beneficiary**.
- Emits an `Approved` event with the amount transferred.

## Events

- `event Approved(uint balance)`: Emits the amount of Ether approved by the **arbiter** and sent to the **beneficiary**.

## Error Handling

- `error NotAuthorized()`: Thrown when someone other than the **arbiter** tries to call the `approve` function.

## Prerequisites

- Solidity version 0.8.20 or later.
- Deployed on a blockchain that supports Ethereum Virtual Machine (EVM), like Ethereum or test networks.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Você pode copiar e colar esse README no seu repositório GitHub.
