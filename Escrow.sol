// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// 1º Passo: Setup
contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // 2º Passo: Constructor Storage 
    // 3º Passo: Funding (payable)
    // the depositor will send some ether to the contract
    constructor (address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        
    }

    error NotAuthorized();
    event Approved(uint);

    // 4º Passo: Approve
    function approve() external {
        if (msg.sender != arbiter){
            // 5º: Passo
            revert NotAuthorized(); 
        }

         uint balance = address(this).balance;

        (bool s, ) = beneficiary.call{value: balance}("");
        require(s);

        // 6º Passo
        // Emit event with the balance that is sent to the beneficiary
        emit Approved(balance);
    }

}