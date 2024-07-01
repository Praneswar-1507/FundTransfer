package com.chainsys.fundtransfer.model;

public class Beneficiary {
	String beneficiaryName, beneficiaryAccountId, ifsccode;
	int userId, beneficiaryId, beneficiaryBalance;
	public Beneficiary()
	{
		
	}
	public String getBeneficiaryName() {
		return beneficiaryName;
	}
	public void setBeneficiaryName(String beneficiaryName) {
		this.beneficiaryName = beneficiaryName;
	}
	public String getBeneficiaryAccountId() {
		return beneficiaryAccountId;
	}
	public void setBeneficiaryAccountId(String beneficiaryAccountId) {
		this.beneficiaryAccountId = beneficiaryAccountId;
	}
	public String getIfsccode() {
		return ifsccode;
	}
	public void setIfsccode(String ifsccode) {
		this.ifsccode = ifsccode;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBeneficiaryId() {
		return beneficiaryId;
	}
	public void setBeneficiaryId(int beneficiaryId) {
		this.beneficiaryId = beneficiaryId;
	}
	public int getBeneficiaryBalance() {
		return beneficiaryBalance;
	}
	public void setBeneficiaryBalance(int beneficiaryBalance) {
		this.beneficiaryBalance = beneficiaryBalance;
	}
	public Beneficiary(String beneficiaryName, String beneficiaryAccountId, String ifsccode, int userId,
			int beneficiaryId, int beneficiaryBalance) {
		super();
		this.beneficiaryName = beneficiaryName;
		this.beneficiaryAccountId = beneficiaryAccountId;
		this.ifsccode = ifsccode;
		this.userId = userId;
		this.beneficiaryId = beneficiaryId;
		this.beneficiaryBalance = beneficiaryBalance;
	}
	@Override
	public String toString() {
		return "Beneficiary [beneficiaryName=" + beneficiaryName + ", beneficiaryAccountId=" + beneficiaryAccountId
				+ ", ifsccode=" + ifsccode + ", userId=" + userId + ", beneficiaryId=" + beneficiaryId
				+ ", beneficiaryBalance=" + beneficiaryBalance + "]";
	}
	
}
