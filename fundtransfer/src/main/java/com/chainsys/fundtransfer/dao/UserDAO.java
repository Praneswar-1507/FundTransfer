package com.chainsys.fundtransfer.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.User;

@Repository
public interface UserDAO {
	
	public boolean register(User user);
	public User login(String email,String password);
    public boolean createAccount(BankAccount account);
}
