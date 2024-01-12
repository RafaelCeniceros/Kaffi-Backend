package com.kaffi.ecommerce.repository;

import java.util.Optional;
import com.kaffi.ecommerce.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long>{
	
	Optional<User> findByEmail(String email);

}
