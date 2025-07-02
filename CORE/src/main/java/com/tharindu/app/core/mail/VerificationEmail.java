package com.tharindu.app.core.mail;

import jakarta.mail.Message;
import jakarta.mail.internet.InternetAddress;

public class VerificationEmail extends Mailable {
    private String to;
    private String verification_code;

    public VerificationEmail(String to, String verification_code) {
        this.to = to;
        this.verification_code = verification_code;
    }

    @Override
    public void build(Message message) throws Exception {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Your Verification Code is " + verification_code);
        message.setText("Hello User! This is Dino-Clone-app@tharindu.com");
    }
}
