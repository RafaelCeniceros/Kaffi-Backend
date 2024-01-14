package com.kaffi.ecommerce.entity;

import lombok.*;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class OrderHasProductPK implements Serializable {

    private static final long serialVersionUID = 1L; // Puedes elegir cualquier valor que desees

    private Long order; // El nombre debe coincidir con el campo en la clase OrderhasProduct

    private Long product; // El nombre debe coincidir con el campo en la clase OrderhasProduct
}