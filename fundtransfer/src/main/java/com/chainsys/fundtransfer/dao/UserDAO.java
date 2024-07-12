package com.chainsys.fundtransfer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.fundtransfer.model.BankAccount;
import com.chainsys.fundtransfer.model.Beneficiary;
import com.chainsys.fundtransfer.model.Payment;
import com.chainsys.fundtransfer.model.RequestMoneyDetails;
import com.chainsys.fundtransfer.model.User;

@Repository
public interface UserDAO {
	
	public boolean register(User user);
	public User login(String email,String password);
    public boolean createAccount(BankAccount account);
    public List<BankAccount> read();
    public void userApproval(BankAccount account);
    public List<BankAccount> approvedUsers();
    public BankAccount getUserDetails(int userId);
    public void updatePhoneNumber(int userId,String phoneNumber);
    public void updateAddress(int userId,String address);
    public void addBeneficiary(Beneficiary beneficiary);
    public List<Beneficiary> viewBeneficiary(int id);
    public void deleteBeneficiary(int id);
    public void updateBeneficiaryDetails(Beneficiary beneficiary);
    public String getAccountId(int userId);
    public void payment(Payment payment);
    public Payment paymentDetails();
    public List<Payment> transactionHistory(int id);
    public List<Beneficiary>getBeneficiaryDetails(int id);
    public int getUserAccountBalance(int id);
    public int getBeneficiaryAccountBalance(int id);
    public void updateSenderAccountBalance(int id,int balance);
    public void updateBeneficiaryAccountBalance(int id,int balance);
    public void requestMoney(RequestMoneyDetails requestMoneyDetails);
	public List<RequestMoneyDetails> readRequestMoney(String id);
	public String getEmail(int id);
	public void moneyRequestStatus(int requestId,String status);
	public int countMoneyRequest(int id);
	public void updateCreditPoints(double creditpoints,int id);
	public int getCreditPoints(int userId);
	  public boolean checkUserAlreadyExists(String AccountId) ;

}
