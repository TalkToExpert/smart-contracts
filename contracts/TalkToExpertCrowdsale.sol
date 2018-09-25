pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract TalkToExpertCrowdsale is AllowanceCrowdsale, Ownable {

  constructor(address _tokenWallet, uint256 _rate, address _wallet, ERC20 _token) public
    AllowanceCrowdsale(_tokenWallet)
    Crowdsale(_rate, _wallet, _token) {

  }

  function setTokenWallet(address _tokenWallet) public onlyOwner returns (bool) {
    require(_tokenWallet != address(0));
    tokenWallet = _tokenWallet;
    return true;
  }

  function setEtherWallet(address _wallet) public onlyOwner returns (bool) {
    require(_wallet != address(0));
    wallet = _wallet;
    return true;
  }

  function setRate(uint256 _rate) public onlyOwner returns (bool) {
    require(_rate > 0);
    rate = _rate;
    return true;
  }

}