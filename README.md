This is a contract written in Solidity programming language to implement an ERC20 token on the Ethereum blockchain. The contract has the following functionalities:

1- Initialization: The contract constructor sets the initial supply of the token, its name and symbol, and assigns the total supply to the address that deploys the contract.

2- Transfer: The transfer function allows one address to send tokens to another address. The function checks for sufficient balance, valid addresses and a positive value before executing the transfer.

3- Balance: The checkBalance function allows a user to check the balance of a specific address.

4- Approval: The approve function allows a user to grant another address the permission to transfer tokens on their behalf.

5- Transfer from: The transferFrom function enables the approved address to transfer tokens on behalf of the original user.

6- Allowance: The allowance function returns the approved transfer amount of a specific address.

7- Minting: The mint function allows the contract owner to add tokens to the total supply.

8- Burning: The burn function allows the contract owner to remove tokens from the total supply.

9 - Getters: The getName and getSymbol functions provide the name and symbol of the token, respectively.

10- Events: The Transfer and Approval events are emitted when a token transfer and approval occur, respectively.