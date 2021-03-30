pragma solidity >=0.8.3;

import "./DateTime.sol";

contract Corona_reg {
    struct Corona { uint id; string first_name; string last_name; bool isVacinated; bool isTested; bool isPostive; uint temp;}
     uint private PId;
     uint private Vacinated;
     uint256 public last_vacination;
    Corona private corona;

  
    function register_patient(string memory  first_name, string memory last_name) public {
        
        corona = Corona(PId, first_name, last_name, false, false, false, 0);
    }
    
    function register_Vacination () public{
        last_vacination = block.timestamp;
        Vacinated++;
        if(Vacinated == 1){
            corona.isVacinated = true;
        }
    }
    
     function register_Testing(bool result) public{
        corona.isTested = true;
        corona.isPostive = result;
    }

    function register_temp(uint temp) public{
        corona.temp = temp;
    }
    
    
    function  Festival_Allowed() public view returns(string memory){
       if((Vacinated >= 2 ||(corona.isTested && !corona.isPostive)) && (corona.temp < 38 && corona.temp > 30) )
            return "Allowed";
       else
            return "Not allowed";
    }

}