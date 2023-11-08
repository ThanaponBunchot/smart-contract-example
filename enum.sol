// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
struct Admin {
    string name;
    uint age;
    address account;
}
contract Bank {
    enum State {Open,Close}
    uint _balance = 10000;
    State public BankStatus = State.Open;
    Admin _admin;

    constructor(string memory _name, uint _age){
        _admin.name = _name ;
        _admin.age = _age;
        _admin.account = msg.sender;
    }
    modifier isAdmin {
        require(msg.sender == _admin.account,"Unauthorized, you're not admin");
        _;
    }
    modifier  isOpen {
        require(BankStatus == State.Open,"bank is closed");
        _;
    }
    function getBalance() public view isAdmin isOpen returns (uint){
        return _balance;
    }
    function getAdmin()public  view isAdmin isOpen returns  (string memory){
        return _admin.name;
    }
    function Open()public  isAdmin {
        BankStatus = State.Open;
    }
    function Close()public  isAdmin {
        BankStatus = State.Close;
    }
}