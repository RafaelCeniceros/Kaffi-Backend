package com.kaffi.ecommerce.service;

import java.util.List;

import com.kaffi.ecommerce.entity.Category;

public interface CategoryService {
	
	Category getCategoryById(Long id);
	Category getCategoryByName(String name);
	
	Category createCategory(Category category);
	
	List<Category> getAllCategories();
	
	Category updateCategory(Category category, Long id);

	void deleteCategory(Long id);

}
