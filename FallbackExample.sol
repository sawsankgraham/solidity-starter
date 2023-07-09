//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract FallbackExample {
    uint256 public result;

    // receive function is triggered when the user has some value sent without any additional data
    // in remix you can set a value to VALUE field and hit the Transact button without any calldata
    // this will triggers the receive function
    receive() external payable {
        result = 1;
    }

    // if this contract is called with some call data it will look for the relevant function and if not found
    // the fallback method will be triggered. This 'special' function is called whenever there is no other function or method found to handled
    fallback() external payable {
        result = 2;
    }
}
