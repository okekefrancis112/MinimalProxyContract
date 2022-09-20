// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// contract AuctionFactory is Ownable {

// 	address public implementationContract;

// 	address[] public allClones;

// 	event NewClone(address _clone);

// 	constructor(address _implementation) {
// 		implementationContract = _implementation;
// 	}

// 	function createNewEscrow(address _arbiter, address payable _beneficiary, address _depositor) payable external returns(address instance) {
// 		instance = Clones.clone(implementationContract);
// 		(bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address,address,address)", _arbiter, _beneficiary, _depositor));
// 		allClones.push(instance);
// 		emit NewClone(instance);
// 		return instance;
// 	}
// }

contract NftProxyFactory is Ownable {

	address public implementationContract;

	address[] public allClones;

	event NewClone(address _clone);

	constructor(address _implementation) {
		implementationContract = _implementation;
	}

	// function createNewEscrow(address _arbiter, address payable _beneficiary, address _depositor) payable external returns(address instance) {
	// 	instance = Clones.clone(implementationContract);
	// 	(bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(address,address,address)", _arbiter, _beneficiary, _depositor));
	// 	allClones.push(instance);
	// 	emit NewClone(instance);
	// 	return instance;
	// }

	function createNewNft() payable external returns(address instance) {
		instance = Clones.clone(implementationContract);
		// (bool success, ) = instance.call{value: msg.value}(abi.encodeWithSignature("initialize(string,string)",));
		allClones.push(instance);

		emit NewClone(instance);
		return instance;
	}

}

// 0x52F998A93992C282c1Cb3e6251b1Be58C07ebd7E Nft base contract address

// 0x88399f9Ccba821eE775579ecC21EbAcd02F1BAaa Minimal Proxy Nft Factory contract address