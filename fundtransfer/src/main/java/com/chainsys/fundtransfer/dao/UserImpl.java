package com.chainsys.fundtransfer.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.chainsys.fundtransfer.mapper.Mapper;
import com.chainsys.fundtransfer.model.User;
@Repository
public class UserImpl implements UserDAO {
@Autowired
JdbcTemplate jdbctemplate;

@Override
public boolean register(User user)
{
	String query="SELECT user_name,email FROM Users WHERE user_name=? and email=?";
	Object[] params= {user.getUsername(),user.getEmail()};
	 List<User> users = jdbctemplate.query(query, new Mapper(), params);

     if (!users.isEmpty()) {
         return true;
     } else {
         String insertQuery = "INSERT INTO Users (user_name, email,user_Password) VALUES (?,?,?)";
         jdbctemplate.update(insertQuery, user.getUsername(), user.getEmail(),user.getPassword());
         return false;
     }
 }

public  User login(String email,String password) {
    
    String loginQuery = "select * from Users where email=? and user_Password=? ";
    Object[] params= {email,password};
  return  jdbctemplate.queryForObject(loginQuery, new Mapper(),params);
   
    
    
}
}
