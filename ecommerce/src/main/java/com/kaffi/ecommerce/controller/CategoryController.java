package com.kaffi.ecommerce.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.kaffi.ecommerce.entity.Category;
import com.kaffi.ecommerce.service.CategoryService;

import lombok.extern.log4j.Log4j2;


@Log4j2
@CrossOrigin(origins="*")
@RestController
@RequestMapping("api/v1/categories")
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	@GetMapping
	List<Category> getAllCategories(){
		List<Category> categories = categoryService.getAllCategories();
		return categories;
	}
	
	@GetMapping("{id}")
	Category getCategoryById(@PathVariable("id") Long id) {
		log.info("Se solicita los datos del id:" + id);
		Category category = categoryService.getCategoryById(id);
		return category;
	}
	
	@PostMapping
	Category setCategory(@RequestBody Category category) {
		log.info("se esta creando una nueva categoria");
		log.info(category);
		Category newCategory = categoryService.createCategory(category);
		return newCategory;
	}
	
	@GetMapping("query")
	Category getCategoryByName(@RequestParam(name="name") String name) {
		return categoryService.getCategoryByName(name);
	}
	
	@PutMapping("{id}")
	Category updateCategory(@RequestBody Category category, @PathVariable("id") Long id) {
		return categoryService.updateCategory(category, id);
	}
	
	@DeleteMapping("{id}")
	String deleteCategory(@PathVariable("id") Long id) {
		categoryService.deleteCategory(id);
		return "se eliminó la categoria id " + id;
	}
	
}
