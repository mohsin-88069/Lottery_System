// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 < 0.9.0;

// Deployed on rinkeby faucet

contract Lottery {
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    // receive can only be used once for a contract
    receive() external payable {
        require(msg.value == 1 ether);
        participants.push(payable(msg.sender));
    }

    // function for checking total amount in the lottery
    function getBalance() public view returns(uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint) {
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    // function which will select random winner
    function selectWinner() public  {
        require(msg.sender == manager);
        require(participants.length >= 3);
        
        uint index = random() % participants.length;

        address payable winner;

        winner = participants[index];
        
        winner.transfer(getBalance());

        participants = new address payable[](0);
    }
}