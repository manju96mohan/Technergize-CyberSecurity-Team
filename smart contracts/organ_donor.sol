pragma solidity ^0.4.4;
//contract to store donor details
//by Aditya Sahu
contract Donor_Record{
    struct DonorRecord {
        uint64 uid; 	//unique id for donor
        string datetime; 	//store date and time
        string organ;	//organ name stored as a string
        uint timestamp;  //timestamp for blockchain
    }
    mapping(uint256 => DonorRecord) public records; //change1, map(keyvalue=>value) 
    struct Donor{
        uint64 uid;
        string name;
        string birthdate;
        uint16 height;
        uint16 weight;
        string btype; 
        uint128[] recindex;
    }
    mapping(uint64 => Donor) public donors;
    function createDonor(uint64 uniqueid )public returns (bool){
        
        var d=donors[uniqueid];
        d.uid= uniqueid;
        return true;
    }
    function updateDonorDetails(uint64 uniqueid,string name,string birthdate,uint16 height,uint16 weight,string btype)public returns(bool){
        var d=donors[uniqueid];
        d.name= name;
        d.birthdate = birthdate;
        d.height = height;
        d.weight = weight;
        d.btype = btype;
        return true;
    }
    function createDonorRecord(uint64 uid,uint64 rid,string datetime,string organ)public returns (bool){
        uint128 realrid = uid+rid;
        records[realrid].datetime = datetime;
        records[realrid].organ = organ;
        records[realrid].timestamp=now;
        donors[uid].recindex.push(realrid); //very important statement
        return true;       
    }  
    /*function getdonoruid(uint64 rid )public constant returns (uint64){
       return donors[rid].uid;
       
    }*/
    function getridfromuid(uint64 uid )public constant returns (uint128[]){
    
       return donors[uid].recindex;
       
    }
    function getorgan(uint64 uid, uint128 rid )public constant returns (string){
           // var=donors[uid].
            return records[uid+rid].organ;
    }

    function Donor_Record(string _greeting) public {
       return;
    }
}
