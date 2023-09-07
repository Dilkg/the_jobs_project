package com.example.consultapp.model;

public class JobSeeker extends User {

    // Additional properties specific to JobSeeker (if any)
    // You can also add specific methods here

    // Constructors
    public JobSeeker() {
        super(); // Call the default constructor of the parent class
    }

    public JobSeeker(String name, String userName, String password, String email, String phone) {
        super(name, userName, password,email,phone, "jobseeker"); // Call the constructor of the parent class with "jobseeker" role
        // Initialize any additional properties specific to JobSeeker
    }
}
