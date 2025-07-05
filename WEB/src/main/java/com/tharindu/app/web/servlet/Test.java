package com.tharindu.app.web.servlet;

import com.tharindu.app.core.service.ProductService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/test")
public class Test extends HttpServlet {
    @EJB
    ProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            productService.deleteProduct((long) 12);
        }catch (Exception e){
            response.sendError(403, "The Product is not existed: " + e.getMessage());
        }
    }
}
