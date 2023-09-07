package com.example.consultapp.servlet;

import com.example.consultapp.DAO.UserDao;
import com.example.consultapp.model.Consultant;
import com.example.consultapp.model.JobSeeker;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Objects;

@WebServlet("/ConsultantJobSeekerRegisterServlet")
public class ConsultantJobSeekerRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);

        HttpSession session = req.getSession();

        resp.setContentType("text/html");
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String userRole = req.getParameter("userRole");
        String reqType = req.getParameter("req");
        String id=req.getParameter("id");
        String status="error";
        String usertype= session.getAttribute("role").toString();

        if(reqType.equals("register"))
        {
            if(userRole.equals("consultant")) {

                Consultant consultant = new Consultant(name, userName, password, email, phone);

                UserDao userDao = new UserDao();
                status= userDao.registertConsultant(consultant);
            }
            else
            {
                JobSeeker jobSeeker=new JobSeeker(name, userName, password, email,phone);

                UserDao userDao = new UserDao();
                status= userDao.registerJobSeeker(jobSeeker);
            }


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

        if(reqType.equals("remove"))
        {
            int userId = Integer.parseInt(id);
            UserDao userDao = new UserDao();
            status= userDao.deleteUser(userId);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);


    }
}
