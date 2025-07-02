package com.tharindu.app.web.servlet;

import com.tharindu.app.core.model.Product;
import com.tharindu.app.core.service.ProductService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@ServletSecurity(@HttpConstraint(rolesAllowed = {"SUPER_ADMIN", "ADMIN"}))
@WebServlet("/admin/add-dinosaurs")
public class AddProduct extends HttpServlet {

    @EJB
    private ProductService productService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String qty = request.getParameter("quantity");
        String category = request.getParameter("category");

        Product product = new Product(name, description, Double.parseDouble(price), Double.parseDouble(qty), category);
        productService.saveProduct(product);

        response.sendRedirect(request.getContextPath() + "/index.jsp?message=Product added successfully");
        // Here you would typically call a service to save the product
    }
}

