package com.kaffi.ecommerce.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.OrderHasProduct;
import com.kaffi.ecommerce.entity.OrderHasProductPK;
import com.kaffi.ecommerce.service.OrderHasProductService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/v1/ordersHasProducts")
public class OrderHasProductController {

	@Autowired
	OrderHasProductService orderHasProductService;
	
	@GetMapping
	List<OrderHasProduct> getAllOrdersHasProducts(){
		List<OrderHasProduct> ordersHasProducts = orderHasProductService.getAllOrdersHasProducts();
		return ordersHasProducts;
	}
	
	//http://localhost:8080/api/v1/ordersHasProducts/1-2
	@GetMapping("{orderId}-{productId}")
	OrderHasProduct getOrderHasProductById(@PathVariable("orderId") Long orderId, @PathVariable("productId") Long productId) {
	    log.info("Se solicita los datos de la orderHasProduct orderId:" + orderId + ", productId:" + productId);

	    // Crear una instancia de OrderHasProductPK con los valores proporcionados en la URL
	    OrderHasProductPK id = new OrderHasProductPK(orderId, productId);

	    OrderHasProduct orderHasProduct = orderHasProductService.getOrderHasProductById(id);
	    return orderHasProduct;
	}
	
	@GetMapping("query")
    public List<OrderHasProduct> getOrderHasProductByUser(@RequestParam(name = "orderid") Long orderId) {
		log.info("Se solicita las ordenesHasProducts del order id:" + orderId);
		
        // Llama al servicio para obtener todas las órdenesHasProducts de la orden con el ID proporcionado
        Order order = new Order();  // Crea un objeto orden con el ID proporcionado
        order.setId(orderId);

        List<OrderHasProduct> ordersHasProducts = orderHasProductService.getAllOrdersHasProductsOfOrder(order);
        return ordersHasProducts;
    }
	
	@PostMapping
	OrderHasProduct setOrderHasProduct(@RequestBody OrderHasProduct orderHasProduct) {
		log.info("Se está creando una nueva ordenHasProduct");
		log.info(orderHasProduct);
		OrderHasProduct newOrderHasProduct = orderHasProductService.createOrderHasProduct(orderHasProduct);
		return newOrderHasProduct;
	}
	
	@PutMapping("{orderId}-{productId}")
	OrderHasProduct updateOrderHasProduct(@RequestBody OrderHasProduct orderHasProduct ,@PathVariable("orderId") Long orderId, @PathVariable("productId") Long productId) {
		log.info("Se actualizan los datos de la orderHasProduct orderId:" + orderId + ", productId:" + productId);

	    // Crear una instancia de OrderHasProductPK con los valores proporcionados en la URL
	    OrderHasProductPK id = new OrderHasProductPK(orderId, productId);
		return orderHasProductService.updateOrderHasProduct(orderHasProduct, id);
	}
	
	@DeleteMapping("{orderId}-{productId}")
	String deleteOrderHasProduct(@PathVariable("orderId") Long orderId, @PathVariable("productId") Long productId) {
		
		// Crear una instancia de OrderHasProductPK con los valores proporcionados en la URL
	    OrderHasProductPK id = new OrderHasProductPK(orderId, productId);
		orderHasProductService.deleteOrderHasProduct(id);
			return "Se elimino la ordenHasProduct id : orderId:" + orderId + ", productId:" + productId;
	}
	
}
