package com.kaffi.ecommerce.entity;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="tipos_usuarios")
public class UserType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUserType;
	@Column(name="nombre_tipo",nullable = false,length = 25)
	private String typeName;
	@Column(name="descripcion",nullable = false,length = 45)
	private String description;

}
