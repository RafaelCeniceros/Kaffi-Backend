package com.kaffi.ecommerce.entity;
import jakarta.persistence.*;
import lombok.*;
import java.sql.Timestamp;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="comentarios")
public class Comment {
	@Id // Indica que el atributo será la clave primaria de la entidad
	// Indica como se generarán automáticamente las claves primarias
	@GeneratedValue( strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="fecha",nullable=false)
	private Timestamp date;
	
	@Column(name="comentario",nullable = false,length = 120 )
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="id_usuario", nullable=true)
	private User user;
}
