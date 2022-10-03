// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; 
// mention the version of solidity u use (^ higher versions compitable ) 

contract SimpleStorage {
    // boolean,uint,int,address,bytes,string
    // basically solidity defines to 0 ( here null is 0)
    uint256  favnum;

    mapping(string => uint256) public nametofavnum;   
    mapping(uint256 => string ) public favnumtoname;   
   
    struct People{
        uint256 favnum;
        string name;
    }
    // store as array
    //eg : uint256[] public favnumlist; (also an array)
    People[] public people; 
    
function store(uint256 _favnum) public virtual {
        favnum = _favnum;
        
     }

     //view and pure doesnt cost gas unless called inside the function it costs gas 
function retrieve() public view returns(uint256) {
    return favnum;
}

    //calldata - temp variable tht cant be modified 
    //memory - temp variable tht can be modified
    //storage - permanent  variable tht can be modified

function addppl(string memory _name , uint256 _favnum) public{
    
    people.push(People(_favnum  , _name));
    nametofavnum[_name] = _favnum;
    favnumtoname[_favnum] = _name;
}
 
 

}
 
