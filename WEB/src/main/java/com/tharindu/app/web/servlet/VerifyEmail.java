package com.tharindu.app.web.servlet;

import com.tharindu.app.core.model.Status;
import com.tharindu.app.core.model.User;
import com.tharindu.app.core.service.UserService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Base64;

@WebServlet("/verify-email")
public class VerifyEmail extends HttpServlet {

    @EJB
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String vc = request.getParameter("code");

      byte[] bytes =  Base64.getDecoder().decode(vc);
      String email = new String(bytes);

        User user = userService.getUserByEmail(email);
        if(user != null && user.getVerificationCode().equals(vc)){
            user.setStatus(Status.ACTIVE);
            userService.updateUser(user);
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp?message=Email+verified+successfully!&type=success");
    }
}
