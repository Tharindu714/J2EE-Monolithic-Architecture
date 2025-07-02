package com.tharindu.app.web.servlet;

import com.tharindu.app.core.service.ProductService;
import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/delete_dino")
public class DeleteProduct extends HttpServlet {

    @EJB
    private ProductService productService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String dinoID =  req.getParameter("dino_id");

       productService.deleteProduct(Long.parseLong(dinoID));
       resp.sendRedirect(req.getContextPath()+"/admin");
    }
}
