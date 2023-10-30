package com.example.calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Calculator", value = "/cal")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double firstOperand= Double.parseDouble(req.getParameter("firstOperand"));
        int operator= Integer.parseInt(req.getParameter("operator"));
        double secondOperand= Double.parseDouble(req.getParameter("secondOperand"));
        RequestDispatcher requestDispatcher= req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req,resp);
    }
}
