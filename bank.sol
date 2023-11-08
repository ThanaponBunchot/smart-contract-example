//SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;


contract Bank {
  
    mapping(address => uint) _balances ;
    uint _totalSupply;

    function deposite() public payable   {
      _balances[msg.sender] += msg.value;
      _totalSupply += msg.value;
    }
    function withdraw(uint amount) public  payable  {
        require(amount <= _balances[msg.sender],"money is not enough");
        payable(msg.sender).transfer(amount);
       _balances[msg.sender] -= amount;
        _totalSupply -= msg.value;
        
    }
    function checkBalance() public view returns(uint balance) {
        return  _balances[msg.sender];
    }
    function checkTotal() public  view  returns (uint totalSupply) {
        return _totalSupply;
    }
}