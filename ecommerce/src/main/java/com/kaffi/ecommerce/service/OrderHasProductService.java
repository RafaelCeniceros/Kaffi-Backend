package com.kaffi.ecommerce.service;

import java.util.List;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.OrderHasProduct;
import com.kaffi.ecommerce.entity.OrderHasProductPK;

public interface OrderHasProductService {

	OrderHasProduct getOrderHasProductById(OrderHasProductPK id);
	OrderHasProduct createOrderHasProduct(OrderHasProduct orderHasProduct);
	List<OrderHasProduct> getAllOrdersHasProducts();
	OrderHasProduct updateOrderHasProduct(OrderHasProduct orderHasProduct, OrderHasProductPK id);
	void deleteOrderHasProduct(OrderHasProductPK id);
	List<OrderHasProduct> getAllOrdersHasProductsOfOrder(Order order);
	
}
