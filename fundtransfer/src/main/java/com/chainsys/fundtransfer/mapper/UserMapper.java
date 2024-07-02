package com.chainsys.fundtransfer.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;


import org.springframework.jdbc.core.RowMapper;

import com.chainsys.fundtransfer.model.User;

public class UserMapper implements RowMapper<User> {

	@Override
	
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user=new User();
		user.setId(rs.getInt("user_ID"));
		user.setEmail(rs.getString("email"));
		user.setUsername(rs.getString("user_name"));
		user.setPassword(rs.getString("user_Password"));
		return user;
	}

}
