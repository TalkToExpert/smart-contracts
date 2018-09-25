pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

 /*
  ERC677 additions to ERC20

  Interface wise is ERC20 + data paramenter to transferAndCall.
 */

/// @title ERC Token Standard #677 Interface (https://github.com/ethereum/EIPs/issues/677)
contract ERC677 is ERC20 {
  function transferAndCall(address to, uint value, bytes data) public returns (bool ok);

  event TransferAndCall(address indexed from, address indexed to, uint value, bytes data);
}