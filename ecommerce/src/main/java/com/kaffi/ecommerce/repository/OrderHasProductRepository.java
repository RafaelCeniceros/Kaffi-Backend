package com.kaffi.ecommerce.repository;

import org.springframework.data.repository.CrudRepository;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.OrderHasProduct;
import com.kaffi.ecommerce.entity.OrderHasProductPK;


public interface OrderHasProductRepository extends CrudRepository<OrderHasProduct,OrderHasProductPK>{

	Iterable<OrderHasProduct> findAllByOrder(Order order);

}