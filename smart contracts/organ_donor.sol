pragma solidity ^0.4.4;
//contract to store donor details
//by Aditya Sahu
contract Donor_Record{
    
    
    struct DonorRecord{
        uint64 uid; 	//unique id for donor
        string datetime; 	//store date and time
        string organ;		//organ name stored as a string

    }
    mapping(uint256 => Record) public records; //map(keyvalue=>value
    struct Donor{
        uint64 uid;
        string birthdate;
        uint16 height;
        uint16 weight;
        string btype; 
        uint128[] recindex;
    }
    mapping(uint64 => Donor) public donors;
    function createDonor(uint64 uid )public returns (bool){
        
        donors[uid].uid= uid;
        return true;
    }
    function updateDonor(uint64 uid,string birthdate,uint16 height,uint16 weight,string btype)public returns(bool){
        
        donors[uid].birthdate = birthdate;
        donors[uid].height = height;
        donors[uid].weight = weight;
        donors[uid].btype = btype;
        return true;
    }
    function createDonorRecord(uint64 uid,uint64 rid,string datetime,string organ)public returns (bool){
        
        uint128 realrid = uid+rid;
        records[realrid].datetime = datetime;
        records[realrid].organ = organ;
        donors[uid].recindex.push(realrid);
        return true;       
    }  
    function getdonor(uint64 uid )public constant returns (Donor){
       return donors[uid];
       
    }
    function getdonorrecords(uint64 uid )public constant returns (uint128[]){
    
       return donors[uid].recindex;
       
    }
    function getdonorrecords(uint128 rid )public constant returns (Record){
            return records[rid];
       
       
    }

    function Donor_Record(string _greeting) public {
       return;
    }
}
