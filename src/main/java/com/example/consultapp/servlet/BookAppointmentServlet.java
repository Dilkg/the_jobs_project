package com.example.consultapp.servlet;

import com.example.consultapp.DAO.AppointmentDao;
import com.example.consultapp.DAO.UserDao;
import com.example.consultapp.model.Appointment;
import com.example.consultapp.model.Consultant;
import com.example.consultapp.model.JobSeeker;
import com.example.consultapp.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);

       try
       {
           HttpSession session = req.getSession();
           String consultant=req.getParameter("consultant");
           String seeker=req.getParameter("seeker");
           String date=req.getParameter("date");
           String time=req.getParameter("time");
           String status="Error";
           String reqType = req.getParameter("req");
           String id = req.getParameter("id");

           String usertype= session.getAttribute("role").toString();



           if(reqType.equals("remove"))
           {
               String dynamicURL = req.getContextPath() + "/user";

               int appId = Integer.parseInt(id);

               AppointmentDao AppDao = new AppointmentDao();
               status= AppDao.cancelAppointment(appId);

               resp.sendRedirect(dynamicURL);

           }
           else {

               int seekerId = Integer.parseInt(seeker);
               int consultantId = Integer.parseInt(consultant);

               AppointmentDao appointmentDao = new AppointmentDao();

               Appointment appointment = new Appointment(seekerId,consultantId,date,time);
               status=appointmentDao.makeAppointment(appointment);


           }
           if(status.equals("success"))
           {
               if(usertype.equals("jobseeker"))
               {
                   RequestDispatcher dispatcher1 = req.getRequestDispatcher("jobseeker.jsp");
                   dispatcher1.forward(req, resp);
               }
               else
               {
                   RequestDispatcher dispatcher1 = req.getRequestDispatcher("reception.jsp");
                   dispatcher1.forward(req, resp);
               }

           }
       }catch (Exception e)
       {

       }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);


    }
}
