// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.15;

contract Sorts {
    function bubbleSort(int[] calldata inputArray) external pure returns(int[] memory sortedArray) {
        int[] memory notSortedArray = inputArray;
        uint256 notSortedArrayLength = notSortedArray.length;
        
        if (notSortedArrayLength>1){
            for(uint i = 0; i < notSortedArrayLength; i++){
                for(uint j = 0; j < notSortedArrayLength - 1 ; j++){
                    if(notSortedArray[j]> notSortedArray[j+1]){
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
}

//[5,3,1,8,9,4,7,6,2]
