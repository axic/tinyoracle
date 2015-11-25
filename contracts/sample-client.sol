//
// An example client calling our oracle service
//

import "api.sol";

contract SampleClient is usingTinyOracle {
  bytes public response;

  function __tinyOracleCallback(uint256 id, bytes _response) onlyFromTinyOracle external {
    response = _response;
  }

  function query() {
    string memory tmp = "hello world";
    query(bytes(tmp));
  }

  function query(bytes query) {
    queryTinyOracle(query);
  }
}
