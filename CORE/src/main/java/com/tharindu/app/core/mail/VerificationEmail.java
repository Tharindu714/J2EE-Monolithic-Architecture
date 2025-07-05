package com.tharindu.app.core.mail;

import jakarta.mail.Message;
import jakarta.mail.internet.InternetAddress;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class VerificationEmail extends Mailable {
    private final String to;
    private final String verification_code;

    public VerificationEmail(String to, String verification_code) {
        this.to = to;
        this.verification_code = verification_code;
    }

    @Override
    public void build(Message message) throws Exception {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Your Verification Code is " + verification_code);
//        message.setText("Hello User! This is Dino-Clone-app@tharindu.com");

        String encode = Base64.getEncoder().encodeToString(to.getBytes());

        String Link = "http://localhost:8080/WEB-THARINDU-J2EE/verify-email?id=" + encode + "&code=" + verification_code;

        message.setContent(Link, "text/html; charset=UTF-8");
    }
}
