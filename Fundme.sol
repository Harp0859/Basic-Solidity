// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Priceconverter.sol";
//constant and immutable - gas efficient

error notowner();


contract Fundme {

    using priceconverter for uint256;

    uint256 public constant   minimumusd = 50 * 1e18;

   address[] public funders;
   mapping(address => uint256) public addresstoamountfunded;

   address public immutable owner; 

   constructor(){
       owner = msg.sender;
   }

    function fund() public payable {
      require(msg.value.getconversionrate() >= minimumusd ,"please send enough tokens");
        funders.push(msg.sender);
        addresstoamountfunded[msg.sender] += msg.value;
    }
    

    function withdraw() public onlyowner {

       // require(msg.sender == owner,"not an owner");
        for(uint256 funderindex = 0; funderindex < funders.length ; funderindex++ ){
           address funder = funders[funderindex];
           addresstoamountfunded[funder] = 0;
        }
         funders = new address[](0);
        //transfer
       // payable(msg.sender).transfer(address(this).balance);
        //send
       // bool sendsuccess = payable(msg.sender).send(address(this).balance);
        //call
        (bool callsuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callsuccess , "call failed");

    }

    modifier onlyowner {
        //require(msg.sender == owner , "sender is not onwer !");
        if(msg.sender != owner) { revert notowner();}
        _; // represents do the rest of the code
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }


}
