package com.chainsys.fundtransfer.validation;

import org.springframework.stereotype.Component;

@Component
public class FundTransferValidation {
	public boolean validateSendAccountId(String sendAccountId) {
	       return sendAccountId.matches("[0-9]{12}");
	    }
	public boolean validateReceiveAccountId(String receiveAccountId) {
	       return receiveAccountId.matches("[0-9]{12}");
	    }
	public boolean validateIfscCode(String ifscCode) {
	       return ifscCode.matches("^([A-Z]{4}[0][A-Z0-9]{6})$");
	    }
}
