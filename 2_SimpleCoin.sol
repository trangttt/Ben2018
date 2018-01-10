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

    function SimpleCoin(string _name) payable public {
        name = _name;
    }


    function changeName(string _name) public ownerOnly {
        name =  _name;
    }
    
    function getBalance() public view returns(uint){
        return this.balance;
    }

    
    function () payable public {
    }


    function kill() ownerOnly public {
        selfdestruct(owner);
    }
    // used to clean up the contract when it is no longer in use
    // selfdestruct accept the only argument is the address
    // all remaning fund will be transfer to this address
}
