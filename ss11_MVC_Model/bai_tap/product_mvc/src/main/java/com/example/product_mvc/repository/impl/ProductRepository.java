package com.example.product_mvc.repository.impl;

import com.example.product_mvc.model.Product;
import com.example.product_mvc.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList= new ArrayList<>();
    static {
        productList.add(new Product(1,"Táo",3000,"hết hàng","Việt Nam"));
        productList.add(new Product(1,"gan trời",150000,"còn hàng","Vũ trụ"));
        productList.add(new Product(1,"trứng khủng long",40000,"còn 2 quả","Vương quốc Jura"));
        productList.add(new Product(1,"Thịt trâu gác bếp",90000,"còn hàng","Việt Nam"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
    productList.add(product);
    }

    @Override
    public void update(Product product) {
        for (Product valueUpdate:productList) {
            if (valueUpdate.getId()==product.getId()){
                valueUpdate.setProductName(product.getProductName());
                valueUpdate.setPrice(product.getPrice());
                valueUpdate.setDescribe(product.getDescribe());
                valueUpdate.setProducer(product.getProducer());
            }
        }
    }

    @Override
    public void delete(int id) {
        for (Product valueDelete:productList) {
            if (valueDelete.getId()== id){
                productList.remove(valueDelete);
            }
        }
    }

    @Override
    public Product productDetails(int id) {
        for (Product valueDetail:productList) {
            if (valueDetail.getId()==id){
                return valueDetail;
            }
        }
        return null;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product>products= new ArrayList<>();
        for (Product valueSearchName:productList) {
            if (valueSearchName.getProductName().contains(name)){
                products.add(valueSearchName);
            }
        }
        return products;
    }
}
