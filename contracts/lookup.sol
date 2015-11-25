//
// The lookup contract for storing both the query and responder addresses
//

contract TinyOracleLookup {
  address owner;
  address query;
  address response;

  modifier owneronly { if (msg.sender == owner) _ }

  function setOwner(address _owner) owneronly {
    owner = _owner;
  }

  function TinyOracleLookup() {
    owner = msg.sender;
  }

  function setQueryAddress(address addr) owneronly {
    query = addr;
  }

  function getQueryAddress() constant returns (address) {
    return query;
  }

  function setResponseAddress(address addr) owneronly {
    response = addr;
  }

  function getResponseAddress() constant returns (address) {
    return response;
  }

  function kill() owneronly {
    suicide(msg.sender);
  }
}
