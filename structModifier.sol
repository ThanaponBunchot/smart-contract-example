// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Admin {
    string name;
    uint age;
    address account;
}
contract Manager {
    Admin   admin ;
    uint _balance = 100000;
    constructor(string memory _name, uint _age) {
        admin.name = _name;
        admin.age = _age;
        admin.account = msg.sender;
    }
    modifier isAdmin {
        require(msg.sender == admin.account,"Unauthorized, you're not admin" );
        _;
    }
    function balance() public view isAdmin returns (uint){
        return  _balance;
    } 
    function getAdmin() public  view isAdmin returns (string memory){
        return admin.name;
    }
}