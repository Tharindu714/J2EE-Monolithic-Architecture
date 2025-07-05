package com.tharindu.app.web.servlet;

import com.tharindu.app.core.mail.VerificationEmail;
import com.tharindu.app.core.model.User;
import com.tharindu.app.core.provider.MailServiceProvider;
import com.tharindu.app.core.service.UserService;
import com.tharindu.app.core.util.Encryption;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/register")
public class Register extends HttpServlet {
    @EJB
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
//        String password = request.getParameter("password");

        //New encrypted Passwords
        String Encrypted_password = Encryption.encrypt(request.getParameter("password"));

        User user = new User(name, email, contact, Encrypted_password);

        //Send Email to new User
        String V_CODE = UUID.randomUUID().toString();
        user.setVerificationCode(V_CODE);
        // Save the user with the verification code
        userService.saveUser(user);

        VerificationEmail V_MAIL = new VerificationEmail(email, V_CODE);
        MailServiceProvider.getInstance().sendMail(V_MAIL);

        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
