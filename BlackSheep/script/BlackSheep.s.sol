// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {ChallengeExploit} from "src/ChallengeExploit.sol";
import {Challenge} from "src/Challenge.sol";

contract BlackSheepScript is Script {
    function run() public {
        Challenge challenge = Challenge(vm.envAddress("CHALLENGE"));
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        ChallengeExploit exploit = new ChallengeExploit(challenge);
        exploit.solve();
        vm.stopBroadcast();
    }
}
