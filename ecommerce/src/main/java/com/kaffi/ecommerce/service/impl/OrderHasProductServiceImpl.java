package com.kaffi.ecommerce.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.OrderHasProduct;
import com.kaffi.ecommerce.entity.OrderHasProductPK;
import com.kaffi.ecommerce.repository.OrderHasProductRepository;
import com.kaffi.ecommerce.service.OrderHasProductService;



@Service
public class OrderHasProductServiceImpl implements OrderHasProductService {

	@Autowired
	OrderHasProductRepository orderHasProductRepository;

	@Override
	public OrderHasProduct getOrderHasProductById(OrderHasProductPK id) {
		Optional<OrderHasProduct> orderHasProductOptional = orderHasProductRepository.findById(id);
		if(orderHasProductOptional.isPresent()) return orderHasProductOptional.get();
		else throw new IllegalStateException("OrderHasProduct id ( "+ id + " ) doesnt exist");
	}

	@Override
	public OrderHasProduct createOrderHasProduct(OrderHasProduct orderHasProduct) {
		OrderHasProduct newOrderHasProduct = orderHasProductRepository.save(orderHasProduct);
		return newOrderHasProduct;
	}

	@Override
	public List<OrderHasProduct> getAllOrdersHasProducts() {
		List<OrderHasProduct> ordersHasProducts = (List<OrderHasProduct>)orderHasProductRepository.findAll();
		return ordersHasProducts;
	}

	@Override
	public OrderHasProduct updateOrderHasProduct(OrderHasProduct orderHasProduct, OrderHasProductPK id) {
		OrderHasProduct existingOrderHasProduct = getOrderHasProductById(id);
		existingOrderHasProduct.setQuantity(orderHasProduct.getQuantity());
		existingOrderHasProduct.setTotalPrice(orderHasProduct.getTotalPrice());
		existingOrderHasProduct.setUnitaryPrice(orderHasProduct.getUnitaryPrice());
		return orderHasProductRepository.save(existingOrderHasProduct);
	}

	@Override
	public void deleteOrderHasProduct(OrderHasProductPK id) {
		OrderHasProduct existingOrderHasProduct = getOrderHasProductById(id);
		orderHasProductRepository.delete(existingOrderHasProduct);
		
	}

	@Override
	public List<OrderHasProduct> getAllOrdersHasProductsOfOrder(Order order) {
		Iterable<OrderHasProduct> orderHasProductIterable = orderHasProductRepository.findAllByOrder(order);
        // Convierte el Iterable a una lista
        List<OrderHasProduct> ordersHasProducts = new ArrayList<>();
        orderHasProductIterable.forEach(ordersHasProducts::add);
        return ordersHasProducts;
	}
	
}
