pragma solidity ^0.4.21;

import "openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract TalkToExpertCrowdsale is AllowanceCrowdsale, Ownable {

  function TalkToExpertCrowdsale(address _tokenWallet, uint256 _rate, address _wallet, ERC20 _token)
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

}