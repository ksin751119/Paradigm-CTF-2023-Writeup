// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SkillBasedGameExploit, Challenge} from "src/SkillBasedGameExploit.sol";

contract SkillBasedGameScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Challenge challenge = Challenge(vm.envAddress("CHALLENGE"));
        new SkillBasedGameExploit(address(challenge));
        vm.stopBroadcast();
    }
}
