// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library priceconverter {

       function getPrice() internal view returns(uint256) {
        // abi , address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = PriceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getversion() internal view returns (uint256) {
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return PriceFeed.version();
    }


    function getconversionrate(uint256 ethamount) internal view returns (uint256) {
        uint256 ethprice = getPrice();
        uint256 ethamountinusd = (ethprice * ethamount) / 1e18;
        return ethamountinusd;


    }

}
