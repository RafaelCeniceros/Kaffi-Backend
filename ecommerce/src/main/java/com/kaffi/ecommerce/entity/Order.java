package com.kaffi.ecommerce.entity;
import java.math.BigDecimal;
import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="ordenes")
public class Order {
	@Id // Indica que el atributo será la clave primaria de la entidad
	// Indica como se generarán automáticamente las claves primarias
	@GeneratedValue( strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="precio", nullable=false)	
	private BigDecimal price;
	
	@Column(name="description", nullable=false, length=120)
	private String description;
	
	@Column(name="img_url", nullable=false, length=120)	
	private String image;
	
	@Column(name="id_category", nullable=false)
	private Long id_category;
	
}
