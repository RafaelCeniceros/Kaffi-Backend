package com.kaffi.ecommerce.service;
import java.util.List;
import com.kaffi.ecommerce.entity.Product;

public interface ProductService {
    
    Product getProductById(Long id);
	Product getProductByName(String name);
    Product createProduct(Product product);
    List<Product> getAllProducts();
    Product updateProduct(Product product, Long id);
    void deleteProduct(Long id);
}
