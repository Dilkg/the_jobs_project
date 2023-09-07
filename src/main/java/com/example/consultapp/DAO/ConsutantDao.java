package com.example.consultapp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConsutantDao {
    private final Connection connection;

    public ConsutantDao() {
        this.connection = DBConnect.getConnection();
    }


    public Map<String, List<String>> getConsultantSchedule(String consultantIdStr) throws SQLException {
        String query = "SELECT * FROM availabledates WHERE consultantId = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, Integer.parseInt(consultantIdStr));

        Map<String, List<String>> scheduleMap = new HashMap<>();

        ResultSet dateCheckResult = preparedStatement.executeQuery();
        while (dateCheckResult.next()) {
            int dateId = dateCheckResult.getInt("id");
            String date = dateCheckResult.getString("date");
            List<String> times = getTimesForDate(dateId);

            scheduleMap.put(date, times);
        }

        return scheduleMap;
    }

    public List<String> getTimesForDate(int dateId) throws SQLException {
        String query = "SELECT time FROM availabletimes WHERE dateId = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, dateId);

        List<String> times = new ArrayList<>();

        ResultSet timeCheckResult = preparedStatement.executeQuery();
        while (timeCheckResult.next()) {
            String time = timeCheckResult.getString("time");
            String withoutQuotes = time.replace("\"", "");
            times.add(withoutQuotes);
        }

        return times;
    }

    public List<String> getTimesFormDate(String date) throws SQLException {
        String query2 = "SELECT id FROM availabledates WHERE date = ?";
        PreparedStatement preparedStatement2 = connection.prepareStatement(query2);
        preparedStatement2.setString(1, date);
        ResultSet dateCheckResult2 = preparedStatement2.executeQuery();
        int dateId = 0;
        while (dateCheckResult2.next()) {
            dateId = dateCheckResult2.getInt("id");
        }
        String query = "SELECT time FROM availabletimes WHERE dateId = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1,dateId );

        List<String> times = new ArrayList<>();

        ResultSet timeCheckResult = preparedStatement.executeQuery();
        while (timeCheckResult.next()) {
            String time = timeCheckResult.getString("time");
            String withoutQuotes = time.replace("\"", "");
            times.add(withoutQuotes);
        }

        return times;
    }

    public  List<String> getDatesbyConsultantId(String consultantIdStr) throws SQLException {
        String query = "SELECT * FROM availabledates WHERE consultantId = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, Integer.parseInt(consultantIdStr));

        List<String> dates = new ArrayList<>();

        ResultSet dateCheckResult = preparedStatement.executeQuery();
        while (dateCheckResult.next()) {
            String date = dateCheckResult.getString("date");
            dates.add(date);
        }

        return dates;
    }
}
