package com.chainsys.fundtransfer.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.Payment;

public class PaymentMapper implements RowMapper {

	@Override
	public Payment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Payment payment=new Payment();
		payment.setTransferId(rs.getInt("transfer_ID"));
		payment.setSendAccountNo(rs.getString("sender_Account_ID"));
		payment.setRecepientAccountNo(rs.getString("Recipient_ID"));
		payment.setDate(rs.getString("transfer_Date"));
		payment.setAmount(rs.getInt("transfer_Amount"));
		return payment;
	}

}
