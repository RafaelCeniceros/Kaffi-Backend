package com.kaffi.ecommerce.repository;

import org.springframework.data.repository.CrudRepository;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.User;

public interface OrderRepository extends CrudRepository<Order,Long>{

	Iterable<Order> findAllByUser(User user);

}
