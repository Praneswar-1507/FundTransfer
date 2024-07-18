package com.chainsys.fundtransfer.exceptionhandling;

import org.springframework.dao.DuplicateKeyException;

public class BeneficiaryException extends DuplicateKeyException {

	public BeneficiaryException(String msg) {
		super(msg);
		
	}

	

}
