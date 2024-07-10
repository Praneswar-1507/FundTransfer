package com.chainsys.fundtransfer.model;

import org.springframework.stereotype.Component;

@Component
public class RequestMoneyDetails {
int requestId,amount,userId;
String requesterId,approverId,requestDate,approveDate;
public RequestMoneyDetails()
{
	
}

public int getRequestId() {
	return requestId;
}

public void setRequestId(int requestId) {
	this.requestId = requestId;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getRequesterId() {
	return requesterId;
}

public void setRequesterId(String requesterId) {
	this.requesterId = requesterId;
}

public String getApproverId() {
	return approverId;
}

public void setApproverId(String approverId) {
	this.approverId = approverId;
}

public String getRequestDate() {
	return requestDate;
}

public void setRequestDate(String requestDate) {
	this.requestDate = requestDate;
}

public String getApproveDate() {
	return approveDate;
}

public void setApproveDate(String approveDate) {
	this.approveDate = approveDate;
}


public RequestMoneyDetails(int requestId, int amount, int userId, String requesterId, String approverId,
		String requestDate, String approveDate) {
	super();
	this.requestId = requestId;
	this.amount = amount;
	this.userId = userId;
	this.requesterId = requesterId;
	this.approverId = approverId;
	this.requestDate = requestDate;
	this.approveDate = approveDate;
}

@Override
public String toString() {
	return "RequestMoneyDetails [requestId=" + requestId + ", amount=" + amount + ", userId=" + userId
			+ ", requesterId=" + requesterId + ", approverId=" + approverId + ", requestDate=" + requestDate
			+ ", approveDate=" + approveDate + "]";
}



}
