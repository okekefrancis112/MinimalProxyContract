import { ethers } from "hardhat";

// async function main() {
//   const currentTimestampInSeconds = Math.round(Date.now() / 1000);
//   const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
//   const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;

//   const lockedAmount = ethers.utils.parseEther("1");

//   const Lock = await ethers.getContractFactory("Lock");
//   const lock = await Lock.deploy(unlockTime, { value: lockedAmount });

//   await lock.deployed();

//   console.log(`Lock with 1 ETH and unlock timestamp ${unlockTime} deployed to ${lock.address}`);
// }

// // We recommend this pattern to be able to use async/await everywhere
// // and properly handle errors.
// main().catch((error) => {
//   console.error(error);
//   process.exitCode = 1;
// });

// async function main() {
//   const Escrow = await ethers.getContractFactory("Escrow");
//   const escrow = await Escrow.deploy();
//   await escrow.deployed();

//   const EscrowProxyFactory = await ethers.getContractFactory("EscrowProxyFactory");
//   const epf = await EscrowProxyFactory.deploy(escrow.address);
//   await epf.deployed();

//   console.log(escrow.address, "Escrow base contract address");
//   console.log(epf.address, "Minimal Proxy Escrow Factory contract address");
// }

async function main() {

  const myAddr = "0x23d5C0bAdf63ff6422B5B9310211d9BcE147e720";
  const ipfsMetadataCid = "ipfs//QmQ21r7vt9PT78wKoGgoiopgYyegkMZTHs6QeXZchqQZZr"

  // const Auction = await ethers.getContractFactory("Auction");
  const Nft = await ethers.getContractFactory("Nft");

  // const auction = await Auction.deploy();
  const nft = await Nft.deploy();

  // await auction.deployed();
  await nft.deployed();
  const mint = await nft.safeMint(myAddr, ipfsMetadataCid);

  // Checking the number of NFT minted
  console.log("Checking Balance....");
  const balanceOF = await nft.balanceOf(myAddr);


  // const AuctionProxyFactory = await ethers.getContractFactory("AuctionProxyFactory");
  const NftProxyFactory = await ethers.getContractFactory("NftProxyFactory");

  // const apf = await AuctionProxyFactory.deploy(auction.address);
  const npf = await NftProxyFactory.deploy(nft.address);

  // await apf.deployed();
  await npf.deployed();

  // console.log(auction.address, "Auction base contract address");
  // console.log(apf.address, "Minimal Proxy Auction Factory contract address");

  console.log(nft.address, "Nft base contract address");
  console.log("You minted", mint);
  console.log("Number of NFTs: ", balanceOF);
  console.log(npf.address, "Minimal Proxy Nft Factory contract address");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

  // 0x62EDC54900a15543a84Dd760B5Ca5E0d49896a87 ........Escrow contract address
  // 0x7C8bd910Fab495E005428846DE302a1A04626569.......... Escrow minimal proxy factory address
