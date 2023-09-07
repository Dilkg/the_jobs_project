package com.example.consultapp.model;

public class User {

    private int id;
    private String name;
    private String userName;

    private String password;

    private String role;
    private String phone;
    private String email;

    public User() {

    }
    public User(String name, String userName, String password, String email, String phone,String role) {
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.email=email;
        this.phone=phone;
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


}

