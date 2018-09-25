pragma solidity ^0.4.24;

import "./ERC223Receiver.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Basic.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract TalkToExpertPayment is ERC223Receiver, Ownable {

  address public tokenContract;
  uint256[][] public payments;

  event TokenFallback(uint256 userId, uint256 value);

  constructor(address _tokenContract) public Ownable() {
    tokenContract = _tokenContract;
  }

  function tokenFallback(address _sender, uint256 _value, bytes _extraData) external returns (bool ok) {
    require(msg.sender == tokenContract);
    uint256 userId = convertData(_extraData);
    payments.push([userId, _value]);
    emit TokenFallback(userId, _value);
    return true;
  }

  function convertData(bytes _data) internal pure returns (uint256) {
    uint256 payloadSize;
    uint256 payload;
    assembly {
      payloadSize := mload(_data)
      payload := mload(add(_data, 0x20))
    }
    payload = payload >> 8*(32 - payloadSize);
    return payload;
  }

  function getPaymentsLength() public constant returns (uint256) {
    return payments.length;
  }

   function getPayment(uint256 i) public constant returns (uint256[]) {
     return payments[i];
   }

  function withdrawal() public onlyOwner returns (bool) {
    ERC20Basic token = ERC20Basic(tokenContract);
    uint256 balance = token.balanceOf(this);
    token.transfer(msg.sender, balance);
    return true;
  }
}