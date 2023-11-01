package com.example.usermanager.repository;

import com.example.usermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public List<User> selectAllUsers();

    public boolean updateUser(User user) throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public User selectUser(int id);

    List<User> searchByCountry(String country);

    List<User> orderByName();
}