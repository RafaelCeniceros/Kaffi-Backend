package com.kaffi.ecommerce.entity;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="categorias")
public class Category {
	
	@Id // Indica que el atributo será la clave primaria de la entidad
	// Indica como se generarán automáticamente las claves primarias
	@GeneratedValue( strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(name="nombre", nullable=false, length=25)
	private String name;
	@Column(name="descripcion", nullable=false, length=45)	
	private String description;
	
}
