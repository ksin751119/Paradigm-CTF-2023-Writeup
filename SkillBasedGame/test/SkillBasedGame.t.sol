// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Challenge} from "src/Challenge.sol";
import {SkillBasedGameExploit} from "src/SkillBasedGameExploit.sol";
import {IBlackJack} from "src/IBlackJack.sol";

contract SkillBasedGameTest is Test {
    Challenge public challenge;
    IBlackJack public jack;

    address public user;
    address public owner;

    function setUp() public {
        user = makeAddr("user");
        owner = makeAddr("owner");
        vm.deal(user, 200 ether);

        vm.startPrank(user);
        address jackAddr = deployCode("BlackJack.sol:BlackJack");
        jack = IBlackJack(payable(jackAddr));
        vm.deal(address(jack), 50 ether);
        challenge = new Challenge(address(jack));
        vm.stopPrank();
    }

    function testSolveBlackJack() public {
        vm.startPrank(user);
        SkillBasedGameExploit exploit = new SkillBasedGameExploit(
            address(challenge)
        );
        while (address(jack).balance > 0) {
            try exploit.bet{value: 5 ether}() {} catch {}
            // exploit.bet{value: 5 ether}();
            vm.roll(block.number + 1);
            skip(14); //  pass 3600 second
        }
        vm.stopPrank();
        assertTrue(challenge.isSolved());
    }
}
