package com.example.consultapp.servlet;

import com.example.consultapp.DAO.ConsutantDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/ConsultantViewSchedule")
public class ConsultantViewSchedule extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the consultant ID parameter from the request
        String consultantIdStr = request.getParameter("id");
        String consultantName = request.getParameter("name");
        ConsutantDao consutantDao = new ConsutantDao();
        try {
            Map<String, List<String>> scheduleMap = consutantDao.getConsultantSchedule(consultantIdStr);
            request.setAttribute("consultant", consultantName);
            request.setAttribute("consultantSchedule", scheduleMap);
            request.getRequestDispatcher("consultant-view-shedule.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

