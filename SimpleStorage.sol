// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    
    // Value == equal 0 on initilized, has index of 0
    uint256 favoriteNumber;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    // Function costs gas everytime executed or made state changes.
    function store(uint256 _favoriteNumber) public returns(uint256){
        favoriteNumber = _favoriteNumber;
        return _favoriteNumber;
    }
    
    // view, pure -> only read some state of blockchain -> no transaction
    // blue buttons are view functions, while orange buttons are 
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    // memory -> only stores during execution on contract calls
    // string type is a special array/object type -> need memory or storage for storing
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    } 
}