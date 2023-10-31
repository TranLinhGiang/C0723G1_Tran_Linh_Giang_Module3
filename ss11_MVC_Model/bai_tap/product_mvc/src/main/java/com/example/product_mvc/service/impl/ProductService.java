package com.example.product_mvc.service.impl;

import com.example.product_mvc.model.Product;
import com.example.product_mvc.repository.impl.ProductRepository;
import com.example.product_mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private final ProductRepository productRepository= new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product productDetails(int id) {
        return productRepository.productDetails(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }
}
