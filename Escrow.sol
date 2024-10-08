// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor (address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        
    }

    error NotAuthorized();
    event Approved(uint);

    function approve() external {
        if (msg.sender != arbiter){
            revert NotAuthorized(); 
        }

         uint balance = address(this).balance;

        (bool s, ) = beneficiary.call{value: balance}("");
        require(s);

        emit Approved(balance);
    }
}
