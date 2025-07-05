package com.tharindu.app.core.provider;

import com.tharindu.app.core.mail.Mailable;
import com.tharindu.app.core.util.Environment;
import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MailServiceProvider {
    private final Properties prop = new Properties();
    private Authenticator authenticator;
    private static MailServiceProvider instance;
    private ThreadPoolExecutor executor;
    private BlockingQueue<Runnable> workQueue = new LinkedBlockingQueue<>();

    private MailServiceProvider() {
        prop.setProperty("mail.smtp.host", Environment.getProperty("mailtrap.host"));
//        prop.setProperty("mail.smtp.host", "sandbox.smtp.mailtrap.io");
        prop.setProperty("mail.smtp.port", Environment.getProperty("mailtrap.port"));
//        prop.setProperty("mail.smtp.port", "2525");
        prop.setProperty("mail.smtp.auth", "true");
        prop.setProperty("mail.smtp.starttls.enable", "true"); //No SSL Certificate
        prop.setProperty("mail.smtp.ssl.trust", Environment.getProperty("mailtrap.host"));
//        prop.setProperty("mail.smtp.ssl.trust", "*");
    }

    public static MailServiceProvider getInstance() {
        if (instance == null) {
            instance = new MailServiceProvider();
        }
        return instance;
    }

    public void start() {
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Environment.getProperty("mailtrap.username"), Environment.getProperty("mailtrap.password "));
//                return new PasswordAuthentication("cb72a7cbe1d997", "23ea1593db170a");
            }
        };
        executor = new ThreadPoolExecutor(
                5,
                10,
                5,
                TimeUnit.SECONDS,
                workQueue,
                new ThreadPoolExecutor.AbortPolicy());
        executor.prestartAllCoreThreads();
        System.out.println("Mail service provider started");
    }

    public void sendMail(Mailable mailable){
        workQueue.offer(mailable);
    }

    public Properties getProperties() {
        return prop;
    }

    public Authenticator getAuthenticator() {
        return authenticator;
    }

    public void shutdown() {
        if (executor != null) {
            executor.shutdown();
        }
    }
}
