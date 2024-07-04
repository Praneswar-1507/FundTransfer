package com.chainsys.fundtransfer.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String CreateBankAccount(@RequestParam("firstname")String firstName,@RequestParam("lastname")String lastName,@RequestParam("phonenum")String PhoneNumber,@RequestParam("dob")String dob,@RequestParam("aadharnumber")String aadharNumber,@RequestParam("address")String address,@RequestParam("id")int id)
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
	@PostMapping("approveUser")
	public String approveUser(@RequestParam("generateid")int userId,Model model)
	{
		 Random random = new Random();
		String firstEightDigits = "12345678";
		StringBuilder accountNumber = new StringBuilder(firstEightDigits);

		for (int i = 0; i < 4; i++) {
			int randomDigit = random.nextInt(10);
			accountNumber.append(randomDigit);
		}
		String accountNum=accountNumber.toString();
		account.setAccountId(accountNum);
		StringBuilder ifsc = new StringBuilder();

		String pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

		for (int i = 0; i < 4; i++) {
			int randomIndex = random.nextInt(pattern.length());
			char randomChar = pattern.charAt(randomIndex);
			ifsc.append(randomChar);
		}
		ifsc.append('0');

		for (int i = 0; i < 6; i++) {
			int randomDigit = random.nextInt(10);
			ifsc.append(randomDigit);
		}
		String userIfsc=ifsc.toString();
		account.setIfscCode(userIfsc);
		account.setUserId(userId);
		userdao.userApproval( account);
		List<BankAccount> userData=  userdao.approvedUsers();
		model.addAttribute("approveduserslist",userData);
		System.out.println(userData);
		return "approvedUsers.jsp";
		
	}
	
	 @PostMapping("userprofile") 
	 public String getUserDetails(@RequestParam("id")int userId,Model model) {
		 BankAccount bankaccount=userdao.getUserDetails(userId);
		 model.addAttribute("userprofiledetails",bankaccount);
	  return "userProfile.jsp";
	
	 }
	 @PostMapping("updatephonenumber")
	 public String updatePhoneNumber(@RequestParam("phonenumber")int userId,@RequestParam("phoneNumber")String phoneNumber,Model model)
	 {
		 System.out.println(userId);
		 userdao.updatePhoneNumber(userId, phoneNumber);
		 BankAccount bankaccount=userdao.getUserDetails(userId);
		 model.addAttribute("userprofiledetails",bankaccount);
		return "userProfile.jsp";
		 
	 }
	 @PostMapping("updateaddress")
	 public String updateAddress(@RequestParam("address")int userId,@RequestParam("addressValue")String address,Model model)
	 {
		 userdao.updateAddress(userId, address);
		 BankAccount bankaccount=userdao.getUserDetails(userId);
		 model.addAttribute("userprofiledetails",bankaccount);
		return "userProfile.jsp";
		 
	 }
	 
}