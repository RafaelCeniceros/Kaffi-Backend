package com.kaffi.ecommerce.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import com.kaffi.ecommerce.entity.Product;
import com.kaffi.ecommerce.entity.User;


public interface ProductRepository extends CrudRepository<Product, Long> {
	Optional<Product> findByName(String name);

}
