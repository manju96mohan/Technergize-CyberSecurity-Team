pragma solidity ^0.4.4;
//contract to store blood donor details
//by Manju Mohan
import "github.com/ethereum/dapp-bin/library/stringUtils.sol";

contract BloodRecord {

    struct Record {
        uint64 uid;
        string datetime;
        string bloodgroup;

    }

    mapping(uint256 => Record) public records;

   struct Donor {

        uint64 uid;
        string donorname;
        //should i add this ? - string bloodgroup;
        uint16 age;
        string gender;
        string state;
        string district;
        string city;
        string phc;
        string availability;
        uint64 phnum;
        uint128[] recindex;

    }

     mapping(uint64 => Donor) public donor;
    
    function regBloodDonar(uint64 uid )public returns (bool) {
        
        donor[uid].uid = uid;
        return true;
    }

    function updateDonor(uint64 uid,string donorname,string bloodgroup,uint16 age,string gender,string state,string district,string city,string phc,string availability,uint64 phnum)public returns(bool) {
        
        donor[uid].donorname = donorname;
       // donor[uid].bloodgroup = bloodgroup;
        donor[uid].age = age;
        donor[uid].gender = gender;
        donor[uid].state = state;
        donor[uid].district = district;
        donor[uid].city = city;
        donor[uid].phc = phc;
        donor[uid].availability = availability;
        donor[uid].phnum = phnum;
        return true;
    }

      function findbylocation(uint64 uid,string country,string state,string district,string city,string phc)public returns(bool) {

        if (StringUtils.equal(donor[uid].country,country)) {
           if (donor[uid].state == state ) {
               if (donor[uid].district == district) {
                   if (donor[uid].city == city) {
                       if (donor[uid].phc == phc) {  
                       
                       //display user details
                       }
                   }
               }
           }
        }
        return true;
    }
      function findbybloodgp(string bloodgroup) public {

          if (Donor.bloodgroup == bloodgroup) {
              //display user details

          }
      }   

      function findbyagegp(uint64 uid,uint16 age,uint weight) public constant returns (uint128[]) {

          if (age>18 && age<=30) {
              //display user details
              return donor[uid].recindex;
          }
          if (age>30 && age<=40) {
             return donor[uid].recindex;
          }
          if (age>40 && age<=50) {
              return donor[uid].recindex;
          }
          if (age>50 && age<=60) {
              return donor[uid].recindex;
          }
         }
       
     function findbyname(uint64 uid,string name) public constant returns(Donor) {

         if (donor.name == name) {
             //display userdetails 
          // return donor[uid];
         }
     }   

function createRecord(uint64 uid,uint64 rid,string datetime,string bloodgroup)public returns (bool) {
        
        uint128 realrid = uid+rid;
        records[realrid].datetime = datetime;
        records[realrid].bloodgroup = bloodgroup;
        donor[uid].recindex.push(realrid);
        return true;       
    }  
    //function getpatient(uint64 uid )public constant returns (Donor) {
       //return donor[uid];
       
   // }
   // function getrecords(uint64 uid )public constant returns (uint128[]) {
    
      // return donor[uid].recindex;
       
   // }

    function BloodRecord(string _greeting) public {  
        return; 
        }

}