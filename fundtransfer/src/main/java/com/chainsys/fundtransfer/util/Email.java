package com.chainsys.fundtransfer.util;

public class Email {
	public void sendTransactionEmail(String toEmail, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject(subject);
        message.setText(body);
        message.setFrom("kishorkishor2003@gmail.com");

        mailSender.send(message);
}
