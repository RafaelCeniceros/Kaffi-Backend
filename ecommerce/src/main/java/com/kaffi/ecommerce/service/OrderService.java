package com.kaffi.ecommerce.service;

import java.util.List;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.User;

public interface OrderService {

	Order getOrderById(Long id);
	Order createOrder(Order order);
	List<Order> getAllOrders();
	Order updateOrder(Order order, Long id);
	void deleteOrder(Long id);
	List<Order> getAllOrdersOfUser(User user);
	
}
