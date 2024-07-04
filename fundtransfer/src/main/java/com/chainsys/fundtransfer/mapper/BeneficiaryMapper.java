package com.chainsys.fundtransfer.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.Beneficiary;

public class BeneficiaryMapper implements RowMapper {

	@Override
	public Beneficiary mapRow(ResultSet rs, int rowNum) throws SQLException {
		Beneficiary beneficiary=new Beneficiary();
		beneficiary.setBeneficiaryId(rs.getInt("beneficiary_ID"));
		beneficiary.setBeneficiaryName(rs.getString("beneficiary_name"));
		beneficiary.setBeneficiaryAccountId(rs.getString("beneficiary_accountID"));
		beneficiary.setIfsccode(rs.getString("ifsccode"));
		return beneficiary;
		
	}

}
