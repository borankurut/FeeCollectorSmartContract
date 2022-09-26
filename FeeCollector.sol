// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract FeeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }
    
    receive() payable external{
        balance += msg.value;
    }

    function withdraw(uint amount, address payable adr) public{
        require(msg.sender == owner, "only owner can withdraw.");
        require(balance >= amount, "not enough funds");

        balance -= amount;
        adr.transfer(amount);
    }
}