// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ledger {
    struct Entry {
        string description;
        uint256 amount;
    }

    Entry[] public entries;

    function addEntry(string memory description, uint256 amount) public {
        entries.push(Entry(description, amount));
    }

    function getEntry(uint256 index) public view returns (string memory, uint256) {
        Entry memory entry = entries[index];
        return (entry.description, entry.amount);
    }
}
