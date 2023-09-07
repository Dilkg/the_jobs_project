package com.example.consultapp.model;

import java.util.ArrayList;
import java.util.List;

public class Consultant extends User {
    private List<AvailableSlot> availableSlots;

    public void setAvailableSlots(List<AvailableSlot> availableSlots) {
        this.availableSlots = availableSlots;
    }

    public Consultant() {
        super(); // Call the default constructor of the parent class
        availableSlots = new ArrayList<>();
    }

    public Consultant(String name, String userName, String password, String email, String phone) {
        super(name, userName, password,email,phone, "consultant"); // Call the constructor of the parent class with "consultant" role
        availableSlots = new ArrayList<>();

    }

    public void addAvailableSlot(AvailableSlot slot) {
        availableSlots.add(slot);
    }

    public List<AvailableSlot> getAvailableSlots() {

        return availableSlots;
    }

    public void updateAvailableDatesAndTimes(String[] times, String date)
    {

            AvailableSlot slot = new AvailableSlot(date, times);
            availableSlots.add(slot);

    }


}


