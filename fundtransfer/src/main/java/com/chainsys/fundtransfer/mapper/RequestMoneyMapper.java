package com.chainsys.fundtransfer.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.fundtransfer.model.RequestMoneyDetails;

public class RequestMoneyMapper implements RowMapper<RequestMoneyDetails> {

	@Override
	public RequestMoneyDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		RequestMoneyDetails requestmoneydetails= new RequestMoneyDetails();
		requestmoneydetails.setRequesterId(rs.getString("requester_id"));
		requestmoneydetails.setAmount(rs.getInt("amount"));
		requestmoneydetails.setRequestId(rs.getInt("request_id"));
		return requestmoneydetails;
	}

}
