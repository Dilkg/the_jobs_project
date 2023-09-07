package com.example.consultapp.servlet;

import com.example.consultapp.DAO.UserDao;
import com.example.consultapp.model.Consultant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/ConsultantOnlyAddSheduleServlet")
public class ConsultantOnlyScheduleServelet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);

        HttpSession session = req.getSession();

        String timeSlotsArrayJson = req.getParameter("timeSlotsArray");
        String date = req.getParameter("date");
        String consultantId = req.getParameter("userid");

        // You need to parse the JSON-encoded array back to a Java array
        String[] timeSlotsArray = new String[0]; // Default empty array

        if (timeSlotsArrayJson != null && !timeSlotsArrayJson.isEmpty()) {
            timeSlotsArray = timeSlotsArrayJson.replace("[", "").replace("]", "").split(", ");
        }

        Consultant consultant = new Consultant();
        consultant.updateAvailableDatesAndTimes(timeSlotsArray,date);

        // Save data to the database using the UserDao class
        UserDao userDao = new UserDao();
        String status = userDao.updateAvailableDateTime(consultant,consultantId);

        if (Objects.equals(status, "Success")){

            //session.setAttribute("userName", userName);
            //session.setAttribute("role", "consultant");
            resp.sendRedirect("consultant-only-shedule.jsp");
        }


    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);


    }
}
