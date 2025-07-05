package com.tharindu.app.core.service;

import com.tharindu.app.core.model.Product;
import jakarta.ejb.Remote;

import java.util.List;
import java.util.Optional;

@Remote
public interface ProductService {
   Optional <Product> getProductById(Long id);

    Optional <Product> getProductByName(String name);

    List<Product> getAllProducts();

    List<Product> getProductsByCategory(String category);

    void saveProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(Long id);
}
