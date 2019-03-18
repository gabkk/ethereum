pragma solidity 0.5.1;

import "./Animal.sol";

contract DogContract is AnimalContract{
    
    modifier cost(uint _amount){
        require(msg.value == _amount, "Amount should be 1000");
        _;
    }

    function addDog(string memory _name, uint8 _age) public payable cost(1000) returns(uint){
        return _addAnimal(_name, _age, AnimalType.DOG);
        
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}
