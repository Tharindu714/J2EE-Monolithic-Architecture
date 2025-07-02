package com.tharindu.app.core.mail;

import com.tharindu.app.core.provider.MailServiceProvider;
import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public abstract class Mailable implements Runnable {
    private MailServiceProvider provider;

    public Mailable() {
        provider = MailServiceProvider.getInstance();
    }

    /**
     * When an object implementing interface <code>Runnable</code> is used
     * to create a thread, starting the thread causes the object's
     * <code>run</code> method to be called in that separately executing
     * thread.
     * <p>
     * The general contract of the method <code>run</code> is that it may
     * take any action whatsoever.
     *
     * @see Thread#run()
     */
    @Override
    public void run() {
        try {
            Session session_mail = Session.getInstance(
                    provider.getProperties(),
                    provider.getAuthenticator());

            Message message = new MimeMessage(session_mail);
            message.setFrom(new InternetAddress("Dino-Clone-app@tharindu.com"));
            build(message);
            Transport.send(message);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public abstract void build(Message message) throws Exception;
}
