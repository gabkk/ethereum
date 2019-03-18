pragma solidity 0.5.1;

import "./Ownable.sol";

contract AnimalContract is Ownable{

    event animalAdded(address indexed owner, string animalName);

    enum AnimalType {DOG, CAT}

    struct Animal {
        string name;
        uint8 age;
        AnimalType animalType;
    }

    mapping(address => Animal[]) ownerToAnimals;

    function _addAnimal(string memory _name, uint8 _age, AnimalType _animalType) internal returns(uint){
        emit animalAdded(msg.sender, _name);
        return ownerToAnimals[msg.sender].push(Animal(_name, _age, _animalType))-1;
    }

    function getAnimalName(uint _id) public view returns (string  memory){
        return ownerToAnimals[msg.sender][_id].name;
    }
    
    function getAnimalAge(uint _id) public view returns (uint){
        return ownerToAnimals[msg.sender][_id].age;
    }

}
