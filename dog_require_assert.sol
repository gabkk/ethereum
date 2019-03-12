pragma solidity 0.5.1;

contract DogContract{
    struct Dog {
        string name;
        uint age;
    }
    
    mapping(address => Dog) ownerToDog;
    
    function compare(string memory _a, string memory _b) private pure returns (int){
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint minLength = a.length;
        if (b.length < minLength) minLength = b.length;
        for (uint i = 0; i < minLength; i ++)
            if (a[i] != b[i])
                return 1;
        if (a.length != b.length)
            return 1;
        else
            return 0;
    }
    
    function addDog(string memory _name, uint _age) public{
        require(bytes(_name).length != 0
                && _age != 0,
                "name or age couldn't be null");
        require(compare(ownerToDog[msg.sender].name, _name) == 1
                ,"Owner already have this dog");

        Dog memory currentDog = Dog(_name,_age);
        ownerToDog[msg.sender] = currentDog;
        assert(compare(ownerToDog[msg.sender].name, _name) == 0);
    }

    function getDogName() public view returns (string  memory){
        return ownerToDog[msg.sender].name;
    }
    
    function getDogAge() public view returns (uint){
        return ownerToDog[msg.sender].age;
    }
}
