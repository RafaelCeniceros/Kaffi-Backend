package com.kaffi.ecommerce.repository;

import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import com.kaffi.ecommerce.entity.Product;


public interface ProductRepository extends CrudRepository<Product, Long> {
	Optional<Product> findByName(String name);
	Iterable<Product> findAllByActive(boolean state);
}
