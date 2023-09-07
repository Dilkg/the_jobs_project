package com.example.consultapp.servlet;

import com.example.consultapp.DAO.UserDao;
import com.example.consultapp.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "userServlet", value="/user")
public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        System.out.println("Received username: " + username);
        UserDao userDao = new UserDao();

        String role = userDao.getUserRoleByUsername(username);
        PrintWriter out = response.getWriter();

        User user = userDao.getUserByUsername(username);
        if(role != null){
            session.setAttribute("username", username);
            session.setAttribute("currentSessionUser",user);
            session.setAttribute("name",user.getName());
            session.setAttribute("id",user.getId());
            session.setAttribute("role",user.getRole());
            switch (role) {
                case "reception":
                    RequestDispatcher dispatcher = request.getRequestDispatcher("reception.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "jobseeker":
                    RequestDispatcher dispatcher1 = request.getRequestDispatcher("jobseeker.jsp");
                    dispatcher1.forward(request, response);
                    break;
                case "consultant":
                    RequestDispatcher dispatcher2 = request.getRequestDispatcher("admin.jsp");
                    dispatcher2.forward(request, response);
                    break;
            }
        }
//        if (role != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("username", username); // Store username in session
//
//            if (role.equals("reception")) {
//                response.sendRedirect("admin.jsp");
//            } else if (role.equals("jobseeker")) {
//                response.sendRedirect("jobseeker.jsp");
//            } else if (role.equals("consultant")) {
//                response.sendRedirect("admin.jsp");
//            }
//        } else {
//            response.sendRedirect("login.jsp?error=1"); // Redirect to login page with an error message
//        }
//
//        userDao.closeConnection();
    }
}
