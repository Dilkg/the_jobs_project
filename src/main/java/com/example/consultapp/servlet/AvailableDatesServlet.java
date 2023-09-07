package com.example.consultapp.servlet;

import com.example.consultapp.DAO.ConsutantDao;
import com.example.consultapp.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AvailableDatesServlet")
public class AvailableDatesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String consultantIdStr = request.getParameter("consultantId");

        if (consultantIdStr != null && !consultantIdStr.isEmpty()) {


            // Replace this with your logic to fetch available dates from the database based on the consultant ID
            ConsutantDao consutantDao = new ConsutantDao();
            List<String> availableDates = null;
            try {
                availableDates = consutantDao.getDatesbyConsultantId(consultantIdStr);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // Convert the list of available dates to a JSON response
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("{\"dates\": [");
            for (int i = 0; i < availableDates.size(); i++) {
                jsonResponse.append("\"").append(availableDates.get(i)).append("\"");
                if (i < availableDates.size() - 1) {
                    jsonResponse.append(",");
                }
            }
            jsonResponse.append("]}");

            out.print(jsonResponse.toString());
        } else {
            out.print("{\"dates\": []}"); // Return an empty array if no consultant is selected
        }
        out.flush();
    }
}
