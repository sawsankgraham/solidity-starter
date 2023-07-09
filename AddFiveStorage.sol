//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// INHERITANCE
// the 'is' keyword is used to inherit the SimpleStorage contract to the new contract
// this allows us to keep our SimpleStorage close to modifications but open to extension
// we can now extend upon the SimpleStorage without needing the actually edit the SimpleStorage contract

contract AddFiveStorage is SimpleStorage {
    // we can now add new functionalities on top of those available in the SimpleStorage contract
    function sayHello() public pure returns (string memory) {
        return "Hello";
    }

    // note that the sayHello method is not present in SimpleStorage but only in AddFiveStorage contract

    // To change one of the methods in the SimpleStorage contract we will need to override that function as such
    // look at SimpleStorage.sol on the method store we have the 'virtual' keyword. this makes the function overridable

    function store(uint256 _addedFavoriteNumber) public override {
        // here we define that the function is overriding the one in SimpleStorage
        favoriteNumber = _addedFavoriteNumber + 5;
    }
}
