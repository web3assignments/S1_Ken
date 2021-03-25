pragma solidity >=0.5.11;

contract Corona_reg {
    struct Corona { uint id; string first_name; string last_name; bool isVacinated; bool isTested; bool isPostive; uint temp; }
     uint public PId;
     uint public Vacinated;
     bool public allowed;
    Corona public corona;

  
    function register(string memory  first_name, string memory last_name) public {
        
        corona = Corona(PId, first_name, last_name, false, false, false, 0);
    }
    
    function register_Vacination () public{
        Vacinated++;
        if(Vacinated == 1){
            corona.isVacinated = true;
        }
    }
    
     function register_Testing(bool  status) public{
        corona.isTested = status;
    }
    function register_TestResult(bool  status) public{
        corona.isPostive = status;
    }
    function register_temp(uint temp) public{
        corona.temp = temp;
    }
    
    function  Festival_Allowed() public{
       if((Vacinated >= 2 || !corona.isPostive) && corona.temp < 38 )
            allowed = true;
       else
            allowed = false;
    }

}