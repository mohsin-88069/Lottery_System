# Lottery System
This project is an implementation of Lottery system using smart contracts made in solidity and deployed on rinkeby faucet test network using metamask wallet.

## Working 
The manager of the lottery management will be the address which will deploy the contract.
All other participant of different address will transfer 1 ETH to the contract address at least one time.
A Random number will be generated using **keccak256** algorithm which will be modulo with the length of participants array size to generate the random index for the participant array to select the random winner.
Then all ETH of the contract will be sent to the selected winner.
