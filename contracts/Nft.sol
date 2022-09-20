//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

// import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// contract Escrow is Initializable {
// 	address public arbiter;
// 	address payable public beneficiary;
// 	address public depositor;

// 	bool public isApproved;

// 	function initialize(address _arbiter, address payable _beneficiary, address _depositor) public payable initializer {
// 		arbiter = _arbiter;
// 		beneficiary = _beneficiary;
// 		depositor = _depositor;
// 	}

// 	event Approved(uint);

// 	function releaseFunds() external {
// 		require(msg.sender == arbiter);
// 		uint balance = address(this).balance;
// 		beneficiary.transfer(balance);
// 		emit Approved(balance);
// 		isApproved = true;
// 	}
// }




contract Nft is Initializable, ERC721("Francis", "FRN"), ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _myCounter;
    uint256 constant MAX_SUPPLY = 10;
    string NftName;
    string NftSymbol;

    event SafeMint(address indexed to, uint indexed tokenId, string uri);
    event Burnt(uint tokenId);

    // constructor() ERC721("Francis", "FRN") {}
    function initialize() public {
        NftName = "Francis";
        NftSymbol = "FRN";
    }


    function safeMint(address to, string memory uri) public {

        uint256 tokenId = _myCounter.current();
        require(tokenId <= MAX_SUPPLY, "Sorry, all NFTs have been minted!");
        _myCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        emit SafeMint(to, tokenId, uri);
    }

	function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);

        emit Burnt(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

}

// 0xB72705c99DF57aE0B4aedD0B20a69D809db9136E Nft base contract address

// 0x95fE72a9a532701ED966Afd66d22feb39c68ef73 Minimal Proxy Nft Factory contract address