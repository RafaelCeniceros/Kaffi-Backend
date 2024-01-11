package com.kaffi.ecommerce.entity;
import java.math.BigDecimal;
import jakarta.persistence.*;
import lombok.*;


@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="ordenes_has_productos")
public class OrderhasProduct {

	@Column(name="id_orden", nullable=false)
	private Long orderId;
	
	@Column(name="id_producto", nullable=false)
	private Long productId;
	
	@Column(name="cantidad", nullable=false)
	private int quantity;
	
	@Column(name="precio_unitario", nullable=false)
	private BigDecimal unitaryPrice;
	
	@Column(name="total", nullable=false)
	private BigDecimal totalPrice;
}
