package com.example.product_mvc.service;

import com.example.product_mvc.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    void update(Product product);
    void delete(int id);
    Product productDetails(int id);
    List<Product> searchByName(String name);
}
