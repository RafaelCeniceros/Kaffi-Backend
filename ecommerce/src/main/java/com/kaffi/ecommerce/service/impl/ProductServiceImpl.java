package com.kaffi.ecommerce.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.Category;
import com.kaffi.ecommerce.entity.Product;
import com.kaffi.ecommerce.repository.ProductRepository;
import com.kaffi.ecommerce.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public Product getProductById(Long id) {
		return productRepository.findById(id).orElseThrow(()-> new IllegalStateException("Product does not exist with id " + id) );
	}
	
	@Override
	public Product getProductByName(String name) {
		Optional<Product> existingProduct = productRepository.findByName(name);
		if (existingProduct.isPresent()) return existingProduct.get();
		else throw new IllegalStateException("Producto no existe");
	}

	@Override
	public Product createProduct(Product product) {
		return productRepository.save(product);
	}

	@Override
	public List<Product> getAllProducts() {
		return (List<Product>) productRepository.findAll();
	}

	@Override
	public Product updateProduct(Product product, Long id) {
		Product existingProduct = getProductById(id);
		existingProduct.setName( product.getName() );
		existingProduct.setPrice( product.getPrice() );
		existingProduct.setDescription( product.getDescription() );
		existingProduct.setImage( product.getImage() );
		existingProduct.setCategoryId( product.getCategoryId() );
		return productRepository.save(existingProduct);
	}

	@Override
	public void deleteProduct(Long id) {
		// TODO Auto-generated method stub
		
	}
}