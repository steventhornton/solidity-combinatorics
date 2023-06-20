// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Combinatorics.sol";

contract CombinatoricsTest is Test {

    
    function setUp() public {
    }

    function test_factorial() public {
        assertEq(Combinatorics.factorial(0), 1);
        assertEq(Combinatorics.factorial(1), 1);
        assertEq(Combinatorics.factorial(2), 2);
        assertEq(Combinatorics.factorial(3), 6);
        assertEq(Combinatorics.factorial(4), 24);
        assertEq(Combinatorics.factorial(10), 3628800);
    }

    function test_numCombinations() public {
        assertEq(Combinatorics.numCombinations(1, 0), 1);
        assertEq(Combinatorics.numCombinations(1, 1), 1);

        assertEq(Combinatorics.numCombinations(2, 0), 1);
        assertEq(Combinatorics.numCombinations(2, 1), 2);
        assertEq(Combinatorics.numCombinations(2, 2), 1);

        assertEq(Combinatorics.numCombinations(3, 0), 1);
        assertEq(Combinatorics.numCombinations(3, 1), 3);
        assertEq(Combinatorics.numCombinations(3, 2), 3);
        assertEq(Combinatorics.numCombinations(3, 3), 1);


        assertEq(Combinatorics.numCombinations(4, 0), 1);
        assertEq(Combinatorics.numCombinations(4, 1), 4);
        assertEq(Combinatorics.numCombinations(4, 2), 6);
        assertEq(Combinatorics.numCombinations(4, 3), 4);
        assertEq(Combinatorics.numCombinations(4, 4), 1);
    }

    function test_combinations() public {

        bytes32[] memory list = new bytes32[](4);
        list[0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000a);
        list[1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000b);
        list[2] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000c);
        list[3] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000d);
        
        bytes32[][] memory expectedResult = new bytes32[][](6);
        for (uint256 i = 0; i < 6; i++) {
            expectedResult[i] = new bytes32[](2);
        }
        expectedResult[0][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000a);
        expectedResult[0][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000b);
        expectedResult[1][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000a);
        expectedResult[1][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000c);
        expectedResult[2][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000a);
        expectedResult[2][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000d);
        expectedResult[3][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000b);
        expectedResult[3][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000c);
        expectedResult[4][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000b);
        expectedResult[4][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000d);
        expectedResult[5][0] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000c);
        expectedResult[5][1] = bytes32(0x000000000000000000000000000000000000000000000000000000000000000d);

        bytes32[][] memory result = Combinatorics.combinations(list, 2);

        assertEq(expectedResult[0][0], result[0][0]);
        assertEq(expectedResult[0][1], result[0][1]);
        assertEq(expectedResult[1][0], result[1][0]);
        assertEq(expectedResult[1][1], result[1][1]);
        assertEq(expectedResult[2][0], result[2][0]);
        assertEq(expectedResult[2][1], result[2][1]);
        assertEq(expectedResult[3][0], result[3][0]);
        assertEq(expectedResult[3][1], result[3][1]);
        assertEq(expectedResult[4][0], result[4][0]);
        assertEq(expectedResult[4][1], result[4][1]);
        assertEq(expectedResult[5][0], result[5][0]);
        assertEq(expectedResult[5][1], result[5][1]);

    }

    function test_combinations2() public {

        bytes32[] memory list = new bytes32[](4);
        list[0] = bytes32(0x5b3ddfc0a421eefefb0821460e6ce6967169dc94dbc3133aca1bdd7183270510);
        list[1] = bytes32(0x5d4ddd34e83f0baf3e7f2edeb132eba926abd260feab666e5f1cf20f0c231e51);
        list[2] = bytes32(0x62a0ba2cbe67d93997d9e086a1abc8d850ce6e0d1461de6066d316afdb047409);
        list[3] = bytes32(0xd37a260066ce769b28e1b5d03de78c8b663254e0189322b2cc8f7192de580cd2);
        
        bytes32[][] memory expectedResult = new bytes32[][](4);
        for (uint256 i = 0; i < 4; i++) {
            expectedResult[i] = new bytes32[](3);
        }
        expectedResult[0][0] = bytes32(0x5b3ddfc0a421eefefb0821460e6ce6967169dc94dbc3133aca1bdd7183270510);
        expectedResult[0][1] = bytes32(0x5d4ddd34e83f0baf3e7f2edeb132eba926abd260feab666e5f1cf20f0c231e51);
        expectedResult[0][2] = bytes32(0x62a0ba2cbe67d93997d9e086a1abc8d850ce6e0d1461de6066d316afdb047409);

        expectedResult[1][0] = bytes32(0x5b3ddfc0a421eefefb0821460e6ce6967169dc94dbc3133aca1bdd7183270510);
        expectedResult[1][1] = bytes32(0x5d4ddd34e83f0baf3e7f2edeb132eba926abd260feab666e5f1cf20f0c231e51);
        expectedResult[1][2] = bytes32(0xd37a260066ce769b28e1b5d03de78c8b663254e0189322b2cc8f7192de580cd2);

        expectedResult[2][0] = bytes32(0x5b3ddfc0a421eefefb0821460e6ce6967169dc94dbc3133aca1bdd7183270510);
        expectedResult[2][1] = bytes32(0x62a0ba2cbe67d93997d9e086a1abc8d850ce6e0d1461de6066d316afdb047409);
        expectedResult[2][2] = bytes32(0xd37a260066ce769b28e1b5d03de78c8b663254e0189322b2cc8f7192de580cd2);

        expectedResult[3][0] = bytes32(0x5d4ddd34e83f0baf3e7f2edeb132eba926abd260feab666e5f1cf20f0c231e51);
        expectedResult[3][1] = bytes32(0x62a0ba2cbe67d93997d9e086a1abc8d850ce6e0d1461de6066d316afdb047409);
        expectedResult[3][2] = bytes32(0xd37a260066ce769b28e1b5d03de78c8b663254e0189322b2cc8f7192de580cd2);

        bytes32[][] memory result = Combinatorics.combinations(list, 3);

        for (uint256 i = 0; i < list.length; i++) {
            for (uint256 j = 0; j < 3; j++) {
                assertEq(expectedResult[i][j], result[i][j]);
            }
        }
    }

    function test_product() public {

        bool[] memory list = new bool[](2);
        list[0] = true;
        list[1] = false;
        
        bool[][] memory expectedResult = new bool[][](8);
        for (uint256 i = 0; i < 8; i++) {
            expectedResult[i] = new bool[](3);
        }
        expectedResult[0][0] = true;
        expectedResult[0][1] = true;
        expectedResult[0][2] = true;

        expectedResult[1][0] = true;
        expectedResult[1][1] = true;
        expectedResult[1][2] = false;

        expectedResult[2][0] = true;
        expectedResult[2][1] = false;
        expectedResult[2][2] = true;

        expectedResult[3][0] = true;
        expectedResult[3][1] = false;
        expectedResult[3][2] = false;

        expectedResult[4][0] = false;
        expectedResult[4][1] = true;
        expectedResult[4][2] = true;

        expectedResult[5][0] = false;
        expectedResult[5][1] = true;
        expectedResult[5][2] = false;

        expectedResult[6][0] = false;
        expectedResult[6][1] = false;
        expectedResult[6][2] = true;

        expectedResult[7][0] = false;
        expectedResult[7][1] = false;
        expectedResult[7][2] = false;

        bool[][] memory result = Combinatorics.product(list, 3);

        for (uint256 i = 0; i < 8; i++) {
            for (uint256 j = 0; j < 3; j++) {
                assertEq(expectedResult[i][j], result[i][j]);
            }
        }
    }

}
