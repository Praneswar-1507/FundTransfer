package com.chainsys.fundtransfer.validation;

import org.springframework.stereotype.Component;

@Component
public class LoginValidation {
	public boolean validateUsername(String username) {
       return username.matches("[A-Za-z]+");
    }

   
    public boolean validateEmail(String email) {
       
    return  email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
        
    }

    public boolean validatepassword(String password) {
      
     return   password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[&^%$#@]).{5,}");
      
    }
}
