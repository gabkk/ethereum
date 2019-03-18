pragma solidity 0.5.1;

import "./Animal.sol";

contract DogContract is AnimalContract{
    
    modifier cost(uint _amount){
        require(msg.value >= _amount);
        _;
        if(msg.value > _amount){
            require(msg.sender.send(msg.value - _amount) == true, "transfert function failed");
        }
    }

    function addDog(string memory _name, uint _age) public payable cost(1000) onlyOwner returns(uint){
        return _addAnimal(_name, _age, AnimalType.DOG);
        
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}
