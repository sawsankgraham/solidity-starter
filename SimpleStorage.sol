//SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // using ^ before version will allow compatibility with all versions after the stated one

// pragma solidity >=0.8.18 <0.9.0; means only 0.8.18, 0.8.19 will be compatible versions

// SimpleStorage contract
contract SimpleStorage {
    // Basic Types:
    // boolean: true|false
    // uint: unsigned integer -> positive whole number
    // int: signed integer -> positive/negative whole number
    // address:
    // bytes:

    // variable declaration (type name = value;) Eg:
    // bool isTransaction = false;

    // int and uint can be specified of how many bits it might need
    // int8 ... int256 & uint8 ... uint256

    // bytes can also have bits allowed bytes8 ... bytes32
    // string type is also stored as bytes
    // string isTransactionBy = "sawsank"
    // bytes8 isTransactionBy = "sawsank"

    // variables are either state (global) and local (inside scopes/functions)

    // common naming conventions for state and local variable
    // state: favoriteNummber
    // local: _favoriteNumber (notice the _ in the beginning)

    uint256 public favoriteNumber; //public is a VISIBILITY SPECIFIER

    // the public keyword is just a getter function that could also be written as:
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // the retrieve() function and the favoriteNumber variable with 'public' keyword is actually the same

    // There are 2 keywords that disallow changing any state variables
    // pure: this will also disallow reading any state, perfect for returning any static data. eg: maxSupply() function
    // view: this will allow reading state but not modifying

    function maxSupply() public pure returns (uint32) {
        return 100000;
    }

    // view and pure functions that do not change state will not cost gas fees
    // however, if these 'public' functions are called from another function
    // that is changing state or has execution code then this call will cost
    // gas fees

    // VISIBILITY SPECIFIERS
    // public -> visible to both internal and external
    // private -> visible to only the same contract
    // external -> only visible externally (only for functions)
    // internal -> only visible internally

    //store function
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // ARRAYS
    // we define arrays with the data type and []s
    // uint256[] listOfFavoriteNumbers = []; this is a dynamic array (can grow and shrink in size)

    // static arrays that have a fixed size can be created as such:
    // uint256[10] public listOfFavoriteNumbers; // default value is [] an empty array

    // CUSTOM TYPES
    // we can define our own custom types extending the basic types like such
    struct Person {
        uint256 luckyNumber;
        string name;
    }
    // Our Person custom type has two properties
    // an uint256 type
    // and a string type
    // we created a custom type based on the base types

    // we can now create a value for our custom type as such
    Person public sawsank = Person(7, "sawsank"); // here the values are in the order defined during creation

    // we can also provide the value in a JSON format as well
    Person public steve = Person({luckyNumber: 13, name: "steve"});

    // we can also then create an array Person type like the base types
    Person[] public players; // we can also create static arrays similary to base types

    // we can now create a public function the would let users add items to the array
    function addPlayer(string memory _name, uint256 _luckyNumber) public {
        players.push(Person(_luckyNumber, _name));
    }

    // EVM can read and write information in these six places:
    // stack:
    // memory: exists temporarily and is muttable (can be changed)
    // storage:  exists permanently and is muttable
    // calldata: exists temporarily and is immuttable (cannot be changed)
    // code:
    // logs:

    // mapping is a method to store keys that point to individual values
    // we can define what data type the key and values can be
    mapping(string => uint256) public friendsAndKnownYears;

    function addFriendsWithKnownYears(string memory _name, uint256 _knownYears)
        public
    {
        friendsAndKnownYears[_name] = _knownYears;
    }
    // mapping works just like JSON and js, need to study more on the similarity and dissimilarity
}
