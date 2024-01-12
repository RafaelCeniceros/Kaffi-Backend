package com.kaffi.ecommerce.controller;

import java.util.List;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import lombok.extern.log4j.Log4j2;

@Log4j2
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/v1/users")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping
	List<User> getAllUsers(){
		List<User> users = userService.getAllUsers();
		return users;
	}
	
	@GetMapping("{id}")
	User getUserById(@PathVariable("id") Long id) {
		log.info("Se solicita los datos del id:" + id);
		User user = userService.getUserById(id);
		return user;
	}
	
	@PostMapping
	User setUser(@RequestBody User user) {
		log.info("Se está creando un nuevo usuario");
		log.info(user);
		User newUser = userService.createUser(user);
		return newUser;
	}
	
	@GetMapping("query") // localhost:8080/api/v1/users/query?email=jose@gmail.com
	User getUserByEmail(@RequestParam(name="email") String email) {
		return userService.getUserByEmail(email);
	}
	
	@PutMapping("{id}")
	User updateUser(@RequestBody User user, @PathVariable("id") Long id) {
		return userService.updateUser(user, id);
	}
	
	@DeleteMapping("{id}")
	String deleteUser(@PathVariable("id")Long id) {
		userService.deteleUser(id);
		return "Se elimino el usuario id" + id;
	}
}
