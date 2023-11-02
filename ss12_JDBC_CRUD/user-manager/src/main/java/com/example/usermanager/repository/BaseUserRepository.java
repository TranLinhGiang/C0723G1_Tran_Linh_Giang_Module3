package com.example.usermanager.repository;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseUserRepository {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "123456";
    public static Connection getConnectDB(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
