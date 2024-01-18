package com.kaffi.ecommerce.entity;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="productos")
public class Product {
	@Id // Indica que el atributo será la clave primaria de la entidad
	// Indica como se generarán automáticamente las claves primarias
	@GeneratedValue( strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="nombre", nullable=false, length=45)
	private String name;
	
	@Column(name="precio", nullable=false)	
	private BigDecimal price;
	
	@Column(name="descripcion", nullable=false, length=120)
	private String description;
	
	@Column(name="img_url", nullable=false, length=120)	
	private String image;
	
	@Column(name="activo")
	private boolean active;

	@ManyToOne
	@JoinColumn(name="id_categoria", nullable=false)
	@JsonIgnoreProperties({"name","description"})
	private Category category;
}

