// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simplestorage.sol";

contract storageFactory {

    SimpleStorage[] public simplestoragearray;

    function createSimpleStoragecontract() public{
       SimpleStorage simplestorage = new SimpleStorage();
       simplestoragearray.push(simplestorage);

    }

    function sfstore(uint256 _simplestorageIndex, uint256 _simplestoragenumber) public {
        //address
        //ABI
       // SimpleStorage simplestorage = simplestoragearray[_simplestorageIndex];
        //simplestorage.store(_simplestoragenumber);
        simplestoragearray[_simplestorageIndex].store(_simplestoragenumber);
    }

    function sfget(uint256 _simplestorageIndex) public view returns(uint256){
       // SimpleStorage simplestorage = simplestoragearray[_simplestorageIndex];
       // return simplestorage.retrieve();
       return simplestoragearray[_simplestorageIndex].retrieve();

    }

} 
