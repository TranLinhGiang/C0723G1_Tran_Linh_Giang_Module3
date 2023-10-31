package com.example.product_mvc.repository;

import com.example.product_mvc.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    void update(Product product);

    void delete(int id);

    Product productDetails(int id);

    List<Product> searchByName(String name);
}
