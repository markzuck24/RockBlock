pragma solidity ^0.5.0;

contract NGO {


    struct Donate {
        //uint purposeID;
        uint amount;
        address donorID;
        string description;
        //ItemStatus status;
    }
    
    struct Proposal {
       // uint purposeID;
        uint amount;
        address NgoID;
        address thirdParty;
        string description;
        //ItemStatus status;
    }

    event donationAdded(uint amount, address donorID,string description);
    event proposalAdded(uint amount, address NgoID,address thirdParty,string description);
    event ProposalApproved(uint proposalID, address donorID, address NgoID, address thirdParty);
    event FundsPulled(address thirdParty, uint amount);


    Donate[] private _donate;
    Proposal[] private _proposal;
    mapping (address => uint) public _pendingProposal;

    modifier onlyIfProposalExists(uint proposalID) {
        require(_proposal[proposalID].NgoID != address(0), "Proposal does not exist");
        _;
    }

    modifier onlyIfDonor(address donorID) {
        require(_donate[0].donorID == donorID, "Invalid Donor- only actual donor can approve!!");
        _;
    }
    
    
    function donateAmount(string memory description) public payable returns (uint) {

        _donate.push(Donate({
            //purposeID: purposeID,
            amount: msg.value,
            donorID: msg.sender,
            description: description
            //status: ItemStatus.active
        }));

        emit donationAdded(msg.value, msg.sender,description);
        // Item is pushed to the end, so the lenth is used for
        // the ID of the item
        return _donate.length - 1;
    }
    
    
    
        function addProposal(uint amount,address thirdParty,string memory description) public returns (uint) {

        _proposal.push(Proposal({
            //purposeID: purposeID,
            amount: amount,
            NgoID: msg.sender,
            thirdParty: thirdParty,
            description:description
            //status: ItemStatus.active
        }));

        emit proposalAdded(amount, msg.sender,thirdParty,description);
        // Item is pushed to the end, so the lenth is used for
        // the ID of the item
        return _proposal.length - 1;
    }
    
    

    function getProposal(uint proposalID) public view onlyIfProposalExists(proposalID)
    returns ( string memory, uint, address, address) {

        Proposal storage proposal = _proposal[proposalID];
        return (proposal.description, proposal.amount, proposal.NgoID, proposal.thirdParty);
    }
    
    

    

    function approveProposal(uint proposalID) public onlyIfDonor(msg.sender) {

        Proposal storage proposal = _proposal[proposalID];

        //require(currentItem.status == ItemStatus.active, "Item is not available");
        require(proposal.amount <= _donate[0].amount, "Required fund not available");
        _donate[0].amount=_donate[0].amount-proposal.amount;

        _pendingProposal[proposal.thirdParty] = proposal.amount;
    //    currentItem.status = ItemStatus.sold;

        emit ProposalApproved(proposalID, msg.sender, proposal.NgoID, proposal.thirdParty );
    }

    function pullFunds() public returns (bool) {
        require(_pendingProposal[msg.sender] > 0, "No pending withdrawals");

        uint funds = _pendingProposal[msg.sender];

        if (msg.sender.send(funds)) {
            emit FundsPulled(msg.sender, funds);
            _pendingProposal[msg.sender]=0;
            return true;
        } else {
            return false;
        }
        
    }
    
}
