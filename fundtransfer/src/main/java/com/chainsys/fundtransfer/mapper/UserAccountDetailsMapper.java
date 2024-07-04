package com.chainsys.fundtransfer.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.fundtransfer.model.BankAccount;

public class UserAccountDetailsMapper implements RowMapper<BankAccount> {

	@Override
	public BankAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
		BankAccount account=new BankAccount();
		account.setFirstName(rs.getString("first_name"));
		account.setLastName(rs.getString("Last_name"));
		account.setPhoneNumber(rs.getString("phonenumber"));
		account.setAadharNumber(rs.getString("aadhar_number"));
		account.setAccountId(rs.getString("account_ID"));
		account.setUserId(rs.getInt("user_ID"));
		account.setDate(rs.getString("date_of_birth"));
		account.setIfscCode(rs.getString("IFSC"));
		account.setAddress(rs.getString("residential_address"));
		account.setAccountBalance(rs.getInt("account_Balance"));
		return account;
	}

}
