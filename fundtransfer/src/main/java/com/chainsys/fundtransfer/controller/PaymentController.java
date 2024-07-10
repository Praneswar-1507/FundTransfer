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
import com.chainsys.fundtransfer.model.RequestMoneyDetails;
import com.chainsys.fundtransfer.util.Email;
import com.chainsys.fundtransfer.validation.FundTransferValidation;

@Controller
public class PaymentController {
	@Autowired
	Payment payment;
	@Autowired
	UserDAO userdao;
	@Autowired
	BankAccount bankaccount;
	@Autowired
	RequestMoneyDetails requestMoneyDetails;
	@Autowired
	FundTransferValidation fundtransfervalidation;
	@Autowired
	Email email;

	@GetMapping("selectedfundtransfer")
	public String getUserAccountId(@RequestParam("userId") int userId, Model model) {
		String accountId = userdao.getAccountId(userId);
		model.addAttribute("accountId", accountId);
		return "fundTransfer.jsp";

	}

	@GetMapping("selectedbeneficiaryfundtransfer")
	public String getAccountId(@RequestParam("userId") int userId, Model model) {
		String accountId = userdao.getAccountId(userId);
		System.out.println(accountId);
		model.addAttribute("accountId", accountId);
		return "beneficiaryFundTransfer.jsp";

	}
	@PostMapping("deposit")
	public String Deposit(@RequestParam("accountId" )int userId,@RequestParam("amount" )int amount,Model model)
	{
		int balance = userdao.getUserAccountBalance(userId);
		int addamount=balance+amount;
		userdao.updateSenderAccountBalance(userId, addamount);
		BankAccount bankaccount = userdao.getUserDetails(userId);
		model.addAttribute("userprofiledetails", bankaccount);
		return "userProfile.jsp";
		
	}
	@PostMapping("fundtransfer")
	public String Payment(@RequestParam("senderAccount") String senderAccountId,
			@RequestParam("receiverAccount") String receiverAccountId, @RequestParam("ifsc") String ifsc,
			@RequestParam("transferType") String transferType, @RequestParam("amount") int amount,
			@RequestParam("fundId") int id, Model model) {
		payment.setSendAccountNo(senderAccountId);
		payment.setRecepientAccountNo(receiverAccountId);
		payment.setiFSC(ifsc);
		payment.setAmount(amount);
		payment.setTransfertype(transferType);
		payment.setUserId(id);
		
		int balance = userdao.getUserAccountBalance(id);
		if (amount > balance) {
			String accountId = userdao.getAccountId(id);
			model.addAttribute("accountId", accountId);
			 model.addAttribute("error", "Insufficient balance");
		        return "fundTransfer.jsp";
		}
		else
		{
			userdao.payment(payment);
		int remainingAmount = balance - amount;
		System.out.println("remainingbalance:" + balance);
		userdao.updateSenderAccountBalance(id, remainingAmount);
		Payment payment = userdao.paymentDetails();
		model.addAttribute("Payment", payment);
		String mail = userdao.getEmail(id);
		System.out.println(mail);
        String subject=" payment successful";
        String body="Account balance"+ 
                
                "\r\n"
                + "Best regards, ";
        email.sendTransactionEmail(mail, subject, body);
		return "paymentSuccess.jsp";
		}

	}

	@GetMapping("TransactionHistory")
	public String transactionHistory(@RequestParam("userId") int id, Model model) {
		List<Payment> payment = userdao.transactionHistory(id);
		model.addAttribute("payment", payment);
		return "transactionHistory.jsp";

	}

