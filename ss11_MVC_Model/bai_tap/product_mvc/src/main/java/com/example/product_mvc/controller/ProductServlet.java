package com.example.product_mvc.controller;

import com.example.product_mvc.model.Product;
import com.example.product_mvc.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveProduct(req, resp);
                break;
            case "edit":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    // phương thức show danh sách của post;
    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = productService.findAll();
        req.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/product/list.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // phương thức xóa của product thuộc get post;
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.delete(id);
        resp.sendRedirect("/product");
    }

    // phương thức sửa product thuộc get post;
    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter(req.getParameter("name"));
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String producer = req.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productService.update(product);
        resp.sendRedirect("/product");
    }

    // phương thức lưu product thuộc get post;
    private void saveProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String describe = req.getParameter("describe");
        String producer = req.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productService.save(product);
        resp.sendRedirect("/product");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAdd(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                showDelete(req, resp);
                break;
            case "view":
                showView(req, resp);
                break;
            case "searchByName":
                showSearchbyName(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }
//phương thức trả về trang searchByName.jsp hển thị thoogn tin product;
    private void showSearchbyName(HttpServletRequest req, HttpServletResponse resp) {
        String name= req.getParameter("name");
        List<Product>products= productService.searchByName(name);
        RequestDispatcher requestDispatcher;
        if(products == null){
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("products",products);
            requestDispatcher= req.getRequestDispatcher("view/product/searchByName");
        }
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // phương tức trả về trang view.jsp hiển thị thông tin của customer;
    private void showView(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product= productService.productDetails(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product",product);
            requestDispatcher= req.getRequestDispatcher("view/product/detail.jsp");
        }
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // phương thức trả về trang delete.jsp để hiển thị product để xóa;
    private void showDelete(HttpServletRequest req, HttpServletResponse resp) {
        int id= Integer.parseInt(req.getParameter("id"));
        Product product= this.productService.productDetails(id);
        RequestDispatcher requestDispatcher;
        if(product==null){
            requestDispatcher= req.getRequestDispatcher("error-404.jsp");
        }else {
            req.setAttribute("product",product);
            requestDispatcher= req.getRequestDispatcher("view/product/delete.jsp");
        }
        try {
            requestDispatcher.forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // phương thức trả về trang edit.jsp để hiển thị product để sửa;
    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.productDetails(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            req.setAttribute("product", product);
            requestDispatcher = req.getRequestDispatcher("view/product/edit.jsp");
        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // phương thức trả về trang add.jsp để tạo product;
    private void showAdd(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/product/create.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
