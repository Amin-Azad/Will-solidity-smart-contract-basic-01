// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract will{

    address owner;
    uint fortune;
    bool deceased;

    constructor() payable {
        owner=msg.sender; //who called the contract we set as owner
        fortune=msg.value;//msg value tells us how much value is being sent.
        deceased=false;

    }
    //creating modifire here to check only person who can call the contract is owner
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    //create a modifire so that only allowcate/funds will be transfers if owner is deceased.
    modifier mustBeDeceased{
        require(deceased==true);
        _;
    }
    //listy of family wallet
    address payable [] familywallet;

    //map through inheritance
    mapping (address=>uint) inheritance;

    //sset inheritance for each address

    function setIheritance(address payable  wallet, uint amount)public onlyOwner {

        //add wallet to the familywallet array. 

        familywallet.push(wallet);
        //set the amount for each wallet
        inheritance[wallet]=amount;
    }
    function payOut()private mustBeDeceased {
        for(uint i=0; i<familywallet.length;i++){
            familywallet[i].transfer(inheritance[familywallet[i]]);
        }
    }
    function hasDeceased() public onlyOwner{
        deceased=true;
        payOut();
    }

     

}