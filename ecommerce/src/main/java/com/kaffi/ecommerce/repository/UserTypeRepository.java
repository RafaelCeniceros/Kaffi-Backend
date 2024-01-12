package com.kaffi.ecommerce.repository;

import org.springframework.data.repository.CrudRepository;
import com.kaffi.ecommerce.entity.UserType;

public interface UserTypeRepository extends CrudRepository<UserType, Long> {

}
