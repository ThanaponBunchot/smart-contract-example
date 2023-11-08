// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    string[] public city = ["UTH","BKK"];

    function cityMemory() public view returns(string[] memory newArr)  {
        string [] memory _newArr = city;
        _newArr[0] = "JPN";
        return _newArr;
    }

    function cityStorage() public   {
        string [] storage _newArr = city;
          _newArr[0] = "JPN";
    }
}