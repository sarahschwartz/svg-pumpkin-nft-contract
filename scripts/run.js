const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('PumpkinNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
  
    let txn = await nftContract.makeAnEpicNFT()
    await txn.wait()
    console.log("Minted NFT #1")
  
    txn = await nftContract.makeAnEpicNFT()
    await txn.wait()
  console.log("Minted NFT #2")
  
  txn = await nftContract.makeAnEpicNFT()
    await txn.wait()
  console.log("Minted NFT #3")
  
  txn = await nftContract.makeAnEpicNFT()
    await txn.wait()
    console.log("Minted NFT #4")
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();
  