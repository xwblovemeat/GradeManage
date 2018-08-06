package edu.hrbeu.msc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        if (req.getServletPath().indexOf("/destroySession.do") != -1) {
            req.getSession().invalidate();
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }
}