	@PostMapping("beneficiaryfundtransfer")
	public String beneficiaryPayment(@RequestParam("senderAccount") String senderAccountId,
			@RequestParam("receiverAccount") String receiverAccountId, @RequestParam("ifsc") String ifsc,
			@RequestParam("transferType") String transferType, @RequestParam("amount") int amount,
			@RequestParam("fundId") int id, @RequestParam("beneficiaryId") int beneficiaryId, Model model) {
		payment.setSendAccountNo(senderAccountId);
		payment.setRecepientAccountNo(receiverAccountId);
		payment.setiFSC(ifsc);
		payment.setAmount(amount);
		payment.setTransfertype(transferType);
		payment.setUserId(id);
		int balance = userdao.getUserAccountBalance(id);
		System.out.println(beneficiaryId);
		int beneficiaryBalance = userdao.getBeneficiaryAccountBalance(beneficiaryId);
		if (amount > balance) {
			String accountId = userdao.getAccountId(id);
			model.addAttribute("accountId", accountId);
			 model.addAttribute("error", "Insufficient balance");
		        return "beneficiaryFundTransfer.jsp";
		}
		
		else
		{
			userdao.payment(payment);
		int remainingAmount = balance - amount;
		int beneficiaryRemainingAmount = beneficiaryBalance + amount;
		System.out.println("remainingbalance:" + beneficiaryRemainingAmount);
		userdao.updateSenderAccountBalance(id, remainingAmount);
		userdao.updateBeneficiaryAccountBalance(beneficiaryId, beneficiaryRemainingAmount);
		Payment payment = userdao.paymentDetails();
		model.addAttribute("Payment", payment);
		String mail = userdao.getEmail(id);
		System.out.println(mail);
        String subject=" payment successful";
        String body="Account balance"+ 
                
                "\r\n"
                + "Best regards, ";
        email.sendTransactionEmail(mail, subject, body);
		return "paymentSuccess.jsp";
		}

	}
	@PostMapping("requestMoney")
	public String requestMoney(@RequestParam("userId") int id,@RequestParam("approverId") String approverAccountId,@RequestParam("amount") int amount) {
		String accountId=userdao.getAccountId(id);
		System.out.println(approverAccountId);
		requestMoneyDetails.setRequesterId(accountId);
		requestMoneyDetails.setAmount(amount);
		requestMoneyDetails.setApproverId(approverAccountId);
		requestMoneyDetails.setUserId(id);
		userdao.requestMoney(requestMoneyDetails);
		return "home.jsp";
	}
	@GetMapping("viewmoneyrequest")
	public String viewMoneyRequest(@RequestParam("userId") int userId, Model model) {
		String accountId=userdao.getAccountId(userId);
		List<RequestMoneyDetails> money = userdao.readRequestMoney(accountId);
		model.addAttribute("money", money);
		System.out.println(money);
		return "moneyRequest.jsp";

	}
	@PostMapping("rejectRequest")
	public String rejectMoneyRequest(@RequestParam("requestId") int requestId,@RequestParam("userId") int userId, Model model)
	{
		String accountId=userdao.getAccountId(userId);
		userdao.moneyRequestStatus(requestId,"DECLINED");
		List<RequestMoneyDetails> money = userdao.readRequestMoney(accountId);
		model.addAttribute("money", money);
		return "moneyRequest.jsp";
		
	}
	@PostMapping("approveRequest")
	public String approveMoneyRequest(@RequestParam("requestId") int requestId,@RequestParam("userId") int userId,@RequestParam("amount") int amount, Model model)
	{
		String accountId=userdao.getAccountId(userId);
		userdao.moneyRequestStatus(requestId,"APPROVED");
		int balance = userdao.getUserAccountBalance(userId);
		System.out.println("Balance:"+balance);
		int remainingAmount = balance - amount;
		System.out.println("remainingamount:"+remainingAmount);
		if (amount > balance) {
			 List<RequestMoneyDetails> money = userdao.readRequestMoney(accountId);
		        model.addAttribute("money", money);
		        model.addAttribute("error", "Insufficient balance");
		        model.addAttribute("requestId", requestId);
		        return "moneyRequest.jsp";
		}
		else
		{
		userdao.updateSenderAccountBalance(userId, remainingAmount);
		List<RequestMoneyDetails> money = userdao.readRequestMoney(accountId);
		model.addAttribute("money", money);
		return "moneyRequest.jsp";
		}
		
	}
}
