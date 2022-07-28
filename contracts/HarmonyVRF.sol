// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VRF {

    // Get VRF in bytes32
    function getVrf() public view returns (bytes32 result) {
        uint[1] memory bn;
        bn[0] = block.number;
        assembly {
        let memPtr := mload(0x40)
        if iszero(staticcall(not(0), 0xff, bn, 0x20, memPtr, 0x20)) {
            invalid()
        }
        result := mload(memPtr)

        }
    }

    // Convert the result of the getVRF function to uint256 and output random number
    function callVrf() public view returns (uint256) {
        bytes32 bytes32result = this.getVrf();
        uint256 uint256result = uint256(bytes32result);
        return uint256result;
    }
}