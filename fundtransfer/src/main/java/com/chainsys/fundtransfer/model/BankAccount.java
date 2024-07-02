package com.chainsys.fundtransfer.model;



import org.springframework.stereotype.Component;
@Component
public class BankAccount {
	String firstName, lastName, phoneNumber, date, aadharNumber, ifscCode, address, accountId;
	int accountBalance;
	int userId;
	public BankAccount()
	{
		
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAadharNumber() {
		return aadharNumber;
	}

	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public int getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(int accountBalance) {
		this.accountBalance = accountBalance;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
	public BankAccount(String firstName, String lastName, String phoneNumber, String date, String aadharNumber,
			String ifscCode, String address, String accountId, int accountBalance, int userId) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.date = date;
		this.aadharNumber = aadharNumber;
		this.ifscCode = ifscCode;
		this.address = address;
		this.accountId = accountId;
		this.accountBalance = accountBalance;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BankAccount [firstName=" + firstName + ", lastName=" + lastName + ", phoneNumber=" + phoneNumber
				+ ", date=" + date + ", aadharNumber=" + aadharNumber + ", ifscCode=" + ifscCode + ", address="
				+ address + ", accountId=" + accountId + ", accountBalance=" + accountBalance + ", userId=" + userId
				+ "]";
	}


	
}
