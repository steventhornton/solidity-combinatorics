// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/**
 * @title Algorithms for combinatorics
 * @author Steven E. Thornton
 * @notice This library should only ever be used for testing. Many of these functions will
 * be extremely expensive to run in production.
 * @dev The implementations have not been optimized. Many of the functions could easily be
 * optimized.
 */
library Combinatorics {

    /**
     * @notice Calculate the factorial of an integer
     * @param n Value to compute the factorial of
     * @return n!
     */
    function factorial(uint256 n) internal pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = n; i > 1; i--) {
            result *= i;
        }
        return result;
    }

    /**
     * @notice Compute the number of combinations of size r from a population of size n.
     * @param n Population size
     * @param r Subset size
     * @return nCr = n! / (r!(n-r)!)
     */
    function numCombinations(uint256 n, uint256 r) internal pure returns (uint256) {
        require(n >= r);
        return factorial(n) / (factorial(r) * factorial(n - r));
    }


    /**
     * @notice Compute the number of permuations of size r from a population of size n
     * maintaining the original order.
     * @param n Population size
     * @param r Subset size
     * @return nPr = n! / (n-r)!
     */
    function numPermutations(uint256 n, uint256 r) internal pure returns (uint256) {
        require(n >= r);
        return factorial(n) / (factorial(n - r));
    }

    /**
     * @notice Compute all combinations of a list of values of a given size.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param r Subset size
     * @return A list of lists where the sublists are combinations of `list`. The length of the
     * output array is `numCombinations(list.length, r)`.
     */
    function combinations(bytes32[] memory list, uint256 r) internal pure returns (bytes32[][] memory) {

        require(r > 0, "Sample size must be non-zero");

        // Length of the result
        uint256 numComb = numCombinations(list.length, r);

        // Initialize the output array
        bytes32[][] memory result = new bytes32[][](numComb);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numComb; i++) {
            result[i] = new bytes32[](r);
        }

        // Base case
        if (r == 1) {
            // Result is [[list[0]], [list[1]], ...]
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Note: list.length is guaranteed to be at least 2 due to the above base case
        for (uint256 i = 0; i <= list.length - r; i++) {

            // Generate a list that contains: [list[i+1], list[i+2], ...]
            bytes32[] memory subList = new bytes32[](list.length - i - 1);
            for (uint256 j = 0; j < list.length - i - 1; j++) {
                subList[j] = list[i + j + 1];
            }

            // Get all combinations of subList of size num - 1 (recursive call)
            bytes32[][] memory subCombinations = combinations(subList, r - 1);

            // Combine list[i] with subCombinations into new lists
            for (uint256 j = 0; j < subCombinations.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < r - 1; k++) {
                    result[resultIndex][k + 1] = subCombinations[j][k];
                }
                resultIndex++;
            }
        }

        return result;
        
    }

    /**
     * @notice Compute all combinations of a list of values of a given size.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param r Subset size
     * @return A list of lists where the sublists are combinations of `list`. The length of the
     * output array is `numCombinations(list.length, r)`.
     */
    function combinations(uint256[] memory list, uint256 r) internal pure returns (uint256[][] memory) {

        require(r > 0, "Sample size must be non-zero");

        // Length of the result
        uint256 numComb = numCombinations(list.length, r);

        // Initialize the output array
        uint256[][] memory result = new uint256[][](numComb);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numComb; i++) {
            result[i] = new uint256[](r);
        }

        // Base case
        if (r == 1) {
            // Result is [[list[0]], [list[1]], ...]
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Note: list.length is guaranteed to be at least 2 due to the above base case
        for (uint256 i = 0; i <= list.length - r; i++) {

            // Generate a list that contains: [list[i+1], list[i+2], ...]
            uint256[] memory subList = new uint256[](list.length - i - 1);
            for (uint256 j = 0; j < list.length - i - 1; j++) {
                subList[j] = list[i + j + 1];
            }

            // Get all combinations of subList of size num - 1 (recursive call)
            uint256[][] memory subCombinations = combinations(subList, r - 1);

            // Combine list[i] with subCombinations into new lists
            for (uint256 j = 0; j < subCombinations.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < r - 1; k++) {
                    result[resultIndex][k + 1] = subCombinations[j][k];
                }
                resultIndex++;
            }
        }

        return result;
        
    }

       /**
     * @notice Compute all combinations of a list of values of a given size.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param r Subset size
     * @return A list of lists where the sublists are combinations of `list`. The length of the
     * output array is `numCombinations(list.length, r)`.
     */
    function combinations(bool[] memory list, uint256 r) internal pure returns (bool[][] memory) {

        require(r > 0, "Sample size must be non-zero");

        // Length of the result
        uint256 numComb = numCombinations(list.length, r);

        // Initialize the output array
        bool[][] memory result = new bool[][](numComb);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numComb; i++) {
            result[i] = new bool[](r);
        }

        // Base case
        if (r == 1) {
            // Result is [[list[0]], [list[1]], ...]
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Note: list.length is guaranteed to be at least 2 due to the above base case
        for (uint256 i = 0; i <= list.length - r; i++) {

            // Generate a list that contains: [list[i+1], list[i+2], ...]
            bool[] memory subList = new bool[](list.length - i - 1);
            for (uint256 j = 0; j < list.length - i - 1; j++) {
                subList[j] = list[i + j + 1];
            }

            // Get all combinations of subList of size num - 1 (recursive call)
            bool[][] memory subCombinations = combinations(subList, r - 1);

            // Combine list[i] with subCombinations into new lists
            for (uint256 j = 0; j < subCombinations.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < r - 1; k++) {
                    result[resultIndex][k + 1] = subCombinations[j][k];
                }
                resultIndex++;
            }
        }

        return result;
        
    }

    // TODO
    // function permutations(bytes32[] memory list, uint256 r) internal pure returns (bytes32[][] memory) 

    /**
     * @notice Cartesian product or an array with itself `repeat` times.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param repeat Size of result
     * @return A list of lists where the sublists are combinations of the values in the input list
     * of length `repeat`. The length of the output array is `list.length**repeat`.
     */
    function product(bytes32[] memory list, uint256 repeat) internal pure returns (bytes32[][] memory) {
        
        require(repeat > 0, "Number of repeat must be non-zero");

        // Length of the result
        uint256 numSamples = list.length**repeat;

        // Initialize the output array
        bytes32[][] memory result = new bytes32[][](numSamples);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numSamples; i++) {
            result[i] = new bytes32[](repeat);
        }

        // Base case
        if (repeat == 1) {
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Do this recursively :(
        for (uint256 i = 0; i < list.length; i++) {

            bytes32[][] memory subResult = product(list, repeat - 1);

            // Combine subResult with list[i]
            for (uint256 j = 0; j < subResult.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < repeat - 1; k++) {
                    result[resultIndex][k + 1] = subResult[j][k];
                }
                resultIndex++;
            }
        }

        return result;
        
    }

    /**
     * @notice Cartesian product or an array with itself `repeat` times.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param repeat Size of result
     * @return A list of lists where the sublists are combinations of the values in the input list
     * of length `repeat`. The length of the output array is `list.length**repeat`.
     */
    function product(uint256[] memory list, uint256 repeat) internal pure returns (uint256[][] memory) {
        
        require(repeat > 0, "Number of repeat must be non-zero");

        // Length of the result
        uint256 numSamples = list.length**repeat;

        // Initialize the output array
        uint256[][] memory result = new uint256[][](numSamples);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numSamples; i++) {
            result[i] = new uint256[](repeat);
        }

        // Base case
        if (repeat == 1) {
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Do this recursively :(
        for (uint256 i = 0; i < list.length; i++) {

            uint256[][] memory subResult = product(list, repeat - 1);

            // Combine subResult with list[i]
            for (uint256 j = 0; j < subResult.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < repeat - 1; k++) {
                    result[resultIndex][k + 1] = subResult[j][k];
                }
                resultIndex++;
            }
        }

        return result;
        
    }

    /**
     * @notice Cartesian product or an array with itself `repeat` times.
     * @dev This function calls iself recursively
     * @param list A list of values
     * @param repeat Size of result
     * @return A list of lists where the sublists are combinations of the values in the input list
     * of length `repeat`. The length of the output array is `list.length**repeat`.
     */
    function product(bool[] memory list, uint256 repeat) internal pure returns (bool[][] memory) {
        
        require(repeat > 0, "Number of repeat must be non-zero");

        // Length of the result
        uint256 numSamples = list.length**repeat;

        // Initialize the output array
        bool[][] memory result = new bool[][](numSamples);
        uint256 resultIndex = 0;
        for (uint256 i = 0; i < numSamples; i++) {
            result[i] = new bool[](repeat);
        }

        // Base case
        if (repeat == 1) {
            for (uint256 i = 0; i < list.length; i++) {
                result[i][0] = list[i];
            }
            return result;
        }

        // Do this recursively :(
        for (uint256 i = 0; i < list.length; i++) {

            bool[][] memory subResult = product(list, repeat - 1);

            // Combine subResult with list[i]
            for (uint256 j = 0; j < subResult.length; j++) {
                // Concatenate the lists
                result[resultIndex][0] = list[i];
                for (uint256 k = 0; k < repeat - 1; k++) {
                    result[resultIndex][k + 1] = subResult[j][k];
                }
                resultIndex++;
            }
        }

        return result;

    }

}
