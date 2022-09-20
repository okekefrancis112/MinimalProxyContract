//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Escrow is Initializable {
	address public arbiter;
	address payable public beneficiary;
	address public depositor;

	bool public isApproved;

	function initialize(address _arbiter, address payable _beneficiary, address _depositor) public payable initializer {
		arbiter = _arbiter;
		beneficiary = _beneficiary;
		depositor = _depositor;
	}

	event Approved(uint);

	function releaseFunds() external {
		require(msg.sender == arbiter);
		uint balance = address(this).balance;
		beneficiary.transfer(balance);
		emit Approved(balance);
		isApproved = true;
	}
}