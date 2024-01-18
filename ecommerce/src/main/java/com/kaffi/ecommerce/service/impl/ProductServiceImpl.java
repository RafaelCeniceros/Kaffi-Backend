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
		product.setId(null);
		product.setActive(true);
		
		// Verificar que no exista el nombre del producto antes de guardar el usuario
		Optional<Product> existingProduct = productRepository.findByName(product.getName());
	    if (existingProduct.isPresent()) {
	        throw new IllegalArgumentException("El producto ya está registrado");
	    }
	    
	    // Si el producto no existe, guardar el nuevo producto
	    Product newProduct = productRepository.save(product);
	    return newProduct;
	}

	@Override
	public List<Product> getAllProducts() {
		return (List<Product>) productRepository.findAll();
	}

	@Override
	public Product updateProduct(Product product, Long id) {
		Product existingProduct = getProductById(id);
		existingProduct.setPrice( product.getPrice() );
		existingProduct.setDescription( product.getDescription() );
		existingProduct.setImage( product.getImage() );
		existingProduct.setCategory( product.getCategory() );
	
		// Verifica si el nombre ha sido modificado
	    if (!existingProduct.getName().equals(product.getName())) {
	        Optional<Product> existingProductWithName = productRepository.findByName(product.getName());
	        if (existingProductWithName.isPresent()) {
	            throw new IllegalArgumentException("El nuevo producto ya está registrado");
	        }
	        // Si el nombre no está duplicado, actualiza el nombre del producto
	        existingProduct.setName(product.getName());
	    }
	    
	    // Guarda el usuario actualizado en la base de datos
	    return productRepository.save(existingProduct);
	}

	@Override
	public void deleteProduct(Long id) {
		Product existingProduct = getProductById(id);
		existingProduct.setActive(false);
		productRepository.save(existingProduct);
		
		
	}
}