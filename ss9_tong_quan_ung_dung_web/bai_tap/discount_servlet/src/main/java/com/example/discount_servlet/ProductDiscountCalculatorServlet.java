package com.example.discount_servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="ProductDiscountCalculator", value = "/product")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String description= req.getParameter("Product Description");
    float price= Float.parseFloat(req.getParameter("List Price"));
    float discount= Float.parseFloat(req.getParameter("Discount Percent"));
    float discountAmount= price*discount* 0.01f;
    float discountPrice= price-discountAmount;
    req.setAttribute("description",description);
    req.setAttribute("price",price);
    req.setAttribute("discount",discount);
    req.setAttribute("discountAmount",discountAmount);
    req.setAttribute("discountPrice",discountPrice);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/discount.jsp");
        requestDispatcher.forward(req,resp);
    }
    }

