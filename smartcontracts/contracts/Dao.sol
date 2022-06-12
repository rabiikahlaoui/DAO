// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IDaoContract {
    function balanceOf(address, uint256) external view returns (uint256);
}

contract Dao {

    address public owner;
    uint256 nextProposal;
    uint256[] public validTokens;
    IDaoContract daoContract;

    constructor() {
        owner = msg.sender;
        nextProposal = 1;
        daoContract = IDaoContract(0x88B48F654c30e99bc2e4A1559b4Dcf1aD93FA656);
        validTokens = [104802987843893205436826484023812508890415803588107625631480243944772390092810];
    }

    struct proposal {
        uint256 id;
        bool exists;
        string description;
        uint deadline;
        uint256 votesUp;
        uint256 votesDown;
        address[] canVote;
        uint256 maxVotes;
        mapping(address => bool) voteStatus;
        bool countConducted;
        bool passed;
    }

    mapping(uint256 => proposal) public Proposals;

    event proposalCreated(
        uint256 id,
        string description,
        uint256 maxVotes,
        address proposer
    );

    event newVote(
        uint256 votesUp,
        uint256 votesDown,
        address voter,
        uint256 proposal,
        bool votedFor
    );

    event proposalCount(
        uint256 id,
        bool passed
    );

}
