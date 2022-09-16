// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

import "./Search.sol";
import "./ArrayUtils.sol";

contract Sorts is Search, ArrayUtils {

    function getTestedArray() public view returns(string memory)  {
        return "[5,3,1,8,9,4,7,6,2]";
    }

    function bubbleSort(int[] calldata inputArray) external pure returns(int[] memory sortedArray) {
        int[] memory notSortedArray = inputArray;
        uint256 notSortedArrayLength = notSortedArray.length;
        
        if (notSortedArrayLength>1){
            for(uint i = 0; i < notSortedArrayLength; i++){
                for(uint j = 0; j < notSortedArrayLength - 1 ; j++){
                    if(notSortedArray[j] > notSortedArray[j+1]){
                        int tempInt = notSortedArray[j];
                        notSortedArray[j] = notSortedArray[j+1];
                        notSortedArray[j+1] = tempInt;
                    }
                }
            }
            sortedArray = notSortedArray;
        }else{
            sortedArray = inputArray;
        }
    }
    
    function insertionSort(int[] calldata inputArray) external pure returns(int[] memory sortedArray) {
        int[] memory notSortedArray = inputArray;
        uint256 notSortedArrayLength = notSortedArray.length;
        
        if (notSortedArrayLength>1){
            for(uint i = 1; i <= notSortedArrayLength - 1; i++){
                int moveInt = notSortedArray[i];
                if(moveInt < notSortedArray[i-1]){
                    uint j = i;
                    while(j > 0 && moveInt < notSortedArray[j-1]){
                        notSortedArray[j] = notSortedArray[j-1];
                        j--;
                    }
                    notSortedArray[j] = moveInt;        
                }                 
            }
            sortedArray = notSortedArray;
        }else{
            sortedArray = inputArray;
        }
    }
    
    function quickSort(int[] memory inputArray) external view returns(int[] memory sortedArray) {
        int[] memory notSortedArray = inputArray;
        quickSort(inputArray, uint(0), uint(inputArray.length - 1));
        sortedArray = notSortedArray;
    }
    
    function selectionSort(int[] memory inputArray) external view returns(int[] memory sortedArray) {
        sortedArray = new int[](inputArray.length);
        uint maxIndexOfArray = sortedArray.length-1;
        for (uint i = 0; i < sortedArray.length; i++){
            (int smallest, uint smallestIndex) = findSmallest(inputArray, maxIndexOfArray);
            sortedArray[i] = smallest;
            remove(inputArray, smallestIndex, maxIndexOfArray);
            if (maxIndexOfArray> 0){
                maxIndexOfArray--;   
            }
        }
    }
    
    function quickSort(int[] memory inputArray, uint left, uint right) internal view {
        uint i = left;
        uint j = right;
        if(i==j) return;
        int pivot = inputArray[right];
        while (i <= j) {
            while (inputArray[uint(i)] < pivot) i++;
            while (pivot < inputArray[uint(j)]) j--;
            if (i <= j) {
                (inputArray[uint(i)], inputArray[uint(j)]) = (inputArray[uint(j)], inputArray[uint(i)]);
                i++;
                j--;
            }
        }
        if (left < j)
            quickSort(inputArray, left, j);
        if (i < right)
            quickSort(inputArray, i, right);
    } 
}


