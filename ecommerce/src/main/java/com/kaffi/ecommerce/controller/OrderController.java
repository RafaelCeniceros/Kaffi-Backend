package com.kaffi.ecommerce.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.service.OrderService;



@RestController
@RequestMapping("api/v1/orders")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@GetMapping
	List<Order> getAllOrders(){
		List<Order> orders = orderService.getAllOrders();
		return orders;
	}
	
	@GetMapping("{id}")
	Order getOrderById(@PathVariable("id") Long id) {
		Order order = orderService.getOrderById(id);
		return order;
	}
	
	@GetMapping("query")
    public List<Order> getOrderByUser(@RequestParam(name = "userid") Long userId) {
        // Llama al servicio para obtener todas las órdenes del usuario con el ID proporcionado
        User user = new User();  // Crea un objeto User con el ID proporcionado
        user.setId(userId);

        List<Order> orders = orderService.getAllOrdersOfUser(user);
        return orders;
    }
	
	@PostMapping
	Order setOrder(@RequestBody Order order) {
		Order newOrder = orderService.createOrder(order);
		return newOrder;
	}
	
	@PutMapping("{id}")
	Order updateOrder(@RequestBody Order order ,@PathVariable("id") Long id) {
		return orderService.updateOrder(order, id);
	}
	
	@DeleteMapping("{id}")
	String deleteOrder(@PathVariable("id") Long id) {
		orderService.deleteOrder(id);
		return "Se elimino el usuario id :" + id;
	}
	
}
