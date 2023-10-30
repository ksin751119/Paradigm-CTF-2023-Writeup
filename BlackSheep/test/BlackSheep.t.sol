// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Challenge, ISimpleBank} from "src/Challenge.sol";
import {ChallengeExploit} from "src/ChallengeExploit.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

contract BlackSheepTest is Test {
    Challenge public challenge;

    address public user;
    address public owner;
    ISimpleBank public bank;

    function setUp() public {
        user = makeAddr("user");
        owner = makeAddr("owner");
        vm.deal(user, 200 ether);
        vm.deal(user, 200 ether);

        vm.startPrank(owner);
        bank = ISimpleBank(HuffDeployer.deploy("SimpleBank"));
        challenge = new Challenge(bank);
        vm.deal(address(bank), 100 ether);
        vm.stopPrank();
    }

    function testSolveBlackSheep() public {
        vm.startPrank(user);
        ChallengeExploit exploit = new ChallengeExploit(challenge);
        exploit.solve();
        vm.stopPrank();
        assertTrue(challenge.isSolved());
    }
}
