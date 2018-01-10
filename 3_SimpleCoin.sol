pragma solidity ^0.4.18;



contract Ownable {
    address public owner;
    
    function Ownable() public {
        owner = msg.sender;
    }

    modifier ownerOnly(){
        require ( msg.sender == owner );
        _;
    }
}

contract SimpleCoin is Ownable {
    string public name; 
    mapping(address => uint) public balances;

    function SimpleCoin(string _name) payable public {
        name = _name;
    }


    function changeName(string _name) public ownerOnly {
        name =  _name;
    }
    
    function balance() public view returns(uint){
        return address(this).balance;
    }

    
    function () payable public {
    }

    function kill() ownerOnly public {
        selfdestruct(owner);
    }

    function deposit() public payable {
        require( msg.value > 0 );
        balances[msg.sender] += msg.value;
    }

    function transferTo(address _to, uint _value) public {
        require ( balances[msg.sender] - _value > 0 );
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
    // An integer overflow error
    // try call TransferTo with current balance of msg.sender plus 1
    // fix: require(balances[msg.sender] > _value)
}
