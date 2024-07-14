Thsi is a simple solidity smart contract about a will.
In this contract owner predefined (will) his fortunes to his family members.
Here i defined setIheritance function to add the owners family members waalet to familywallet array and this can only be done by owner we ensure it through a modifire called omnly owner.
The nex funtion is called payOut where we tranfer the amount as per defined by the owner through a loop and transfer. and this function will only run if the modifire "mustBeDeceased" fulfill the conditions.

