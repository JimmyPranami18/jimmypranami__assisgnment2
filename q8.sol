// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    address public owner;
    uint256 public storedData;

    // Define events
    event ValueSet(uint256 indexed oldValue, uint256 indexed newValue);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), owner);  // Log the creation of the contract
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function setValue(uint256 newValue) public onlyOwner {
        uint256 oldValue = storedData;
        storedData = newValue;
        emit ValueSet(oldValue, newValue);  // Log the value change
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        address oldOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);  // Log the ownership transfer
    }
}

