package com.example.consultapp.model;
public class Appointment {
	public String getGetStatus() {
		return getStatus;
	}

	public void setGetStatus(String getStatus) {
		this.getStatus = getStatus;
	}

	public String getStatus;

	public int getInitiator() {
		return initiator;
	}

	public void setInitiator(int initiator) {
		this.initiator = initiator;
	}

	public int getConsultant() {
		return consultant;
	}

	public void setConsultant(int consultant) {
		this.consultant = consultant;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private  int id;
	private int initiator;
	private int consultant;
	private String bookedDate;
	private String bookedTime;

	// Constructors
	public Appointment() {
		// Default constructor
	}

	public Appointment(int initiator, int consultant, String bookedDate, String bookedTime) {
		this.initiator = initiator;
		this.consultant = consultant;
		this.bookedDate = bookedDate;
		this.bookedTime = bookedTime;
		//this.id=id;
	}

	// Getter and Setter methods for initiator


	// Getter and Setter methods for bookedDate
	public String getBookedDate() {
		return bookedDate;
	}

	public void setBookedDate(String bookedDate) {
		this.bookedDate = bookedDate;
	}

	// Getter and Setter methods for bookedTime
	public String getBookedTime() {
		return bookedTime;
	}

	public void setBookedTime(String bookedTime) {
		this.bookedTime = bookedTime;
	}
}
