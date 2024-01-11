-- Inserts tipos_usuarios Kaffi

SELECT * FROM tipos_usuarios;

INSERT INTO tipos_usuarios (nombre_tipo, descripcion)
	VALUES ('Administrador', 'Administrador de página Kaffi-Ecommerce');
INSERT INTO tipos_usuarios (nombre_tipo, descripcion)
	VALUES ('Cliente', 'Usuario con cuenta creada en Kaffi-Ecommerce');
