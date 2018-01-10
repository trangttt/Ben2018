pragma solidity 0.4.18;

contract SimpleCoin {
    string public name;
    // state variable
    // each public variable has a default public getter
    address public owner;
    // 20 bytes value, 
    // public key for external account
    // hash ( sender address + nonce ) for contract account

    function SimpleCoin(string _name) public payable{
        name = _name;
        owner = msg.sender;
    }
    // *payable* contract can receive and hold funds
    // msg.sender (address): give you the address of sender
    // other values: 
    // msg.value (uint): amount of wei sent together with this contract
    // msg.data (bytes): complete call data

    function changeName(string _name) public {
        require (msg.sender == owner);
        name = _name;
    }
    // require( condition ): function for error handling. Used for valid conditions such as inputs, state variables, returned values from calls to external contract
    // assert ( condition ): check internal error and test internal variants.

    function balance() public view returns(uint ){
        return address(this).balance;
    }
    // address.balance: current balance of this account
    // view: indicates that function promises that it makes no change to the contract state
    // however, this is currently not enforced by solidity compiler
    
    function () payable public {}
    // fallback function: sole unnamed function with no argument, and returned value.
    // and to be executed when:
    // * none of other functions match the function identifier
    // * send plain Ether with no data


}
