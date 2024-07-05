package com.chainsys.fundtransfer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.fundtransfer.dao.UserDAO;
import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.Beneficiary;
import com.chainsys.fundtransfer.model.User;


import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	User user;
	@Autowired
	UserDAO userdao;
@RequestMapping("/")
public String homepage()
{
	return "home.jsp";
}
@PostMapping("register")
public String registeruser(@RequestParam("username")String username,@RequestParam("email")String email,@RequestParam("password")String password)
{

	user.setUsername(username);

	user.setEmail(email);
	user.setPassword(password);
	
	
	if(userdao.register(user))
	{
		return "login.jsp";
	}
	else
	{
		return "login.jsp";
	}
}
@PostMapping("login")
public String loginuser(@RequestParam("email")String email,@RequestParam("password")String password,HttpSession session,Model model)
{
User user=userdao.login(email, password);
if(user!=null) {
	session.setAttribute("email", user.getEmail());
	session.setAttribute("username", user.getUsername());
	session.setAttribute("id",user.getId());
//    String accountId=userdao.getAccountId(user.getId());
//    session.setAttribute("accountId",accountId);
	List<Beneficiary> beneficiary=userdao.getBeneficiaryDetails(user.getId());
	System.out.println(beneficiary);
	session.setAttribute("beneficiarydetails", beneficiary);
	if(email.endsWith("admin@fastpay.com"))
	{
		List<BankAccount> userData=  userdao.read();
		model.addAttribute("usersData",userData);
		System.out.println(userData);
		return "admin.jsp";
	}
	else
	{

		return "redirect:/home1.jsp";
	}
}
else
{
	return "signup.jsp";
}
}


   
}

