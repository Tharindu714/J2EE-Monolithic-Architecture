package com.tharindu.app.product;

import com.tharindu.app.core.exception.InvalidParameterException;
import com.tharindu.app.core.model.Product;
import com.tharindu.app.core.service.ProductService;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

@Stateless
public class ProductSessionBean implements ProductService {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Optional<Product> getProductById(Long id) {
        return Optional.ofNullable(em.find(Product.class, id));
//        return em.find(Product.class, id);
    }

    @Override
    public Optional<Product> getProductByName(String name) {
//        return em.createNamedQuery("Product.findByName", Product.class)
//                .setParameter("name", name).getSingleResult();
        try{
            TypedQuery<Product> query =
                    em.createNamedQuery("Product.findByName", Product.class)
                            .setParameter("name", name);
            return Optional.of(query.getSingleResult());
        }catch (NoResultException NRE){
            return Optional.empty();
        }
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

    @RolesAllowed({"SUPER_ADMIN", "ADMIN"})
    @Override
    public void deleteProduct(Long id) {
        if (id == null || id < 0) {
            throw new InvalidParameterException("Product ID cannot be null");
        }
        em.remove(getProductById(id));
    }
}
