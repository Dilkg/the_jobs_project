package com.example.consultapp.DAO;

import com.example.consultapp.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private final Connection connection;

    public UserDao() {
        // Initialize the database connection
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String username = "your_username";
        String password = "your_password";

        connection = DBConnect.getConnection();
    }


    public String getUserRoleByUsername(String username) {
        String query = "SELECT role FROM users WHERE username = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no user with the given username is found
    }

    public User getUserByUsername(String username) {
        String query = "SELECT id, name, username, role FROM users WHERE username = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setUserName(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no user with the given username is found
    }

//    public User getConsultants(){
//        String query = "SELECT * FROM users WHERE role = 'consultant'";
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(query);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {
//                User user = new User();
//                user.setId(resultSet.getInt("id"));
//                user.setName(resultSet.getString("name"));
//                user.setUserName(resultSet.getString("username"));
//                user.setRole(resultSet.getString("role"));
//                return user;
//            }
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

    public List<User> getConsultantUsers() {
        List<User> consultants = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'consultant'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                // Set other attributes as needed
                consultants.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultants;
    }

    public String getUserById(int id) {
        String name = null; // Initialize the name

        String query = "SELECT name FROM users WHERE id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id); // Set the parameter value
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                name = resultSet.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return name;
    }



    public String registerJobSeeker(JobSeeker jobSeeker) {
        String query = "INSERT INTO users (name, username, password, role) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, jobSeeker.getName());
            preparedStatement.setString(2, jobSeeker.getUserName());
            preparedStatement.setString(3, jobSeeker.getPassword());
            preparedStatement.setString(4, jobSeeker.getRole());

            preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    }
    public void updateJobSeeker(JobSeeker jobSeeker){
        String query = "UPDATE users SET name = ?, username = ?, password = ? WHERE id = ?";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, jobSeeker.getName());
            preparedStatement.setString(2, jobSeeker.getUserName());
            preparedStatement.setString(3, jobSeeker.getPassword());
            preparedStatement.setInt(4, jobSeeker.getId());

            preparedStatement.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }


    public void  updateConsultants(Consultant consultant){
        String query = "UPDATE users SET name = ?, username = ?, password = ? WHERE id = ?";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, consultant.getName());
            preparedStatement.setString(2, consultant.getUserName());
            preparedStatement.setString(3, consultant.getPassword());
            preparedStatement.setInt(4, consultant.getId());

            preparedStatement.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    public List<User> getJobSeekers() {
        List<User> consultants = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'jobseeker'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                // Set other attributes as needed
                consultants.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultants;
    }

    public List<User> getAllUsersByid(int id) {
        List<User> consultants = new ArrayList<>();
        String query = "SELECT * FROM users WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setUserName(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                // Set other attributes as needed
                consultants.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return consultants;
    }

    public String deleteUser(int userId) {
        String query = "DELETE FROM users WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    }


    public String registertConsultant(Consultant consultant) {
        String query = "INSERT INTO users (name,username,password,phone,email,role) VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, consultant.getName());
            preparedStatement.setString(2, consultant.getUserName());
            preparedStatement.setString(3, consultant.getPassword());
            preparedStatement.setString(4, consultant.getPhone());
            preparedStatement.setString(5, consultant.getEmail());
            preparedStatement.setString(6, "consultant");

            System.out.println(consultant.getName());
            System.out.println(consultant.getUserName());
            System.out.println(consultant.getPassword());
            System.out.println(consultant.getEmail());
            System.out.println(consultant.getPhone());


            preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "error";
    }


    public String updateAvailableDateTime(Consultant consultant,String id) {
        String insertDateQuery = "INSERT INTO availabledates (date, consultantId) VALUES (?, ?)";
        String insertTimeQuery = "INSERT INTO availabletimes (time, dateId) VALUES (?, ?)";
        String updateDateQuery = "UPDATE availabledates SET date = ? WHERE id = ?";
        String updateTimeQuery = "UPDATE availabletimes SET time = ? WHERE dateId = ?";

        try {
            for (int i = 0; i < consultant.getAvailableSlots().size(); i++) {
                AvailableSlot availableSlot = consultant.getAvailableSlots().get(i);

                // Check if the date already exists in the availabledates table
                int dateId;
                PreparedStatement dateCheckStatement = connection.prepareStatement("SELECT id FROM availabledates WHERE date = ? AND consultantId = ?");
                dateCheckStatement.setString(1, availableSlot.getDate());
                dateCheckStatement.setInt(2, Integer.parseInt(id));
                ResultSet dateCheckResult = dateCheckStatement.executeQuery();

                if (dateCheckResult.next()) {
                    // Date exists, update it
                    dateId = dateCheckResult.getInt("id");
                    PreparedStatement updateDateStatement = connection.prepareStatement(updateDateQuery);
                    updateDateStatement.setString(1, availableSlot.getDate());
                    updateDateStatement.setInt(2, Integer.parseInt(id));
                    updateDateStatement.executeUpdate();
                } else {
                    // Date does not exist, insert it
                    PreparedStatement insertDateStatement = connection.prepareStatement(insertDateQuery, Statement.RETURN_GENERATED_KEYS);
                    insertDateStatement.setString(1, availableSlot.getDate());
                    insertDateStatement.setInt(2, Integer.parseInt(id));
                    insertDateStatement.executeUpdate();

                    ResultSet generatedKeys = insertDateStatement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        dateId = generatedKeys.getInt(1);
                    } else {
                        System.out.println("No generated keys were retrieved.");
                        continue;
                    }
                }

                // Update or insert times for the date
                for (String time : availableSlot.getTimes()) {
                        PreparedStatement insertTimeStatement = connection.prepareStatement(insertTimeQuery);
                        insertTimeStatement.setString(1, time);
                        insertTimeStatement.setInt(2, dateId);
                        insertTimeStatement.executeUpdate();

                }
            }
            return "Success";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error";
        }
    }

    public void registerReception(Reception reception) {
        String query = "INSERT INTO users (name, username, password, role) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, reception.getName());
            preparedStatement.setString(2, reception.getUserName());
            preparedStatement.setString(3, reception.getPassword());
            preparedStatement.setString(4, reception.getRole());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Other methods for updating user information, fetching user details, etc.

    // Close the connection
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
