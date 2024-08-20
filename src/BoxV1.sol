// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;
    constructor(){
        _disableInitializers();
    }

    function initalize() public initializer {
        // Set the owner to msg.sender
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns(uint256){
        return number;
    }

    function getVersion() external pure returns(uint256){
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override{}

    // This is used to reserve 50 storage slots for any further addition of storage variables
    // uint256[50] private _gap
}
