// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SmartBank {
    uint   _balance;
    mapping(address=>uint) public balance ;

    function deposite()  payable public{
        //check money in user address
        require(msg.value>0,"no money");
        _balance += msg.value;
        balance[msg.sender] = _balance;
    }

    function withdraw(uint amount) payable  public {
        //check this is money in address
        require(balance[msg.sender] > 0,"no money in address");
        require(amount > 0,"amount must be greater than 0");
        // amount must less than balance
        require(balance[msg.sender] >= amount,"money not enough");
        // Deduct the withdrawal amount from the user's balance
        balance[msg.sender] -= amount;
        // Transfer the withdrawn Ether to the sender
        payable(msg.sender).transfer(amount);
        }

    function total() view public returns (uint) {
     return address(this).balance ;
    }
}