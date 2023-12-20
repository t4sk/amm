// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/Math.sol";
import {Pool} from "../src/Pool.sol";
import {Aux} from "../src/Aux.sol";

contract SimTest is Test {
    Pool private pool;
    Aux private aux;

    function setUp() public {
        pool = new Pool(0.7 * 1e5, 0.0001 * 1e18);
        aux = new Aux();
    }

    function test() public {
        {
            (uint256 lp, uint256 f0, uint256 f1) =
                pool.add_liquidity(1e18, 1e6, 0);
            console.log("f0", f0);
            console.log("f1", f1);
            console.log("lp", lp);
        }
        {
            (uint256 lp, uint256 f0, uint256 f1) =
                pool.add_liquidity(1e18, 0, 0);
            console.log("f0", f0);
            console.log("f1", f1);
            console.log("lp", lp);
        }
        {
            (uint256 lp, uint256 f0, uint256 f1) = pool.add_liquidity(0, 1e6, 0);
            console.log("f0", f0);
            console.log("f1", f1);
            console.log("lp", lp);
        }
        {
            (uint256 lp, uint256 f0, uint256 f1) =
                pool.add_liquidity(1e18, 1e6, 0);
            console.log("f0", f0);
            console.log("f1", f1);
            console.log("lp", lp);
        }

        uint256 dx = 1e18;
        uint256 min_dy = 0.99 * 1e6;
        bool zero_for_one = true;

        uint256 dy = aux.swap(address(pool), dx, min_dy, true);
        console.log("DY", dy);
    }
}