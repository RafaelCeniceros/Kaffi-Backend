package com.kaffi.ecommerce.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.repository.UserRepository;
import com.kaffi.ecommerce.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	
	@Override
	public User getUserById(Long id) {
		Optional<User> userOptional = userRepository.findById(id);
		
		if( userOptional.isPresent()) return userOptional.get();
		else throw new IllegalStateException("User does not exist with id " + id);
	}

	
	@Override
	public User getUserByEmail(String email) {
		Optional<User> existingUser = userRepository.findByEmail(email);
		if( existingUser.isPresent()) return existingUser.get();
		else throw new IllegalStateException("User does not exist with email " + email);
	}

	
	@Override
	public User createUser(User user) {
	    user.setId(null);

	    // Verificar que no exista el email antes de guardar el usuario
	    Optional<User> existingUser = userRepository.findByEmail(user.getEmail());
	    if (existingUser.isPresent()) {
	        throw new IllegalArgumentException("El correo electrónico ya está registrado");
	    }
	    
	    // Si el correo electrónico no existe, procedemos a guardar el nuevo usuario
	    User newUser = userRepository.save(user);
	    return newUser;
	}

	
	@Override
	public List<User> getAllUsers() {
		List<User> users = (List<User>) userRepository.findAll();
		return users;
	}

	
	@Override
	public User updateUser(User user, Long id) {
		User existingUser = getUserById(id); //Verifica que el id exista
		existingUser.setFirtName(user.getFirtName());
		existingUser.setLastName(user.getLastName());
		existingUser.setPassword(user.getPassword());
		existingUser.setAddress(user.getAddress());
		existingUser.setIdUserType(user.getIdUserType());
		
		// Verifica si el correo electrónico ha sido modificado
	    if (!existingUser.getEmail().equals(user.getEmail())) {
	        Optional<User> existingUserWithEmail = userRepository.findByEmail(user.getEmail());
	        if (existingUserWithEmail.isPresent()) {
	            throw new IllegalArgumentException("El nuevo correo electrónico ya está registrado");
	        }
	        // Si el correo electrónico no está duplicado, actualiza el correo electrónico del usuario existente
	        existingUser.setEmail(user.getEmail());
	    }
	    
	    // Guarda el usuario actualizado en la base de datos
	    return userRepository.save(existingUser);
	}

	
	@Override
	public void deteleUser(Long id) {
		User existingUser = getUserById(id);
		userRepository.delete(existingUser);
	}

}
