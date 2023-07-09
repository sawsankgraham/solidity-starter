//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// import "./SimpleStorage.sol"; // this imports the whole file resulting in more computing resource needed
import {SimpleStorage} from "./SimpleStorage.sol";

// this imports the specific parts from the file (needed when there are multiple contracts in the same file

contract StorageFactory {
    // Declaring the state variable for a SimpleStorage contract
    SimpleStorage public simpleStorage;

    // Deploying contract SimpleStorage from this contract
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage(); // this will automatically deploy SimpleStorage contract from this contract
    }

    //Array of contracts
    SimpleStorage[] public allStorages; // this creates and array of deployed contract addresses

    function createAndAddToStorage() public {
        SimpleStorage newSimpleStorage = new SimpleStorage(); // creating a new contract gives its address
        allStorages.push(newSimpleStorage); // we then push that address to the allStorages list/array
    }

    // Interacting with the contract

    function storageStore(uint256 _indexForStorage, uint256 _newNumber) public {
        SimpleStorage newSimpleStorage = allStorages[_indexForStorage]; // getting the storage from index
        newSimpleStorage.store(_newNumber); // accessing the store method in SimpleStorage
        // this access needs function selector to make this call which will be available in the ABI
        // ABI -> Application Binary interface
        // ABI allows others to know how to interact with the contract
    }

    function storageRetrieve(uint256 _indexForStorage)
        public
        view
        returns (uint256)
    {
        SimpleStorage newSimpleStorage = allStorages[_indexForStorage];
        return newSimpleStorage.retrieve(); // accessing through ABI and returned
    }
}
