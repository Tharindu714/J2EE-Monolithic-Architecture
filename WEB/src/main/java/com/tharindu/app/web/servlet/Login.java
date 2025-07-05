package com.tharindu.app.web.servlet;

import com.tharindu.app.core.exception.LoginFailedException;
import com.tharindu.app.core.util.Encryption;
import jakarta.inject.Inject;
import jakarta.security.enterprise.AuthenticationStatus;
import jakarta.security.enterprise.SecurityContext;
import jakarta.security.enterprise.authentication.mechanism.http.AuthenticationParameters;
import jakarta.security.enterprise.credential.UsernamePasswordCredential;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Inject
    private SecurityContext securityContext;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Here you would typically validate the email and password against a database or authentication service
        // For simplicity, let's assume the login is always successful

        AuthenticationParameters AUTH_PARAMS = AuthenticationParameters.withParams()
                .credential(new UsernamePasswordCredential(email, Encryption.encrypt(password)));

       AuthenticationStatus AUTH_STATUS = securityContext.authenticate(request,response,AUTH_PARAMS);
        System.out.println("Authentication Status: " + AUTH_STATUS);
       if (AUTH_STATUS == AuthenticationStatus.SUCCESS) {
           response.sendRedirect(request.getContextPath() + "/home.jsp");
       }else {
//           response.sendRedirect(request.getContextPath() + "/login.jsp");
           throw new LoginFailedException("Invalid email or password. Please try again.");
       }
    }
}
