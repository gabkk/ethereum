pragma solidity 0.5.1;

contract PersonContract{

    constructor () public {
        owner = msg.sender ; 
    }
 
    address owner ; 

    /*
     * If you don't set a value to the first enum 
     * the value of the first enum will be zero
     * so in this case female ==0 and male==1
    */

    enum Gender  {female, male, notBinary, last}

    struct Person {
        string name;
        string lastName;
        uint age;
        Gender varGender;
    }

    mapping (address => Person[]) mapPerson; 

    function compareGenderString(string memory _name) pure public returns(Gender){
        if(uint(keccak256(abi.encodePacked("male"))) == uint(keccak256(abi.encodePacked(_name)))) {
            return Gender.male;
        }else if(uint(keccak256(abi.encodePacked("female"))) == uint(keccak256(abi.encodePacked(_name)))) {
            return Gender.female;
        } else{
            return Gender.notBinary;
        }
    }

    function addPersonWithString ( string memory _name, string memory _lname, uint _age, string memory _gender )  public returns (uint){
        require(compareGenderString(_gender) == Gender.notBinary,
                 "Gender should be 'male' or 'female'");
        return mapPerson[msg.sender].push(Person(_name, _lname, _age, compareGenderString(_gender)))-1; 
    }

    function addPerson ( string memory _name, string memory _lname, uint _age, Gender _gender )  public returns (uint){
        require(_gender == Gender.female || _gender == Gender.male,
                 "Gender should be 0 for female and 1 for male");
        return mapPerson[msg.sender].push(Person(_name, _lname, _age, _gender))-1 ; 
    }



    // Here we show that 2 is the maximum value female=0,male=1,notBinary=2
    function MaximumValueForGender() pure public returns(uint){
        return uint(Gender.last) - 1;
    }
    
    function showGender() pure public returns(string memory){
        return ("Directly write the option here: female=0,male=1,notBinary=2");
    }


    function callPersonGender (uint id)  view public returns (string memory){
        string memory gender;
        if (mapPerson[owner][id].varGender == Gender.male)
            gender = "male";
        else if (mapPerson[owner][id].varGender == Gender.female)
            gender = "female";
        return  gender; 
    }
}
