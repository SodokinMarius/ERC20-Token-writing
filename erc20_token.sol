// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// ERC20 Token Contract

contract MyToken {
    // Total supply of the token
    uint256 public totalSupply;

   //Token name
    string private name;

    //Token symbol
    string private symbol;
    
    // Mapping of addresses to their token balance
    mapping(address => uint256) public balanceOf;


//Allowance array
    mapping (address => mapping (address => uint256)) private allowed_track;

    
    // Event that gets emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    // Event that gets emitted when approval is granted
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    // Constructor function to initialize the contract and set the total supply
    constructor(string memory _name, string memory  _symbol,uint256 initialSupply)  {

        //checking the differents inputs
        require(initialSupply >=0,"Invalid Token amount");
        require(bytes(_name).length > 0, "Invalid Token name");
        require(bytes(_symbol).length > 0, "Invalid Token symbol");

        totalSupply = initialSupply;
        balanceOf[msg.sender] = totalSupply;

        name = _name;
        symbol = _symbol;

    }
    
    //Getter of Token name 

    function getName() public view returns(string memory)
    {
        return name;
    } 
    
     //Getter of Token symbole 

    function getSymbol() public view returns(string memory)
    {
        return symbol;
    }

    // Function to transfer tokens from one address to another
    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        require(to != address(0), "Invalid address");
        require(value > 0, "Invalid value");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    // Function to check the balance of a particular address
    function checkBalance(address who) public view returns (uint256) {
        return balanceOf[who];
    }
    
    // Function to approve another address to transfer tokens on behalf of the msg.sender
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "Invalid spender address");
        require(value > 0, "Invalid value");
        require(balanceOf[msg.sender] >= value, "Insufficient balance");

        allowed_track[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

      function allowance(
    address owner,
    address spender
   )
    public
    view
    returns (uint256)
  {
    return allowed_track[owner][spender];
  }
    
    // Function to transfer tokens on behalf of the msg.sender
    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(from != address(0), "Invalid from address");
        require(value > 0, "Invalid value");
        require(balanceOf[from] >= value, "Insufficient balance");
        require(to != address(0), "Invalid to address");
        allowed_track[from][msg.sender] -=value;
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
        return true;
    }


/*
   * Internal function that mints an amount of the token of a given
   * account.
   * @param a value that will be minted will be burnt.
   */
   
     function mint(uint value) internal {
        balanceOf[msg.sender] += value;
        totalSupply += value;
        emit Transfer(address(0), msg.sender, value);
    }


  /* function that will mint a value from the sender account
   * @param account The account whose tokens will be burnt.
   * @param amount The amount that will be burnt.
   */

    function burn(uint value) internal {
        balanceOf[msg.sender] -= value;
        totalSupply -= value;
        emit Transfer(msg.sender, address(0), value);
    }
}
