// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "./utils/IERC20.sol";
import { IERC721 } from "./utils/IERC721.sol";

contract AuctionFactory is Ownable {

	address public implementationContract;

	address[] public allClones;

	event NewClone(address _clone);

	constructor(address _implementation) {
		implementationContract = _implementation;
	}

	function createNewAuction(address _seller, IERC20 _protocol_token) payable external returns(address instance) {
		instance = Clones.clone(implementationContract);
		(bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address,IERC20)", _seller, _protocol_token));
		allClones.push(instance);
		emit NewClone(instance);
		return instance;
	}
}