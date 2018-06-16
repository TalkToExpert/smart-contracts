var TalkToExpertToken = artifacts.require("./TalkToExpertToken.sol");
var TalkToExpertCrowdsale = artifacts.require("./TalkToExpertCrowdsale.sol");
var TalkToExpertPayment = artifacts.require("./TalkToExpertPayment.sol");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(TalkToExpertToken).then(() => {
    return deployer.deploy(TalkToExpertCrowdsale, accounts[0], 50000, accounts[0], TalkToExpertToken.address);
  }).then(() => {
    return deployer.deploy(TalkToExpertPayment, TalkToExpertToken.address);
  })
};