package com.example.consultapp.model;

public class AvailableSlot {
    private String date;
    private String[] times;

    public AvailableSlot(String date, String[] times) {
        this.date = date;
        this.times = times;
    }

    public String getDate() {
        return date;
    }

    public String[] getTimes() {
        return times;
    }
}

