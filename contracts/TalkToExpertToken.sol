pragma solidity ^0.4.21;

import "./Standard677Token.sol";

contract TalkToExpertToken is Standard677Token {
  string public name = "TalkToExpert Token";
  string public symbol = "TTE";
  uint public decimals = 18;
  uint public INITIAL_SUPPLY = 200000000 * (10 ** decimals);

  function TalkToExpertToken() {
    totalSupply_  = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}