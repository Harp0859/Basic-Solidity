// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simplestorage.sol";


//contract to ovride the initial contract / can inherit from the mother contract (simplestorage)

contract extrastorage is SimpleStorage {

    // virtual and override

    function store (uint256 _favnum) public override{
        favnum = _favnum + 5;
    }
     
}

