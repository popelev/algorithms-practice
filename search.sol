// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

// [1,2,3,4,5,6,7,8,9]
// [5,3,1,8,9,4,7,6,2]
 
contract Search {
    function binarySearch(int[] memory inputArray, int item) external pure returns(uint middle) {
        uint low = 0;
        uint hight = inputArray.length - 1;
        while (low <= hight){
            middle = (low + hight) / 2;
            int guess = inputArray[middle];
            if (guess  == item){
                return middle;
            }else if(guess > item){
                hight = middle - 1;
            }else{
                low = middle + 1;
            }
        }
        revert("Input array is not sorted");
    }
    
    function findSmallest(int[] memory inputArray, uint maxIndexOfArray) public pure returns(int smallest, uint smallestIndex) {
        smallest = inputArray[0];
        smallestIndex = 0;
        for(uint i = 1; i <= maxIndexOfArray; i++){
            if (inputArray[i] < smallest){
                smallest = inputArray[i];
                smallestIndex = i;
            }
        }
    }
}
