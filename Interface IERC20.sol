// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);

function totalSupply() external view returns (uint256);

function balanceOf(address account) external view returns (uint256);

function transfer(address to, uint256 value) external returns (bool);

function allowance(address owner, address spender) external view returns (uint256);

function approve(address spender, uint256 value) external returns (bool);

function transferFrom(address from, address to, uint256 value) external returns (bool);
}


contract MYtoken is IERC20{

    address public founder;
    uint public totalSupply=1000;
    mapping(address=>uint) public balanceOfuser;
    mapping (address=>mapping(address=>uint)) allowedToken;
    uint public decimals=0;

    constructor(){
        founder=msg.sender;
        balanceOfuser[founder]=totalSupply;
    }

    function balanceOf(address account) external view returns (uint256){
        return  balanceOfuser[account];
    }

function transfer(address to, uint256 value) external returns (bool){
require(to!=address(0),"Invalid addresss");
require(balanceOfuser[msg.sender]>=value, "Insufficient balance");
balanceOfuser[msg.sender]-=value;
balanceOfuser[to]+=value;
emit Transfer(msg.sender, to, value);
return true;
}

function allowance(address owner, address spender) external view returns (uint256){
return allowedToken[owner][spender];
}

function approve(address spender, uint256 value) external returns (bool){
require(spender!=address(0),"Invalid addresss");
require(balanceOfuser[msg.sender]>=value, "Insufficient balance");
allowedToken[msg.sender][spender] = value;
emit Approval(msg.sender,spender,value);
return true; 
}


function transferFrom(address from, address to, uint256 value) external returns (bool){
require(to==msg.sender,"Not authorised");
require(to!=address(0),"Invalid addresss");
require(from!=address(0),"Invalid addresss");
require(balanceOfuser[msg.sender]>=value, "Insufficient balance");
require(allowedToken[from][to]>=value,"Insufficient balance");
allowedToken[from][to]-=value;
balanceOfuser[from]-=value;
balanceOfuser[to]+=value;
emit Transfer(from,to,value);
return true;
 }
}