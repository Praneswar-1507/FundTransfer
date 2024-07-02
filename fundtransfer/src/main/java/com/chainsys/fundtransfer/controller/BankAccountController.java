package com.chainsys.fundtransfer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.fundtransfer.dao.UserDAO;
import com.chainsys.fundtransfer.model.BankAccount;


import jakarta.servlet.http.HttpSession;
@Controller
public class BankAccountController {
	@Autowired
	BankAccount account;
	@Autowired
	UserDAO userdao;
	@PostMapping("createbankaccount")
	public String CreateBankAccount(@RequestParam("firstname")String firstName,@RequestParam("lastname")String lastName,@RequestParam("phonenum")String PhoneNumber,@RequestParam("dob")String dob,@RequestParam("aadharnumber")String aadharNumber,@RequestParam("address")String address,@RequestParam("id")int id,HttpSession session)
	{
		account.setFirstName(firstName);
		account.setLastName(lastName);
		account.setPhoneNumber(PhoneNumber);
		account.setDate(dob);
		account.setAadharNumber(aadharNumber);
		account.setAddress(address);
		account.setUserId(id);
		if(userdao.createAccount(account))
		{
			return "home.jsp";
		}
		else
		{
		return "home1.jsp";
		}
		
	}
}
