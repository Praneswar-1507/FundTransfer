package com.chainsys.fundtransfer.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.chainsys.fundtransfer.mapper.UserAccountDetailsMapper;
import com.chainsys.fundtransfer.mapper.UserMapper;
import com.chainsys.fundtransfer.model.BankAccount;
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
	 List<User> users = jdbctemplate.query(query, new UserMapper(), params);

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
    try {
  return  jdbctemplate.queryForObject(loginQuery, new UserMapper(),params);
    }catch(EmptyResultDataAccessException e) {
    	return null;
    }
}  
    public boolean createAccount(BankAccount account)
    {
    	String query="SELECT user_ID FROM Accounts WHERE user_ID=? and aadhar_number=?";
    	Object[] params= {account.getUserId(),account.getAadharNumber()};
    	 List<BankAccount> usersaccount = jdbctemplate.query(query, new UserAccountDetailsMapper(), params);

         if (!usersaccount.isEmpty()) {
             return true;
         } else {
             String insertQuery = "INSERT INTO Accounts(user_ID,first_name,Last_name,phonenumber,date_of_birth,aadhar_number,residential_address)  VALUES(?,?,?,?,?,?,?,)";
             jdbctemplate.update(insertQuery,account.getUserId(),account.getFirstName(),account.getLastName(),account.getPhoneNumber(),account.getDate(),account.getAadharNumber(),account.getAddress());
             return false;
         }
     }    

}
