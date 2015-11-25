//
// This is the API file to be included by a user of this oracle
//

// This must match the signature in dispatch.sol
contract TinyOracle {
  function query(bytes _query) returns (uint256 id);
}

// This must match the signature in lookup.sol
contract TinyOracleLookup {
  function getQueryAddress() constant returns (address);
  function getResponseAddress() constant returns (address);
}

// The actual part to be included in a client contract
contract usingTinyOracle {
  address constant lookupContract = 0x0;

  modifier onlyFromTinyOracle {
    TinyOracleLookup lookup = TinyOracleLookup(lookupContract);
    if (msg.sender != lookup.getResponseAddress())
      throw;
    _
  }

  function queryTinyOracle(bytes query) internal returns (uint256 id) {
    TinyOracleLookup lookup = TinyOracleLookup(lookupContract);
    TinyOracle tinyOracle = TinyOracle(lookup.getQueryAddress());
    return tinyOracle.query(query);
  }
}
