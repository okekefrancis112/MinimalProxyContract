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

async function main() {
  const Escrow = await ethers.getContractFactory("Escrow");
  const escrow = await Escrow.deploy();
  await escrow.deployed();

  const EscrowProxyFactory = await ethers.getContractFactory("EscrowProxyFactory");
  const epf = await EscrowProxyFactory.deploy(escrow.address);
  await epf.deployed();

  console.log(escrow.address, "Escrow base contract address");
  console.log(epf.address, "Minimal Proxy Escrow Factory contract address");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

  // 0x62EDC54900a15543a84Dd760B5Ca5E0d49896a87 ........contract address
  // 0x7C8bd910Fab495E005428846DE302a1A04626569..........minimal proxy factory address
