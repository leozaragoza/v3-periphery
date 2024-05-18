// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.15;

import '../libraries/PoolAddress.sol';

contract PoolAddressTest {
    function POOL_INIT_CODE_HASH() external pure returns (bytes32) {
        return PoolAddress.POOL_INIT_CODE_HASH;
    }

    function POOL_INIT_CODE_HASH_0_7_6() external pure returns (bytes32) {
        return PoolAddress.POOL_INIT_CODE_HASH_0_7_6;
    }

    function computeAddress(
        address factory,
        address token0,
        address token1,
        uint24 fee
    ) external pure returns (address) {
        return PoolAddress.computeAddress(factory, PoolAddress.PoolKey({token0: token0, token1: token1, fee: fee}));
    }

    function computeAddressFor0_7_6(
        address factory,
        address token0,
        address token1,
        uint24 fee
    ) external pure returns (address) {
        return PoolAddress.computeAddressFor0_7_6(factory, PoolAddress.PoolKey({token0: token0, token1: token1, fee: fee}));
    }

    function getGasCostOfComputeAddress(
        address factory,
        address token0,
        address token1,
        uint24 fee
    ) external view returns (uint256) {
        uint256 gasBefore = gasleft();
        PoolAddress.computeAddress(factory, PoolAddress.PoolKey({token0: token0, token1: token1, fee: fee}));
        return gasBefore - gasleft();
    }

    function getGasCostOfComputeAddressFor0_7_6(
        address factory,
        address token0,
        address token1,
        uint24 fee
    ) external view returns (uint256) {
        uint256 gasBefore = gasleft();
        PoolAddress.computeAddressFor0_7_6(factory, PoolAddress.PoolKey({token0: token0, token1: token1, fee: fee}));
        return gasBefore - gasleft();
    }
}
