package com.chainsys.fundtransfer.model;

public class Transaction {
	String sendAccountNo, recepientAccountNo;
	int amount, transferId, userId;
	String iFSC, date, transfertype;
	public Transaction()
	{
		
	}
	public String getSendAccountNo() {
		return sendAccountNo;
	}
	public void setSendAccountNo(String sendAccountNo) {
		this.sendAccountNo = sendAccountNo;
	}
	public String getRecepientAccountNo() {
		return recepientAccountNo;
	}
	public void setRecepientAccountNo(String recepientAccountNo) {
		this.recepientAccountNo = recepientAccountNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTransferId() {
		return transferId;
	}
	public void setTransferId(int transferId) {
		this.transferId = transferId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getiFSC() {
		return iFSC;
	}
	public void setiFSC(String iFSC) {
		this.iFSC = iFSC;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTransfertype() {
		return transfertype;
	}
	public void setTransfertype(String transfertype) {
		this.transfertype = transfertype;
	}
	public Transaction(String sendAccountNo, String recepientAccountNo, int amount, int transferId, int userId,
			String iFSC, String date, String transfertype) {
		super();
		this.sendAccountNo = sendAccountNo;
		this.recepientAccountNo = recepientAccountNo;
		this.amount = amount;
		this.transferId = transferId;
		this.userId = userId;
		this.iFSC = iFSC;
		this.date = date;
		this.transfertype = transfertype;
	}
	@Override
	public String toString() {
		return "TransferAmount [sendAccountNo=" + sendAccountNo + ", recepientAccountNo=" + recepientAccountNo
				+ ", amount=" + amount + ", transferId=" + transferId + ", userId=" + userId + ", iFSC=" + iFSC
				+ ", date=" + date + ", transfertype=" + transfertype + "]";
	}
	
}
