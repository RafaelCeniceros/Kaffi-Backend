package com.kaffi.ecommerce.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.repository.OrderRepository;
import com.kaffi.ecommerce.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	@Override
	public Order getOrderById(Long id) {
		Optional<Order> orderOptional = orderRepository.findById(id);
		
		if(orderOptional.isPresent()) return orderOptional.get();
		else throw new IllegalStateException("Order id ( "+ id + " ) doesnt exist");
	}

	@Override
	public Order createOrder(Order order) {
		order.setId(null);
		Order newOrder = orderRepository.save(order);
		return newOrder;
	}

	@Override
	public List<Order> getAllOrders() {
		List<Order> orders = (List<Order>)orderRepository.findAll();
		return orders;
	}

	@Override
	public Order updateOrder(Order order, Long id) {
		Order existingOrder = getOrderById(id);
		existingOrder.setDate(order.getDate());
		existingOrder.setPrice(order.getPrice());
		return orderRepository.save(existingOrder);
	}

	@Override
	public void deleteOrder(Long id) {
		Order existingOrder = getOrderById(id);
		orderRepository.delete(existingOrder);
	}

	@Override
	public List<Order> getAllOrdersOfUser(User user) {
        Iterable<Order> orderIterable = orderRepository.findAllByUser(user);
        
        // Convierte el Iterable a una lista
        List<Order> orders = new ArrayList<>();
        orderIterable.forEach(orders::add);

        return orders;
    }

}
