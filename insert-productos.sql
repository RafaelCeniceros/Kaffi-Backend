-- Insets productos

select * from productos;

-- Café Americano
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Café Americano', 50, 'Café espresso mezclado con agua caliente', '../images/imagenes-menu/Cafes/cafe_americano.png', 1);
-- Espresso
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Espresso', 25, 'Un tiro de café concentrado', '../images/imagenes-menu/Cafes/cafe_espresso.jpg', 1);
-- Doble
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Doble', 30, 'Doble tiro de café espresso', '../images/imagenes-menu/Cafes/Doble.png', 1);
-- Café latte
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Café latte', 50, 'Café espresso con una generosa cantidad de leche vaporizada', '../images/imagenes-menu/Cafes/Cafe-latte.png', 1);
-- Capuccino
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Capuccino', 50, 'Mezcla equilibrada de café espresso, leche vaporizada y espuma de leche', '../images/imagenes-menu/Cafes/Capuccino.png', 1);
-- Café de olla
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Café de olla', 39, 'Café infusionado con especias y piloncillo', '../images/imagenes-menu/Cafes/Cafe-olla.png', 1);
-- Mocha
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Mocha', 55, 'Café espresso con jarabe de chocolate y leche vaporizada', '../images/imagenes-menu/Cafes/Mocha.png', 1);
-- Mocha blanco
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Mocha blanco', 55, 'Café espresso con jarabe de vainilla, chocolate blanco y leche vaporizada', '../images/imagenes-menu/Cafes/Mocha-blanco.png', 1);
-- Nutellate
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Nutellate', 55, 'Café con leche infusionado con deliciosa crema de avellanas Nutella', '../images/imagenes-menu/Cafes/Nutellate.png', 1);
-- Dirty chai
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Dirty chai', 60, 'Chai latte con un toque de espresso', '../images/imagenes-menu/Cafes/Dirty-chai.png', 1);
-- Affogato
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Affogato', 40, 'Bola de helado cubierta con un shot caliente de espresso', '../images/imagenes-menu/Cafes/cafe_affogato.jpg', 1);

-- Matcha latte
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Matcha latte', 50, 'Bebida sabor Matcha', '../images/imagenes-menu/Bebidas/matcha_latte.png', 2);
-- Chai latte
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chai latte', 55, 'Bebida sabor chai', '../images/imagenes-menu/Bebidas/chai-latte.png', 2);
-- Chocolate
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chocolate', 45, 'Bebida sabor chocolate', '../images/imagenes-menu/Bebidas/bebidas_chocolate.jpg', 2);
-- Smoothie (mango/fresa)
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Smoothie (mango/fresa)', 55, 'Bebida sabor mango o fresa', '../images/imagenes-menu/Bebidas/bebidas_smoothiemango.jpg', 2);
-- Licuado de frutos rojos
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Licuado de frutos rojos', 58, 'Bebida sabor frutos rojos, fresa, frambuesa y arándano', '../images/imagenes-menu/Bebidas/bebidas_licuado.jpg', 2);
-- Curacao azul
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Curacao azul', 45, 'Bebida con alcohol de cáscaras de naranja amarga con jarabe de azúcar refinada', '../images/imagenes-menu/Bebidas/bebidas_curacaoazul.jpg', 2);
-- Soda italiana
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Soda italiana', 45, 'Bebida con agua gasificada y jarabe de fruta natural', '../images/imagenes-menu/Bebidas/Soda-italiana.png', 2);
-- Tisanas
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Tisanas', 45, 'Bebida sabor frutas deshidratadas', '../images/imagenes-menu/Bebidas/bebidas_tisana.jpg', 2);

-- Café
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Café', 65, 'Frappe con sabor a café', '../images/imagenes-menu/Frappes/Cafe.png', 3);
-- Oreo
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Oreo', 65, 'Frappe hecho con un rico sabor a chocolate, un toque de café y trozos de galleta oreo', '../images/imagenes-menu/Frappes/frappes_oreo.jpg', 3);
-- Mocha
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Mocha', 65, 'Frappe con sabor a chocolate y café', '../images/imagenes-menu/Frappes/frappes_mocha.jpg', 3);
-- Mocha blanco
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Mocha blanco', 65, 'Frappe con sabor a chocolate blanco y café', '../images/imagenes-menu/Frappes/frappes_mochablanco.jpg', 3);
-- Chai cream
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chai cream', 65, 'Frappe con sabor a chai y crema', '../images/imagenes-menu/Frappes/Chai-cream.png', 3);
-- Irlandés
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Irlandés', 65, 'Frappe con un toque irlandés y café', '../images/imagenes-menu/Frappes/Irlandes.png', 3);
-- Nuez
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Nuez', 65, 'Frappe con sabor a nuez', '../images/imagenes-menu/Frappes/frappes_nuez.jpg', 3);
-- Caramelo
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Caramelo', 65, 'Frappe con sabor a caramelo', '../images/imagenes-menu/Frappes/frappes_caramelo.jpg', 3);
-- Kinder bueno
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Kinder bueno', 70, 'Frappe con sabor a Kinder Bueno', '../images/imagenes-menu/Frappes/frappes_kinderbueno.jpg', 3);
-- Nutella
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Nutella', 70, 'Frappe con sabor a Nutella', '../images/imagenes-menu/Frappes/Nutella.png', 3);
-- Chocoberry
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chocoberry', 65, 'Frappe con sabor a chocolate y bayas', '../images/imagenes-menu/Frappes/frappes_chocoberry.jpg', 3);
-- Fresas con crema
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Fresas con crema', 70, 'Frappe con sabor a fresas y crema', '../images/imagenes-menu/Frappes/Fresas-con-crema.png', 3);
-- Chocomenta
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chocomenta', 70, 'Frappe con sabor a chocolate y menta', '../images/imagenes-menu/Frappes/frappes_chocomenta.jpg', 3);
-- Green matcha
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Green matcha', 65, 'Frappe con sabor a matcha verde', '../images/imagenes-menu/Frappes/Green.matcha.png', 3);

