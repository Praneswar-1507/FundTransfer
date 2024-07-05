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
import com.chainsys.fundtransfer.model.Payment;

@Controller
public class PaymentController {
	@Autowired
	Payment payment;
	@Autowired
	UserDAO userdao;
	@Autowired
	BankAccount bankaccount;
//	@PostMapping("selectedfundtransfer")
//	public String getUserAccountId()
//	{
//		return "fundTransfer.jsp";
//		
//	}
	@PostMapping("fundtransfer")
	public String Payment(@RequestParam("senderAccount")String senderAccountId,@RequestParam("receiverAccount")String receiverAccountId,@RequestParam("ifsc")String ifsc,@RequestParam("transferType")String transferType,@RequestParam("amount")int amount,@RequestParam("fundId")int id,Model model)
	{
		payment.setSendAccountNo(senderAccountId);
		payment.setRecepientAccountNo(receiverAccountId);
		payment.setiFSC(ifsc);
		payment.setAmount(amount);
		payment.setTransfertype(transferType);
		payment.setUserId(id);
		userdao.payment(payment);
		int balance=userdao.getUserAccountBalance(id);

		if (amount >balance ) {

			return "home.jsp";
		}

		int remainingAmount =balance-amount;
		 System.out.println("remainingbalance:"+balance);
		userdao.updateSenderAccountBalance(id, remainingAmount);
		Payment payment=userdao.paymentDetails();
		model.addAttribute("Payment",payment);
		return "paymentSuccess.jsp";
		
	}
	@GetMapping("TransactionHistory")
	public String transactionHistory(@RequestParam("userId")int id,Model model)
	{
		List<Payment> payment=userdao.transactionHistory(id);
		model.addAttribute("payment",payment);
		return "transactionHistory.jsp";
		
	}
	@PostMapping("beneficiaryfundtransfer")
	public String beneficiaryPayment(@RequestParam("senderAccount")String senderAccountId,@RequestParam("receiverAccount")String receiverAccountId,@RequestParam("ifsc")String ifsc,@RequestParam("transferType")String transferType,@RequestParam("amount")int amount,@RequestParam("fundId")int id,@RequestParam("beneficiaryId")int beneficiaryId,Model model)
	{
		payment.setSendAccountNo(senderAccountId);
		payment.setRecepientAccountNo(receiverAccountId);
		payment.setiFSC(ifsc);
		payment.setAmount(amount);
		payment.setTransfertype(transferType);
		payment.setUserId(id);
		userdao.payment(payment);
		int balance=userdao.getUserAccountBalance(id);
		System.out.println(beneficiaryId);
         int beneficiaryBalance=userdao.getBeneficiaryAccountBalance(beneficiaryId);
		if (amount >balance ) {

			return "home.jsp";
		}
System.out.println("beneficiaryBalance"+beneficiaryBalance);

		int remainingAmount =balance-amount;
		int beneficiaryRemainingAmount=beneficiaryBalance+amount;
		 System.out.println("remainingbalance:"+beneficiaryRemainingAmount);
		 userdao.updateSenderAccountBalance(id, remainingAmount);
		 userdao.updateBeneficiaryAccountBalance(beneficiaryId, beneficiaryRemainingAmount);
		Payment payment=userdao.paymentDetails();
		model.addAttribute("Payment",payment);
		return "paymentSuccess.jsp";
		
	}
	
}
