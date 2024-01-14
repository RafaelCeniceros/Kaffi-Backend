package com.kaffi.ecommerce.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.Category;
import com.kaffi.ecommerce.repository.CategoryRepository;
import com.kaffi.ecommerce.repository.UserRepository;
import com.kaffi.ecommerce.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository categoryRepository;
	
	@Override
	public Category getCategoryById(Long id) {
		Optional<Category> categoryOptional = categoryRepository.findById(id);
		if (categoryOptional.isPresent()) return categoryOptional.get();
		else throw new IllegalStateException("Categoria no existe");
	}

	@Override
	public Category getCategoryByName(String name) {
		Optional<Category> existingCategory = categoryRepository.findByName(name);
		if (existingCategory.isPresent()) return existingCategory.get();
		else throw new IllegalStateException("Categoria no existe");
	}

	@Override
	public Category createCategory(Category category) {
		category.setId(null);
		// TODO Verificar que no exista el email.
		Category newCategory = categoryRepository.save( category );
		return newCategory;
	}
	
	
	@Override
	public List<Category> getAllCategories() {
		List<Category> categories = (List<Category>) categoryRepository.findAll();
		return categories;
	}

	@Override
	public Category updateCategory(Category category, Long id) {
		Category existingCategory = getCategoryById(id);
		existingCategory.setName( category.getName());
		existingCategory.setDescription( category.getDescription());
		// Si modificamos el email, se debe verificar que no exista.
		return categoryRepository.save(existingCategory);
	}

	@Override
	public void deleteCategory(Long id) {
		Category existingCategory = getCategoryById(id);
		categoryRepository.delete(existingCategory);
		
	}
	
	

}
