# RockBlock
Decentralized NGO funding 


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
    