-- Sea Salt Caramel
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Sea Salt Caramel', 60, 'Delicioso dulce de caramelo con chocolate con un toque de sal', '../images/imagenes-menu/Especialidades/Sea-salt-caramel.png', 4);
-- Dark horchata ice
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Dark horchata ice', 55, 'Horchata con trozos de canela y un toque de café', '../images/imagenes-menu/Especialidades/Dark-horchata-ice.png', 4);
-- Tonicoffee
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Tonicoffee', 55, 'Una capa de café y agua con una temperatura fría', '../images/imagenes-menu/Especialidades/tonicoffee.png', 4);
-- Chocolate bomb
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Chocolate bomb', 65, 'Bomba de chocolate con explosión de sabor', '../images/imagenes-menu/Especialidades/Chocolate-bomb.png', 4);
-- Vainilla Macchiato
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Vainilla Macchiato', 60, 'Café con leche y un toque de vainilla', '../images/imagenes-menu/Especialidades/Vainilla-macchiato.png', 4);
-- Cinnamon Latte
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Cinnamon Latte', 60, 'Café con leche y canela para un toque especiado', '../images/imagenes-menu/Especialidades/Cinnamon-latte.png', 4);

-- Bagel clásico
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Bagel clásico', 65, 'Bagel tostado con jamón, queso, lechuga, tomate y aderezada con mayonesa', '../images/imagenes-menu/Bagels/clasico.jpg', 5);
-- Bagel serrano
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Bagel serrano', 80, 'Bagel tostado de parmesano con jamón serrano, queso manchego, tomate cherry, arúgula y aceite balsámico', '../images/imagenes-menu/Bagels/serrano.png', 5);
-- Bagel dulce/salado
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Bagel dulce/salado', 40, 'Bagel tostado con queso crema y mermelada de fresa', '../images/imagenes-menu/Bagels/dulce-salado.png', 5);
-- Bagel pizza
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Bagel pizza', 65, 'Bagel tostado con salsa de tomate, peperoni, salami, queso mozzarella y orégano', '../images/imagenes-menu/Bagels/pizza.png', 5);

-- Panini italiano
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Panini italiano', 70, 'Pan artesanal con salami, queso, lechuga, tomate, aderezo, con mayonesa y aceite balsámico', '../images/imagenes-menu/Paninis/panini_italiano.jpg', 6);
-- Pizanini
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Pizanini', 70, 'Pan artesanal con salsa de tomate, peperoni, salami, queso mozzarella y una pisca de orégano', '../images/imagenes-menu/Paninis/paninis_pizzanini.jpg', 6);
-- Panini vegetariano
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Panini vegetariano', 70, 'Pan artesanal con lechuga, espinaca, tomate, champiñones, y aderezado con mayonesa de aguacate', '../images/imagenes-menu/Paninis/panini_vegetariano.jpg', 6);

-- Cuernito clásico
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Cuernito clásico', 65, 'Croissant hojaldrado con jamón, queso, alfalfa, aderezado con mayonesa', '../images/imagenes-menu/Cuernitos/cuernitos_clasico.jpg', 7);
-- Cuernito italiano
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Cuernito italiano', 65, 'Croissant hojaldrado con jamón, queso, lechuga, tomate y aderezado con mayonesa', '../images/imagenes-menu/Cuernitos/cuernito_italiano.jpg', 7);

-- Waffle tradicional
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Waffle tradicional', 80, 'Waffle con nuez, chocolate líquido y crema batida', '../images/imagenes-menu/Waffles/waffle-tradicional.png', 8);
-- Waffle con helado o fresas
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Waffle con helado o fresas', 90, 'Waffle con nuez, chocolate líquido, helado de vainilla o fresas', '../images/imagenes-menu/Waffles/waffle-con-helado-o-fresas.png', 8);

-- Brownie
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Brownie', 20, 'Bizcocho de chocolate pequeño con nueces', '../images/imagenes-menu/Panes/panes_brownie.jpg', 9);
-- Rol de canela
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Rol de canela', 45, 'Delicioso rollo de masa con canela y glaseado', '../images/imagenes-menu/Panes/pan_rolcanela.jpg', 9);
-- Pan de zanahoria
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Pan de zanahoria', 45, 'Pan esponjoso con zanahoria rallada y nueces', '../images/imagenes-menu/Panes/pan_zanahoria.jpg', 9);
-- Pan de elote
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Pan de elote', 45, 'Pan suave y esponjoso con granos de elote', '../images/imagenes-menu/Panes/pan_elote.jpg', 9);
-- Galleta de chispas
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Galleta de chispas', 40, 'Galleta crujiente con deliciosas chispas de chocolate', '../images/imagenes-menu/Panes/galleta-de-chispas.png', 9);
-- Galleta de M&M's
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ("Galleta de M&M's", 40, "Galleta con coloridas y sabrosas M&M's", "../images/imagenes-menu/Panes/galletas-m&m's.png", 9);
-- Croissant
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Croissant', 37, 'Clásico croissant hojaldrado y delicioso', '../images/imagenes-menu/Panes/croissants.png', 9);
-- Brownie con helado
INSERT INTO productos (nombre, precio, descripcion, img_url, id_categoria)
VALUES ('Brownie con helado', 55, 'Brownie acompañado de una bola de helado', '../images/imagenes-menu/Panes/brownie-con-helado.png', 9);