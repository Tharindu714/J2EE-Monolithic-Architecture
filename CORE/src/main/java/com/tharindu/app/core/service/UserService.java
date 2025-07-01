package com.tharindu.app.core.service;

import com.tharindu.app.core.model.User;
import jakarta.ejb.Remote;

@Remote
public interface UserService {
    User getUserById(Long id);
    User getUserByEmail(String name);
    void saveUser(User user);
    void updateUser(User user);
    void deleteUser(User user);
    boolean validate(String email, String password);
}
