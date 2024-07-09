package com.chainsys.fundtransfer.validation;

import org.springframework.stereotype.Component;

@Component
public class AccountValidation {
	public boolean validateUsername(String firstName) {
	       return firstName.matches("[A-Za-z]+");
	    }
	public boolean validateLastname(String lastName) {
	       return lastName.matches("[A-Za-z]+");
	    }

	    public boolean validateMobile(String mobileNumber) {
	       
	      return  mobileNumber.matches("^\\d{10}$");
	      
	    }
	    public boolean validateAadhar(String aadharNumber) {
		       
		      return  aadharNumber.matches("[0-9]{12}");
		      
		    }

	   
}
