const Dogs = artifacts.require("Dogs");
const DogsUpdated = artifacts.require("DogsUpdated");
const Proxy = artifacts.require("Proxy");

module.exports = async function(deployer, network, accounts) {

  // Deploy Contracts
  const dogs = await Dogs.new();
  const proxy = await Proxy.new(dogs.address);
  
  // Create Proxy Dog to fool truffle
  var proxyDog = await Dogs.at(proxy.address);
  

  await proxyDog.setNumberOfDogs(10);

  var nbrOfDogs = await proxyDog.getNumberOfDogs();
  console.log(nbrOfDogs.toNumber());

  const dogsUpdated = await DogsUpdated.new();
  proxy.upgrade(dogsUpdated.address);
  

  proxyDog = await DogsUpdated.at(proxy.address);
  proxyDog.initialize(accounts[0]);

  await proxyDog.setNumberOfDogs(12);

  nbrOfDogs = await proxyDog.getNumberOfDogs();
  console.log(nbrOfDogs.toNumber());

};
