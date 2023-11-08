// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Array {
    uint[3] public numbers = [100,200,300];
    string[3] public pets = ["Dog","Cat","Fish"];
    address[2] public  adddresses = [0x2248232140444e579BD70E7c0309e198870e9520,0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266];

    string[] public members ;  

    function countPets() public view returns(uint){
        return pets.length;
    }
    function changePet(uint index, string memory petName) public {
        pets[index] = petName;
    } 
    function addMember(string memory name) public  {
        members.push(name);
    }
}