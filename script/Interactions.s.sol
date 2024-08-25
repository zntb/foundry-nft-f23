// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNFT} from "./DeployBasicNFT.s.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "https://ipfs.io/ipns/k51qzi5uqu5dkub7o2drx7sdzm64m6bgeldtmx2r018qz0n6bvua2s2qk32els/0-PUG.json";
    DeployBasicNFT public deployer;
    BasicNft public basicNft;

    function run() external {
        address mostRecentDeployed = DevOpsTools
            .DevOpsTools
            .get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}
