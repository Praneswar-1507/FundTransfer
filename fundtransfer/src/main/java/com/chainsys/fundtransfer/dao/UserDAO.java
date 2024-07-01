package com.chainsys.fundtransfer.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.fundtransfer.model.User;

@Repository
public interface UserDAO {
	
	public boolean register(User user);
	public User login(String email,String password);
}
