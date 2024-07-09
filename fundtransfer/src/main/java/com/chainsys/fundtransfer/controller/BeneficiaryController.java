package com.chainsys.fundtransfer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.fundtransfer.dao.UserDAO;
import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.Beneficiary;

import jakarta.servlet.http.HttpSession;

@Controller
public class BeneficiaryController {
	@Autowired
	Beneficiary beneficiary;
	@Autowired
	UserDAO userdao;

	@PostMapping("addbeneficiary")
	public String addBeneficiary(@RequestParam("beneficiaryName") String beneficiaryName,
			@RequestParam("accountID") String beneficiaryAccountId, @RequestParam("ifscCode") String ifscCode,
			@RequestParam("userId") int id,HttpSession session, Model model) {
		beneficiary.setBeneficiaryName(beneficiaryName);
		beneficiary.setBeneficiaryAccountId(beneficiaryAccountId);
		beneficiary.setIfsccode(ifscCode);
		beneficiary.setUserId(id);
		userdao.addBeneficiary(beneficiary);
		List<Beneficiary> beneficiary = userdao.getBeneficiaryDetails(id);
		System.out.println(beneficiary);
		session.setAttribute("beneficiarydetails", beneficiary);
		BankAccount bankaccount = userdao.getUserDetails(id);
		model.addAttribute("userprofiledetails", bankaccount);
		return "userProfile.jsp";
	}

	@GetMapping("viewbeneficiary")
	public String viewBeneficiary(@RequestParam("userId") int id, Model model) {
		System.out.println(id);
		List<Beneficiary> beneficiaryDetails = userdao.viewBeneficiary(id);

		model.addAttribute("beneficiarydetails", beneficiaryDetails);
		return "viewBeneficiary.jsp";

	}

	@PostMapping("deletebeneficiary")
	public String deleteBeneficiary(@RequestParam("viewid") int id, @RequestParam("deleteid") int idToDelete,
			Model model,HttpSession session) {
		userdao.deleteBeneficiary(idToDelete);
		id=(int) session.getAttribute("id");
		List<Beneficiary> beneficiary = userdao.getBeneficiaryDetails(id);
		System.out.println(beneficiary);
		session.setAttribute("beneficiarydetails", beneficiary);
		List<Beneficiary> beneficiaryDetails = userdao.viewBeneficiary(id);
		model.addAttribute("beneficiarydetails", beneficiaryDetails);
		return "viewBeneficiary.jsp";

	}

	@PostMapping("updatebeneficiarydetails")
	public String update(@RequestParam("id") int id, @RequestParam("editBeneficiaryId") int editBeneficiaryId,
			@RequestParam("editBeneficiaryName") String beneficiaryName,
			@RequestParam("editBeneficiaryAccountId") String beneficiaryAccountId,
			@RequestParam("editBeneficiaryIfscCode") String beneficiaryIfsc, Model model) {
		System.out.println(editBeneficiaryId);
		beneficiary.setBeneficiaryId(editBeneficiaryId);
		beneficiary.setBeneficiaryName(beneficiaryName);
		beneficiary.setBeneficiaryAccountId(beneficiaryAccountId);
		beneficiary.setIfsccode(beneficiaryIfsc);
		userdao.updateBeneficiaryDetails(beneficiary);
		List<Beneficiary> beneficiaryDetails = userdao.viewBeneficiary(id);
		model.addAttribute("beneficiarydetails", beneficiaryDetails);
		return "viewBeneficiary.jsp";

	}
}
