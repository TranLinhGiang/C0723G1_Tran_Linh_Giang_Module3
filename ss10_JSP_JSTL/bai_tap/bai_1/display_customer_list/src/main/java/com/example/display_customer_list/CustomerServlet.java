package com.example.display_customer_list;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList= new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIxEZ3ssrBifPB-SyR9vanp4JTImQq1CoJFA&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgAJ2BERGqT3I3TZQipKLCtHSO5y8k9X9tqw&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgjRbE4lhGuizaTohtgqPcPc08b3oQBI-4pQ&usqp=CAU"));
        customerList.add(new Customer("trần Đăng Khoa","19083-08-17","Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vNi9UUG59wdK1FRQ7k389dY6zQ3bf62M7WQWdwh5U__tGjfkC6ZuUKYM07slXC6J5Ng&usqp=CAU"));
        customerList.add(new Customer("Nguyễn Đình Thi","19083-08-14","Sơn La","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUUwbrr5fv6w6LViP-Y8GeS618Yrj3GGy6iA&usqp=CAU"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     req.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
