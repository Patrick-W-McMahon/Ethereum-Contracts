pragma solidity ^0.4.0;

contract TicketMultiTear {
    address public owner;
    string ticketName;
    
    struct Tear {
        string name;
    }
    
    struct TicketHolder {
        mapping(address => Tear) public ticketTypes;
    }
    
    Tear[] public tears;
    
    mapping(address => TicketHolder) public ticketHolders;
    
    function TicketMultiTear(string _ticketName, string[] _tearName, uint[] _startingTickets) {
        owner = msg.sender;
        ticketName = _ticketName;
        for (uint i = 0; i < _tearName.length; i++) {
            tears.push(Tear({
                name: _tearName[i],
            }));
            ticketHolders[owner].push(ticketHolder({
                ticketTypes[i] = _startingTickets[i]
            }));
        }
    }
    
    function transfer(address _to, string _tear, uint _value) returns (bool _success) {
        if (ticketHolders[msg.sender].ticketTypes[_tear] < _value) {
            return false;
        }
        tickets[msg.sender].ticketTypes[_tear] -= _value;
        tickets[_to].ticketTypes[_tear] += _value;
        return true;
    }
    
    function getTicketCount(address _user, string _tear) constant returns (uint _ticketCount) {
        return tickets[_user].ticketTypes[_tear];
    }
}
