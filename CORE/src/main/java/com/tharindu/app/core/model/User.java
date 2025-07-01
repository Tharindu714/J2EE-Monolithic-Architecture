package com.tharindu.app.core.model;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "users")
@NamedQueries({
        @NamedQuery(name = "User.findByEmail", query = "select u from User u where u.email =:email"),
        @NamedQuery(name = "User.findByEmailAndPassword", query = "select u from User u where u.email =:email and u.password =:password")
})
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    private String password;

    @Column(unique = true)
    private String email;

    private String contact;

    @Enumerated(EnumType.STRING)
    private UserType userType = UserType.USER; // Default user type

    public User() {
    }

    public User(String username, String email, String contact, String password) {
        this.username = username;
        this.email = email;
        this.contact = contact;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }
}
