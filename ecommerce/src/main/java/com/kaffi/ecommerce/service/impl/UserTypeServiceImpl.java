package com.kaffi.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.UserType;
import com.kaffi.ecommerce.repository.UserTypeRepository;
import com.kaffi.ecommerce.service.UserTypeService;

@Service
public class UserTypeServiceImpl implements UserTypeService {

	@Autowired
	UserTypeRepository userTypeRepository;

	@Override
	public UserType getUserTypeById(Long id) {
		return userTypeRepository.findById(id)
				.orElseThrow( ()-> new IllegalStateException("User_Type does not exist with id " + id));
	}

	@Override
	public UserType createUserType(UserType userType) {
		return userTypeRepository.save(userType);
	}

	@Override
	public List<UserType> getAllUserType() {
		return (List<UserType>) userTypeRepository.findAll();
	}

	@Override
	public UserType updateUserType(UserType userType, Long id) {
		UserType existingUserType = getUserTypeById(id);
		existingUserType.setTypeName( userType.getTypeName() );
		existingUserType.setDescription(userType.getDescription());
		return userTypeRepository.save(existingUserType);
	}

	@Override
	public void deleteUserTytpe(Long id) {
		UserType existingUser = getUserTypeById(id);
		userTypeRepository.delete(existingUser);
	}
}
