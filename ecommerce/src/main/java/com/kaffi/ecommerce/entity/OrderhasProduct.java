package com.kaffi.ecommerce.entity;

import java.math.BigDecimal;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name = "ordenes_has_productos")
@IdClass(OrderhasProductPK.class)
public class OrderhasProduct {

    @Id
    @ManyToOne
    @JoinColumn(name = "id_orden", nullable = false)
    private Order order;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_producto", nullable = false)
    private Product product;

    @Column(name = "cantidad", nullable = false)
    private int quantity;

    @Column(name = "precio_unitario", nullable = false)
    private BigDecimal unitaryPrice;

    @Column(name = "total", nullable = false)
    private BigDecimal totalPrice;
}