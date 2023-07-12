// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint[10] numbers; 
    
    constructor() {
        // Initialize the array with zeros
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    function optimizedFunction() public {

        uint[10] storage numArray = numbers;
        
        unchecked {
            
            for (uint i = 0; i < numArray.length; i++) {
                numArray[i] = 0;
            }
        }
    }
}
