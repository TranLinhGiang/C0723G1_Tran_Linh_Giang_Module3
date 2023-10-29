package com.example.product_discount_calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="DiscountServlet", value ="/index")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription= req.getParameter("productDescription");
        double listPrice= Double.parseDouble(req.getParameter("listPrice"));
        double discountPercent= Double.parseDouble(req.getParameter("discountPercent"));
        double discountAmount= listPrice*discountPercent*0.01;
        double priceAfterDiscount= listPrice-discountAmount;

        // kẹp dữ liệu và request để gửi đi
        req.setAttribute("productDescription",productDescription);
        req.setAttribute("listPrice", listPrice);
        req.setAttribute("discountPercent", discountPercent);
        req.setAttribute("discountAmount",discountAmount);
        req.setAttribute("priceAfterDiscount",priceAfterDiscount);
        // chuyển từ servlet => jsp để hiển thị
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(req, resp);
    }

}
