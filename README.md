# RockBlock



Team: RockBlock

Our Project: Decentralised NGO Funding

Our Project is designed to develop and promote charity through cryptocurrencies crowdfunding. 

Reason of project:


1)	There is need to rebuild trust so that people can safely donate to charity and can validate that their money is used for what it’s meant for. [Money donated is used judiciously]
2)	Many of these Non-Profit Organisations don’t have access to many donors, and are not very skilled in marketing their campaigns. This Project is giving them a chance to receive funding from global donors.
Blockchain donations are easy, global, quick.

We have currently considered, only 1 donor. That is NGO is able to send funds to third party from one donor only.

Future scope: NGO will be able to fund a project from many donors and lots of other functionalities that we were not able to implement 
in this short span of time, as this being our first solidity project.


Steps:

1) donateAmount: 
  Caller: Donor
    Donor calls this to donate a specific amount for a specific purpose.
    
2) addProposal: 
  Caller: NGO
    NGO calls this to add a proposal with specific amount, thirdparty address and purpose.
    
3) getProposal: 
  Caller: Donor 
    Donor calls this to check the available proposals so that he could donate by validating the thrid party.
    
4) approveProposal: 
  Caller: Donor (who donated for that specific purpose)
    Donor calls this to approve his donation to a particular proposal and once approved, the amount will get deducted from his donation amount
   
 5) pullFunds: 
  Caller: Third Party (no one else)
    Third Party calls this to pull the funds that has been approved to its address.
    
