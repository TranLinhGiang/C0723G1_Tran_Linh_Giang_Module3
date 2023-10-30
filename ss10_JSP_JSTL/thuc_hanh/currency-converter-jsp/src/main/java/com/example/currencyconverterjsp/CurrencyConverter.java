package com.example.currencyconverterjsp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CurrencyConverter", value = "/convert")
public class CurrencyConverter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // khai bao
        float rate= Float.parseFloat(req.getParameter("rate"));
        float usd= Float.parseFloat(req.getParameter("usd"));
        float vnd= rate*usd;
        // kep du lieu de gui di
        req.setAttribute("rate", rate);
        req.setAttribute("usd", usd);
        req.setAttribute("vnd", vnd);
        // chuyen tu dervlet sang jsp de hien thi;
        RequestDispatcher requestDispatcher= req.getRequestDispatcher("converter.jsp");
        requestDispatcher.forward(req,resp);

    }
}
