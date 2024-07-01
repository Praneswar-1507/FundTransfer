package com.chainsys.fundtransfer.model;

import org.springframework.stereotype.Component;

@Component
public class User {
	String password, username, email;
	int id;
	public User()
	{
		
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public User(String password, String username, String email, int id) {
		super();
		this.password = password;
		this.username = username;
		this.email = email;
		this.id = id;
	}

	@Override
	public String toString() {
		return "User [password=" + password + ", username=" + username + ", email=" + email + ", id=" + id + "]";
	}

	

}
