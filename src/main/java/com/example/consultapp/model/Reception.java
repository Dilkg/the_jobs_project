package com.example.consultapp.model;

public class Reception extends User {
    // You can add specific properties for the Reception role here

    public Reception() {
        super(); // Call the default constructor of the parent class
    }

    public Reception(String name, String userName, String password) {
        super(name, userName, password,"","", "reception"); // Call the constructor of the parent class with "reception" role
        // Initialize any additional properties specific to Reception
    }

    // You can add specific methods for the Reception role here
}
