package com.example.consultapp.DAO;

import com.example.consultapp.model.Appointment;
import com.example.consultapp.model.JobSeeker;
import com.example.consultapp.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AppointmentDao {
    private final Connection connection;

    public AppointmentDao() {
        this.connection = DBConnect.getConnection();
    }

    public String makeAppointment(Appointment appointment) {
        String query = "INSERT INTO appointments (seekerId,consultantId,date,time) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, appointment.getInitiator());
            preparedStatement.setInt(2, appointment.getConsultant());
            preparedStatement.setString(3, appointment.getBookedDate());
            preparedStatement.setString(4, appointment.getBookedTime());

            preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    }

    public List<String> getAppointments() {

        List<String> appointments = new ArrayList<>();
        String query = "SELECT * FROM appointments";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                appointments.add(String.valueOf(resultSet.getInt("id")));
                appointments.add(resultSet.getString("date"));
                appointments.add(resultSet.getString("time"));


                UserDao userDao = new UserDao();
                appointments.add(userDao.getUserById(resultSet.getInt("consultantId")));
                appointments.add(userDao.getUserById(resultSet.getInt("seekerId")));


            }
            return appointments;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }

    public  List<Appointment> getAllAppointments() throws SQLException {
        String query = "SELECT * FROM appointments";

        List<Appointment> appointments = new ArrayList<>();

       try {
               PreparedStatement preparedStatement = connection.prepareStatement(query);
               ResultSet resultSet = preparedStatement.executeQuery();
               while (resultSet.next()) {
                   Appointment app = new Appointment();
                   app.setId(resultSet.getInt("id"));
                   app.setBookedDate(resultSet.getString("date"));
                   app.setBookedTime(resultSet.getString("time"));
                   app.setInitiator(resultSet.getInt("seekerId"));
                   app.setConsultant(resultSet.getInt("consultantId"));
                   app.setGetStatus((resultSet.getString("status")));
                   // Set other attributes as needed
                   appointments.add(app);
               }



       }catch (SQLException e) {
               e.printStackTrace();
               return null;
           }
           return appointments;

    }

    public  List<Appointment> getAppointmentsBySeekerId(int Sid) throws SQLException {
        String query = "SELECT * FROM appointments WHERE seekerId=?";

        List<Appointment> appointments = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Sid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Appointment app = new Appointment();
                app.setId(resultSet.getInt("id"));
                app.setBookedDate(resultSet.getString("date"));
                app.setBookedTime(resultSet.getString("time"));
                app.setInitiator(resultSet.getInt("seekerId"));
                app.setConsultant(resultSet.getInt("consultantId"));
                app.setGetStatus((resultSet.getString("status")));
                // Set other attributes as needed
                appointments.add(app);
            }



        }catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return appointments;

    }
    public String cancelAppointment(int appId) {
        String updateQuery = "UPDATE appointments SET status = 'canceled' WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            preparedStatement.setInt(1, appId);

            int rowsAffected = preparedStatement.executeUpdate();

            return "Success"; // Return true if at least one row was updated
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return "Error"; // Return false in case of an error
        }
    }
}
