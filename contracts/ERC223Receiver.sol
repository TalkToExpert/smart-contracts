pragma solidity ^0.4.24;

contract ERC223Receiver {
  function tokenFallback(address _sender, uint _value, bytes _data) external returns (bool ok);
}