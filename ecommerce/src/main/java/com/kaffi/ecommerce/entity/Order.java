package com.kaffi.ecommerce.entity;
import java.math.BigDecimal;
import jakarta.persistence.*;
import lombok.*;
import java.sql.Timestamp;


@AllArgsConstructor
@NoArgsConstructor
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
	
	@Column(name="monto_total", nullable=true)	
	private BigDecimal price;
	
	@Column(name="fecha_orden",nullable=false)
	private Timestamp date;
	
	@ManyToOne
	@JoinColumn(name="id_usuario", nullable=false)
	private User user;
}
