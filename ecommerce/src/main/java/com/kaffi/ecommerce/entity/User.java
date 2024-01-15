package com.kaffi.ecommerce.entity;


import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Entity
@Table(name="usuarios")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="activo")
	private boolean active;
	@Column(name="nombre",nullable = false,length = 25)
	private String firstName;
	@Column(name="apellidos",nullable = false,length = 25)
	private String lastName;
	@Column(name="email",nullable = false,length = 30,unique = true)
	private String email;
	@Column(name="password",nullable = false,length = 45 )
	private String password;
	@Column(name="direccion",length = 45 )
	private String address;
	
	@ManyToOne
	@JoinColumn(name="id_tipo_usuario", nullable=false)
	private UserType userType;

}
