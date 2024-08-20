// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "script/DeployBox.s.sol";
import {UpgradeBox} from "script/UpgradeBox.s.sol";
import {BoxV1} from "src/BoxV1.sol";
import {BoxV2} from "src/BoxV2.sol";

contract DeployAndUpgradeTest is Test{
    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public Owner = makeAddr("owner");
    address public proxy;

    function setUp() public{
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run();
    }

    function testUpgrade() public{
        BoxV2 box2 = new BoxV2();
        upgrader.upgradeBox(proxy, address(box2));
        uint256 expectedVerison = 2;
        assertEq(expectedVerison, BoxV2(proxy).getVersion());
    }
}