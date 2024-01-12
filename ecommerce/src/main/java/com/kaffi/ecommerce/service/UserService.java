package com.kaffi.ecommerce.service;

import java.util.List;
import com.kaffi.ecommerce.entity.User;

public interface UserService {
	
	User getUserById(Long id);
	User getUserByEmail(String email);
	User createUser(User user);
	List<User> getAllUsers();
	User updateUser(User user,Long id);
	void deteleUser(Long id);

}
