package com.kaffi.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kaffi.ecommerce.entity.Product;
import com.kaffi.ecommerce.service.ProductService;

import lombok.extern.log4j.Log4j2;




@Log4j2
@CrossOrigin(origins="*")
@RestController
@RequestMapping("api/v1/products")
public class ProductController {
		
		@Autowired
		ProductService productService;
		
		@GetMapping
		List<Product> getAllProducts(){
			List<Product> products = productService.getAllProducts();
			return products;
		}
		
		@GetMapping("{id}")
		Product getProductById(@PathVariable("id") Long id) {
			log.info("Se solicita los datos del id:" + id);
			Product product = productService.getProductById(id);
			return product;
		}
		
		@PostMapping
		Product setProduct(@RequestBody Product product) {
			log.info("se esta creando un nuevo producto");
			log.info(product);
			Product newProduct = productService.createProduct(product);
			return newProduct;
		}
		
		@GetMapping("query")
		Product getProductByName(@RequestParam(name="name") String name) {
			return productService.getProductByName(name);
		}
		
		@PutMapping("{id}")
		Product updateProduct(@RequestBody Product product, @PathVariable("id") Long id) {
			return productService.updateProduct(product, id);
		}
		
		@DeleteMapping("{id}")
		String deleteCategory(@PathVariable("id") Long id) {
			productService.deleteProduct(id);
			return "se eliminó el producto id " + id;
		}
}

