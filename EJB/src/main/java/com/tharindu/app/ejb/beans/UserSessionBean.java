package com.tharindu.app.ejb.beans;

import com.tharindu.app.core.model.User;
import com.tharindu.app.core.service.UserService;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class UserSessionBean implements UserService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public User getUserById(Long id) {
        return em.find(User.class, id);
    }

    @Override
    public User getUserByEmail(String name) {
        return
                em.createNamedQuery("User.findByEmail", User.class)
                        .setParameter("email", name).getSingleResult();
    }

    @Override
    public void saveUser(User user) {
        em.persist(user);
    }

    @Override
    public void updateUser(User user) {
        em.merge(user);
    }

    @Override
    public void deleteUser(User user) {
        em.remove(user);
    }

    @Override
    public boolean validate(String email, String password) {
//        em.createNamedQuery("User.findByEmail", User.class)
//                .setParameter("email", email)
//                .getSingleResult();

        User user = em.createNamedQuery("User.findByEmailAndPassword", User.class)
                .setParameter("email", email)
                .setParameter("password", password)
                .getSingleResult();
        return user != null;
    }
}
