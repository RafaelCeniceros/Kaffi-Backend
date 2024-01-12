package com.kaffi.ecommerce.repository;

import java.util.Optional;
import com.kaffi.ecommerce.entity.Category;
import org.springframework.data.repository.CrudRepository;


public interface CategoryRepository extends CrudRepository<Category, Long>{
	
	Optional<Category> findByName(String name);
	 
}
