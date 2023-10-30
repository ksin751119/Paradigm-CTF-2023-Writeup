// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;

interface IMultiSig {
    function emergencyStop() external;

    function execTransaction(
        address to,
        bytes memory data,
        uint8[3] memory vs,
        bytes32[3] memory rs,
        bytes32[3] memory ss
    ) external;

    function reloadConfig(uint8 _type, bytes memory data) external;
}

// THIS FILE WAS AUTOGENERATED FROM THE FOLLOWING ABI JSON:
/*
[{"inputs":[{"internalType":"address","name":"owner0","type":"address"},{"internalType":"address","name":"owner1","type":"address"},{"internalType":"address","name":"owner2","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"emergencyStop","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"},{"internalType":"uint8[3]","name":"vs","type":"uint8[3]"},{"internalType":"bytes32[3]","name":"rs","type":"bytes32[3]"},{"internalType":"bytes32[3]","name":"ss","type":"bytes32[3]"}],"name":"execTransaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint8","name":"_type","type":"uint8"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"reloadConfig","outputs":[],"stateMutability":"nonpayable","type":"function"}]
*/
