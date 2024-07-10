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
import com.chainsys.fundtransfer.validation.LoginValidation;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	User user;
	@Autowired
	UserDAO userdao;
	@Autowired
	LoginValidation validation;
	@RequestMapping("/")
	public String homepage() {
		return "home.jsp";
	}

	@PostMapping("register")
	public String registeruser(@RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("password") String password,Model model) {
		if (!validation.validateUsername(username)) {
            model.addAttribute("error", "Invalid username format");
            return "signup.jsp";
            
        }
        
        if (!validation.validateEmail(email)) {
            model.addAttribute("error", "Invalid email format");
            return "signup.jsp";
        }
       
        if (!validation.validatepassword(password)) {
            model.addAttribute("error", "Passwords format wrong");
            return "signup.jsp";
        }
		user.setUsername(username);

		user.setEmail(email);
		user.setPassword(password);

		if (userdao.register(user)) {
			return "login.jsp";
		} else {
			return "login.jsp";
		}
	}

	@PostMapping("login")
	public String loginuser(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session, Model model) {
		User user = userdao.login(email, password);
		if (user != null) {
			session.setAttribute("email", user.getEmail());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("id", user.getId());
			List<Beneficiary> beneficiary = userdao.getBeneficiaryDetails(user.getId());
			System.out.println(beneficiary);
			session.setAttribute("beneficiarydetails", beneficiary);
			if (email.endsWith("admin@fastpay.com")) {
				List<BankAccount> userData = userdao.read();
				model.addAttribute("usersData", userData);
				System.out.println(userData);
				return  "admin.jsp";
			} else {

				return "redirect:/home.jsp";
			}
		} else {
			return "redirect:/signup.jsp";
		}
	}
	@PostMapping("logout")
    public String logoutUser(HttpSession session,HttpServletRequest request) {
        session = request.getSession(false);
        if (session != null) {
               session.invalidate(); 
           }

        
       return "home.jsp";
        
    }

}
