package com.tharindu.app.web.servlet;

import com.tharindu.app.core.model.Product;
import com.tharindu.app.core.service.ProductService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/test")
public class Test extends HttpServlet {
    @EJB
    ProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try{
//            productService.deleteProduct((long) -12);
//        }catch (Exception e){
//            response.sendError(403, "The Product is not existed: " + e.getMessage());
//        }

        try{
          Optional<Product> productByName = productService.getProductByName("My Test Product");
         if(productByName.isPresent()){
             Product product = productByName.get();
         }
        }catch (Exception e){
            response.sendError(403, "The Product is not existed: " + e.getMessage());
        }
    }
}
