package com.kaffi.ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.UserType;

@Service
public interface UserTypeService {
	
	UserType getUserTypeById(Long id);
	UserType createUserType(UserType userType);
	List<UserType> getAllUserType();
	UserType updateUserType(UserType user, Long id);
	void deleteUserTytpe(Long id);

}
