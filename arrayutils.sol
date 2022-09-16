// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

contract ArrayUtils {
    function remove(int[] memory inputArray, uint index, uint maxIndex) internal view {
        if (index >= inputArray.length) return;

        for (uint i = index; i < maxIndex; i++){
            inputArray[i] = inputArray[i+1];
        }
        inputArray[maxIndex] = 0;
    }
}
