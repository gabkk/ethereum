pragma solidity 0.5.1;

contract DogContract{
    function addDog(string memory _name, uint _age) public payable returns(uint);
    function getBalance() public view returns(uint);
}

contract externalContrat {
    DogContract dcInstance = DogContract(0xbA8dC1a692093d8aBD34e12aa05a4fE691121bB6);
    
    function addExternalDog(string memory _name, uint _age) public payable returns(uint){
        return dcInstance.addDog.value(msg.value)(_name,_age);
    }
    
    function getExternalBalance() public view returns(uint){
        return dcInstance.getBalance();
    }
}
