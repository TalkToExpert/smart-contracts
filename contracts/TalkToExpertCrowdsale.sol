pragma solidity ^0.4.21;

import "openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol";

contract TalkToExpertCrowdsale is AllowanceCrowdsale {

  function TalkToExpertCrowdsale(address _tokenWallet, uint256 _rate, address _wallet, ERC20 _token)
    AllowanceCrowdsale(_tokenWallet)
    Crowdsale(_rate, _wallet, _token) {

  }

}