package com.chainsys.fundtransfer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.fundtransfer.dao.UserDAO;
import com.chainsys.fundtransfer.model.Beneficiary;
import com.chainsys.fundtransfer.model.Payment;

@Controller
public class PaymentController {
	@Autowired
	Payment payment;
	@Autowired
	UserDAO userdao;
	public String Payment(@RequestParam("senderAccount")String senderAccountId,@RequestParam("receiverAccount")String receiverAccountId,@RequestParam("ifsc")String ifsc,@RequestParam("transferType")String transferType,@RequestParam("amount")int amount,@RequestParam("id")int id)
	{
		payment.setSendAccountNo(senderAccountId);
		payment.setRecepientAccountNo(receiverAccountId);
		payment.setiFSC(ifsc);
		payment.setAmount(amount);
		payment.setTransfertype(transferType);
		payment.setUserId(id);
		userdao.payment(payment);
		return "home.jsp";
		
	}
}
