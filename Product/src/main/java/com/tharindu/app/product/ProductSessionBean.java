package com.tharindu.app.product;

import com.tharindu.app.core.model.Product;
import com.tharindu.app.core.service.ProductService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class ProductSessionBean implements ProductService {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Product getProductById(Long id) {
        return em.find(Product.class, id);
    }

    @Override
    public Product getProductByName(String name) {
        return em.createNamedQuery("Product.findByName", Product.class)
                .setParameter("name", name).getSingleResult();
    }

    @Override
    public List<Product> getAllProducts() {
        return em.createNamedQuery("Product.getAllProducts", Product.class)
                .getResultList();
    }

    @Override
    public List<Product> getProductsByCategory(String category) {
        return em.createNamedQuery("Product.findByCategory", Product.class)
                .setParameter("category", category).getResultList();
    }

    @Override
    public void saveProduct(Product product) {
        em.persist(product);
    }

    @Override
    public void updateProduct(Product product) {
        em.merge(product);
    }

    @Override
    public void deleteProduct(Long id) {
        em.remove(getProductById(id));
    }
}
