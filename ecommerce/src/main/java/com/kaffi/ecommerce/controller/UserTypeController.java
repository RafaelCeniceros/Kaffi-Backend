package com.kaffi.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kaffi.ecommerce.entity.UserType;
import com.kaffi.ecommerce.service.UserTypeService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/v1/tipos_usuarios")
public class UserTypeController {
	
	@Autowired
	UserTypeService userTypeService;
	
	@PostMapping
	ResponseEntity<UserType> setUserType(@RequestBody UserType userType){
		UserType newUserType = userTypeService.createUserType(userType);
		return new ResponseEntity<>( newUserType, HttpStatus.CREATED);
	}
	
	@GetMapping
	ResponseEntity< List<UserType> > getAllUserType(){
		List<UserType> userType = userTypeService.getAllUserType();
		return new ResponseEntity<>( userType, HttpStatus.OK);
	}

}
