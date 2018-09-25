pragma solidity ^0.4.24;

import "./Standard677Token.sol";

contract TalkToExpertToken is Standard677Token {
  string public name = "TalkToExpert Token";
  string public symbol = "TTE";
  uint256 public decimals = 18;
  uint256 public INITIAL_SUPPLY = 200000000 * (10 ** decimals);

  constructor() public {
    totalSupply_  = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}