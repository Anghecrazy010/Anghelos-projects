create database Universal_gamer_planet1;
Use Universal_gamer_planet1;

create table Estado(
Id_Estado int auto_increment not null,
Nombre_Estado varchar(20) not null,
primary key(Id_Estado)
);

create table Municipio(
Id_Municipio int auto_increment not null,
Nombre_Municipio varchar(30) not null,
Id_Estado int not null,
foreign key (Id_Estado) references Estado(Id_Estado) on delete cascade,
primary key(Id_Municipio)
);

create table Telefono(
Id_Telefono int auto_increment not null,
Pais varchar(30)not null,
Lada smallint(2),
Numero_Telefono varchar(10),
primary key (Id_Telefono)
);

create table Empresa(
Id_Cif int auto_increment not null,
Id_Telefono int not null,
Nombre varchar(15) not null,
Direccion varchar(30) not null,
Ciudad varchar(30) not null,
primary key(Id_Cif)
);
Alter table Empresa add foreign key (Id_Telefono) references Telefono (Id_Telefono);
Alter Table Empresa modify Nombre varchar(40) not null;
Alter table Empresa modify Id_Cif int not null;

create table Direccion(
Id_Direccion mediumint auto_increment not null,
Direccion varchar(30) not null,
Codigo_Postal int(10) not null,
Id_Municipio int not null,
Estado varchar(30)not null,
primary key(Id_Direccion)
);
Alter table Direccion add foreign key(Id_Municipio) references Municipio (Id_Municipio);
Alter table Direccion modify Direccion varchar(60) not null;

create table Sucursales(
Id_Sucursal tinyint auto_increment not null,
Nombre varchar(50) not null,
Id_Estado int not null,
Id_Municipio int not null,
Notas varchar(40) null,
Id_Empresa int not null,
Id_Telefono int not null,
Id_Direccion mediumint not null,
primary key(Id_Sucursal)
);
Alter table Sucursales add foreign key (Id_Municipio) references Municipio (Id_Municipio);
Alter table Sucursales add foreign key (Id_Estado) references Estado (Id_Estado);
Alter table Sucursales add foreign key (Id_Empresa) references Empresa (Id_Cif);
Alter table Sucursales add foreign key (Id_Telefono) references Telefono (Id_Telefono);
Alter table Sucursales add column Id_Direccion mediumint not null;
Alter table Sucursales add foreign key (Id_Direccion) references Direccion (Id_Direccion);

create table Suscripcion(
Id_Cliente int auto_increment not null,
Subcripcion_A varchar(25)null,
Descripcion_Sub varchar(100) not null,
primary key(Id_Cliente)
);
alter table Suscripcion modify column Descripcion_Sub varchar(300) not null;

create table Direccion(
Id_Direccion mediumint auto_increment not null,
Direccion varchar(30) not null,
Codigo_Postal int(10) not null,
Id_Municipio int not null,
Estado varchar(30)not null,
primary key(Id_Direccion)
);
Alter table Direccion add foreign key(Id_Municipio) references Municipio (Id_Municipio);
Alter table Direccion modify Direccion varchar(60) not null;

create table Clientes(
Id_cliente int auto_increment not null,
Nombre varchar(25) not null,
Apellido_P varchar(25) not null,
Apellido_M varchar(25) not null,
Corre_electronico varchar(60) not null,
Id_Direccion mediumint not null,
Id_Sucursal tinyint not null,
Id_Telefono int not null,
primary key(Id_cliente)
);
Alter table Clientes add foreign key (Id_Direccion) references Direccion(Id_Direccion);
Alter table Clientes add foreign key (Id_Sucursal) references Sucursales(Id_Sucursal);
Alter table Clientes add foreign key (Id_Telefono) references Telefono (Id_Telefono);
Alter table Clientes modify column Corre_electronico varchar(60)null;
create table Empleados(
Id_Trabajador int auto_increment not null,
Nombre varchar(25) not null,
Apellido_P varchar(25) not null,
Apellido_M varchar(25) not null,
Estatus tinyint(1),
Sexo char(1) not null,
Edad int (3) not null,
Usuario varchar(30) not null,
Contraseña varchar(30) not null,
Id_Sucursal tinyint not null,
Correo_electronico varchar(60) not null,
Id_Direccion mediumint not null,
Id_Telefono int not null,
primary key(Id_Trabajador)
);
Alter table Empleados add foreign key (Id_Sucursal) references Sucursales (Id_Sucursal);
Alter table Empleados add foreign key (Id_Direccion) references Direccion (Id_Direccion);
Alter table Empleados add foreign key (Id_Telefono) references Telefono (Id_Telefono);
Alter table Empleados modify column Correo_electronico varchar(60)null;
create table Proveedor(
Name_Proveedor varchar(30)not null,
Telefono_P varchar(20)not null,
primary key(Name_Proveedor)
);

create table Productos(
Id_producto int auto_increment not null,
Desc_producto varchar(100) not null,
Precio Decimal(9,2) not null,
Cantidad int not null,
proveedor varchar(30) not null,
primary key(Id_producto)
);
Alter table Productos add foreign key (Proveedor) references Proveedor (Name_Proveedor);
Alter table Productos modify Desc_producto varchar(300) not null;


create table Videojuegos(
Nombre_Videojuego varchar(60) not null,
Tipo_Videojuego varchar(25)null,
Genero_Videojuego varchar(30)null,
Rating_Videojuego varchar(30)null,
Version_Videojuego varchar(25)null,
Consola varchar(25)null,
Id_producto int not null
);
Alter table Videojuegos add foreign key (Id_Producto) references Productos (Id_Producto);
Alter Table Videojuegos add column Nombre_Videojuego varchar(60) not null;
Alter Table Videojuegos modify Rating_Videojuego varchar(100) not null;
Alter Table Videojuegos modify column Genero_Videojuego varchar(100) null;

Create table Consolas(
Nombre_Consola varchar(30) not null,
Id_Producto int not null
);
Alter table Consolas add foreign key(Id_Producto) references Productos (Id_Producto);

create table Facturas(
Folio_fact int auto_increment not null,
Fecha datetime,
Subtotal Decimal(9,2),
Iva Decimal(6,2),
Total Decimal(9,2),
primary key(Folio_fact)
);

create table Detalle_factura(
Folio_fact int not null,
Id_producto int not null,
Total_movt Decimal(9,2),
Iva_movt Decimal(6,2)
);
Alter table Detalle_factura add foreign key(Folio_fact) references Facturas (Folio_fact);
Alter table Detalle_factura add foreign key(Id_producto) references Productos (Id_producto);

create table Inventario(
Id_Inventario int auto_increment not null,
Id_Sucursal  tinyint not null,
Id_Producto int not null,
Cantidad int not null,
primary key(Id_inventario)
);
Alter table Inventario add foreign key(Id_Producto) references Productos (Id_Producto);
alter table Inventario modify Id_Sucursal  tinyint not null;
Alter table Inventario add foreign key(Id_Sucursal) references Sucursales (Id_Sucursal);
Alter table Inventario modify column Notas varchar(300) not null;

create table Ventas(
Id_Venta int auto_increment not null,
Venta_date datetime,
Id_Inventario int not null,
Id_Cliente int not null,
Id_Trabajador int not null,
primary key(Id_Venta)
);

Alter table Ventas add foreign key(Id_Inventario) references Inventario(Id_Inventario);
Alter table Ventas add foreign key(Id_Cliente) references Clientes(Id_Cliente);
Alter table Ventas add foreign key(Id_Trabajador) references Empleados(Id_Trabajador);
alter table Ventas modify column Notas varchar(350)not null;
/*Insertaremos la informacion de cada tabla para poder realizar distintas pruebas*/ 
Insert into Estado(Id_Estado,Nombre_Estado)
values('1','Sinaloa');

Insert into Estado(Id_Estado,Nombre_Estado)
values('2','Aguascalientes');

Insert into Estado(Id_Estado,Nombre_Estado)
values('3','Baja California');

Insert into Estado(Id_Estado,Nombre_Estado)
values('4','Baja California Sur');

Insert into Estado(Id_Estado,Nombre_Estado)
values('5','Campeche');

Insert into Estado(Id_Estado,Nombre_Estado)
values('6','Coahuila de Zaragoza');

Insert into Estado(Id_Estado,Nombre_Estado)
values('7','Colima');

Insert into Estado(Id_Estado,Nombre_Estado)
values('8','Nuevo Leon');

Insert into Estado(Id_Estado,Nombre_Estado)
values('9','Jalisco');

Insert into Estado(Id_Estado,Nombre_Estado)
values('10','México');

Insert into Estado(Id_Estado,Nombre_Estado)
values('11','Sonora');

/*Tabla Municipio*/ 

Insert into Municipio(Id_Municipio,Nombre_Municipio,Id_Estado)
values('1','Mazatlán','1');

Insert into Municipio(Id_Municipio,Nombre_Municipio,Id_Estado)
values('2','Culiacan','1');

Insert into Municipio(Id_Municipio,Nombre_Municipio,Id_Estado)
values('3','Concordia','1');

Insert into Municipio(Id_Municipio,Nombre_Municipio,Id_Estado)
values('4','Guadalajara','8');

/*Tabla Telefono*/ 
Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('1','Mexico','52',6691238050);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('2','Mexico','52',6691339055);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('3','Mexico','52',6692168299);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('4','Mexico','52',6699451752);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('5','Mexico','52',6691724555);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('6','Mexico','52',6691286507);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('7','Mexico','52',6692339143);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('8','Mexico','52',6691443355);

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('9','Mexico','52','6699336654');

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('10','Mexico','52','6692493714');

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('11','Mexico','52','6692651528');

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('12','Mexico','52','6691244751');

Insert into Telefono(Id_Telefono,Pais,Lada,Numero_Telefono)
values('13','Mexico','52','6692551993');


Select*from Telefono;
/*Tabla Empresa*/ 
Insert into Empresa(Id_Cif,Id_Telefono,Nombre,Direccion,Ciudad)
values('1','1','Universal gamer planet industries','Av.la Marina #2302 Int. 46','Mazatlan');

/*Tabla Direccion*/ 
insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(1,'Avenida Camaron Sabalo S/N','82110','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(2,'Avenida de la Marina 6204, Marina,','82103','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(3,'Avenida Libramiento. Núm. 2 Pte. s/n, El Venadillo','82129','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(4,'21 de Marzo, Centro','82000','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(5,'San Joaquin calle Jesus Siqueros','82139','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(6,'Villa Verde Calle Jose Clemente Orozco','82139','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(7,'Infonavit Playas Calle Lazaro Cardenas','82128','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(8,'Infonavit Playas Avenida Delfin','82128','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values(9,'Diego Valadés Ríos 1676, Desarrollo Urbano Tres Ríos','80000','2','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values('10','Villa Galaxia Pitagoras 18','82150','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values('11','Villas del rey calle Florencia No:casa 14224','82164','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values('12','San Fernando Avenida del sol','82198','1','1');

insert Into Direccion(Id_Direccion,Direccion,Codigo_Postal,Id_Municipio,Estado)
values('13','Terranova calle Quebec','82124','1','1');

select*from Direccion;

/*Tabla Sucursales*/ 
Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas,Id_Empresa,Id_Telefono,Id_Direccion)
values('1','Universal gamer planet centro','1','1','Esta sucursal esta en funcionamiento','1','2','1');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas,Id_Empresa,Id_Telefono,Id_Direccion)
values('2','Universal gamer planet plaza Galerias','1','1','Esta sucursal esta en funcionamiento','1','3','2');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas,Id_Empresa,Id_Telefono,Id_Direccion)
values('3','Universal gamer planet Zona Dorada','1','1','Esta sucursal esta en funcionamiento','1','4','3');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas,Id_Empresa,Id_Telefono,Id_Direccion)
values('4','Universal gamer planet Acaya','1','1','Esta sucursal esta en funcionamiento','1','5','4');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas,Id_Empresa,Id_Telefono,Id_Direccion)
values('5','Universal gamer planet Forum Culiacan','1','2','Esta sucursal abrira proximamente','1','6','9');


select*from Sucursales;
/*Completar porque estan incompletas*/ 


/*Tabla Suscripcion*/ 
Insert Into Suscripcion(Id_Cliente,Subcripcion_A,Descripcion_Sub)
values('6','Al paquete xbox',' Suscripcion de un Mes al paquete Xbox Con el costo de 200 el cual sera aplicado en la factura del id_del cliente En este paquete se le regalara una tarjeta de regalo de xbox con el valor de 200 en la tienda digital');

Insert Into Suscripcion(Id_Cliente,Subcripcion_A,Descripcion_Sub)
values('4','Al paquete Playstation','Suscripcion de un Mes al paquete Playstation de 150 el cual sera aplicadoo en la factura del id_del cliente En este paquete se le regalara un mes de playstation plus de manera digital con una tarjeta de regalo con el valor de un mes de playstaion plus');


select*from Suscripcion;


/*Tabla Clientes*/ 
Insert Into Clientes(Id_Cliente,Nombre,Apellido_P,Apellido_M,Corre_electronico,Id_Direccion,Id_Sucursal,Id_Telefono)
values('1','Juan Eduardo','Perez','Martinez','JuanEdu08@gmail.com','5','1','5');

Insert Into Clientes(Id_Cliente,Nombre,Apellido_P,Apellido_M,Corre_electronico,Id_Direccion,Id_Sucursal,Id_Telefono)
values('2','Edgar Manuel','Flores','Romero','Manu1827@gmail.com','6','1','6');

Insert Into Clientes(Id_Cliente,Nombre,Apellido_P,Apellido_M,Corre_electronico,Id_Direccion,Id_Sucursal,Id_Telefono)
values('3','Juan Alejandro','Lizarraga','Lizarraga','JuanAlex71@gmail.com','10','1','9');

select*from Clientes;

/*Tabla Empleados*/ 
insert Into Empleados(Id_Trabajador,Nombre,Apellido_P,Apellido_M,Estatus,Sexo,Edad,Usuario,Contraseña,Id_Sucursal,Correo_electronico,Id_Direccion,Id_Telefono)
values('1','Peter','Parker','Watson','1','M','22','PParkerW02','PPW02109','1','PetePWatson10@gmail.com','7','7');

insert Into Empleados(Id_Trabajador,Nombre,Apellido_P,Apellido_M,Estatus,Sexo,Edad,Usuario,Contraseña,Id_Sucursal,Correo_electronico,Id_Direccion,Id_Telefono)
values('2','Franco Eduardo','Smith',' johnson','1','M','20','FESmithJ10','01010123','1','FrankPSmith23@gmail.com','8','8');

select*from Empleados;

/*Tabla Proveedor*/ 
insert into Proveedor(Name_Proveedor,Telefono_P)
values('Microsoft','(800) 8925234');

insert into Proveedor(Name_Proveedor,Telefono_P)
values('Sony','1800345-SONY7669');

insert into Proveedor(Name_Proveedor,Telefono_P)
values('Nintendo','1-800-255-3700');

select*from Proveedor;

/*Tabla Productos*/ 
insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('1','Xbox One S Blanco con 500 gb de disco duro compatible con la transmision 4k y Blue-ray disk incluye un control inalambrico con dos baterias y el videojuego de futbol Fifa 2020','5000','1','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('2','Playstation 4 Slim Negro con 1000 gb lo que es igual a un 1 Tb de disco duro no ofrece reproducción 4K incluye un control DualShock 4 con su respectivo cargador magnetico y el videojuego exclusivo de Ps4 Horizon Zero Dawn Edicion completa','6500',1,'Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('3','Videojuego exclusivo de Playstation 4 Persona 5 Royal Definitive edition que incluye el juego completo con Dlc ademas de un libro de arte con diseños de los personajes','2000',2,'Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('4','Videojuego exclusivo de Playstation 4 Persona 5 Royal Deluxe edition que incluye el juego completo con Dlc','1800',3,'Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('5','Videojuego exclusivo de Playstation 4 Persona 5 Royal Standard edition que incluye el juego completo pero sin los Dlc o skins exclusivas de los personajes','1300',5,'Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('6','Nintendo Switch Neon 1.1 con un almacenamiento de 32gb expandible con micro usb que incluye dos Joycon color rojo y azul tambien con su respectivo juego Super Smash Bros Ultimate','7500','1','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('7','Videojuego exclusivo de Playstation 4 Nioh 2 Definitive edition que incluye el juego completo con todo el contenido descargable (dlc) y con un libro del arte de los personajes','1900','2','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('8','Videojuego exclusivo de Playstation 4 Nioh 2 Deluxe edition que incluye el juego completo con todo el contenido descargable (dlc)','1500','3','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('9','Videojuego exclusivo de Playstation 4 Nioh 2 Standard edition que incluye el juego completo pero sin el contenido descargable (dlc)','1200','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('10','Videojuego Doom Eternal para Playstation 4 Definitive Edition que incluye el juego completo con todo el contenido descargable un libro del arte de los personajes y una figura del protagonista','2000','2','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('11','Videojuego Doom Eternal para Playstation 4 Deluxe Edition que incluye el juego completo con todo el contenido descargable','1600','3','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('12','Videojuego Doom Eternal para Playstation 4 Standard Edition que incluye el juego completo no incluye el contenido descargable','1250','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('13','Videojuego Doom Eternal para Xbox One Definitive Edition que incluye el juego completo con todo el contenido descargable un libro del arte de los personajes y una figura del protagonista','1900','2','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('14','Videojuego Doom Eternal para Xbox One Deluxe Edition que incluye el juego completo con todo el contenido descargable','1500','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('15','Videojuego Doom Eternal para Xbox One Standard Edition que incluye el juego completo no incluye el contenido descargable','1150','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('16','Videojuego Doom Eternal para Nintendo Switch Definitive Edition(Hell Edition) que incluye el juego completo con todo el contenido descargable un libro del arte de los personajes y una figura amiibo de Isabelle del juego animal crossing','2200','2','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('17','Videojuego Doom Eternal para Nintendo Switch Deluxe Edition que incluye el juego completo con todo el contenido descargable','2000','3','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('18','Videojuego Doom Eternal para Nintendo Switch Standard Edition que incluye el juego completo pero no incluye el contenido descargable(dlc)','1400','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('19','Videojuego Final Fantasy 7 Remake exclusivo para Playstation 4 Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) un libro del arte y un disco con el soundtrack del juego','2200','2','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('20','Videojuego Final Fantasy 7 Remake exclusivo para Playstation 4 Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1900','3','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('21','Videojuego Final Fantasy 7 Remake exclusivo para Playstation 4 Standard Edition que incluye el juego completo pero sin el contenido descargable extra(dlc)','1500','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('22','Videojuego Resident Evil 3 Remake Para Playstation 4 Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) con un libro del arte del juego y una figura de la protagonista del juego','2200','2','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('23','Videojuego Resident Evil 3 Remake Para Playstation 4 Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1800','3','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('24','Videojuego Resident Evil 3 Remake Para Playstation 4 Standard Edition que incluye el juego completo sin contenido extra descargable(dlc)','1400','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('25','Videojuego Resident Evil 3 Remake Para Xbox One Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) con un libro del arte del juego y una figura de la protagonista del juego','2100','2','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('26','Videojuego Resident Evil 3 Remake Para Xbox One Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1650','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('27','Videojuego Resident Evil 3 Remake Para Xbox One Standard Edition que incluye el juego completo No incluye el contenido descargable extra(dlc)','1250','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('28','Videojuego Resident Evil 3 Remake Para Pc(Computadora personal) Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) con un libro del arte del juego y una figura de la protagonista del juego','2000','2','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('29','Videojuego Resident Evil 3 Remake Para Pc(Computadora personal) Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1600','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('30','Videojuego Resident Evil 3 Remake Para Pc(Computadora personal) Standard Edition que incluye el juego completo No incluye contenido descargable extra(dlc)','1100','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('31','Videojuego Predator: Hunting Grounds Para Playstation 4 Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) con un libro del arte del juego y una figura del predator del juego','2000','2','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('32','Videojuego Predator: Hunting Grounds Para Playstation 4 Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1700','3','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('33','Videojuego Predator: Hunting Grounds Para Playstation 4 Standard Edition que incluye el juego completo no incluye el contenido descargable extra(dlc)','1300','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('34','Videojuego Predator: Hunting Grounds Para Pc(Computadora personal) Definitive Edition que incluye el juego completo con todo el contenido descargable(dlc) con un libro del arte del juego y una figura del predator del juego','1800','2','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('35','Videojuego Predator: Hunting Grounds Para Pc(Computadora personal) Deluxe Edition que incluye el juego completo con todo el contenido descargable(dlc)','1500','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('36','Videojuego Predator: Hunting Grounds Para Pc(Computadora personal) Standard Edition que incluye el juego completo no incluye contenido descargable extra(dlc)','1100','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('37','Videojuego Super Smash Bros Ultimate exclusivo para Nintendo Switch Definitive Edition que incluye el juego completo con todos los dlc del pase de temporada y un libro del arte del juego','1700','2','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('38','Videojuego Super Smash Bros Ultimate exclusivo para Nintendo Switch Deluxe Edition que incluye el juego completo con todos los dlc del pase de temporada','1500','3','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('39','Videojuego Super Smash Bros Ultimate exclusivo para Nintendo Switch Standard Edition que incluye el juego completo no incluye los dlc del pase de temporada','1000','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('40','Videojuego Doom Eternal para Pc(Computadora Personal) Definitive Edition que incluye el juego completo con todo el contenido descargable un libro del arte de los personajes y una figura del protagonista','1700','2','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('41','Videojuego Doom Eternal para Pc(Computadora Personal) Deluxe Edition que incluye el juego completo con todo el contenido descargable','1300','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('42','Videojuego Doom Eternal para Pc(Computadora Personal) Standard Edition que incluye el juego completo no incluye el contenido descargable','1000','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('43','Control inalámbrico para Xbox One: Cyberpunk 2077 Edición Limitada','1800','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('44','Control inalámbrico para Xbox One: Gears 5 Kait Diaz Edición Limitada','1800','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('45','Control inalámbrico para Xbox One – Edición especial rojo deportivo','1700','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('46','Control inalámbrico para Xbox One – Edición especial rojo deportivo','1700','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('47','Control inalámbrico para Xbox One Elite: Edición especial blanco Estuche Juego de 4 palancasJuego de 6 joysticks: estándar (2), largos (2) y curvos (2)Juego de 2 pad direccionales: facetados y estándarCable USB Baterías AAA','3200','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('48','Control inalámbrico para Xbox One Elite Negro Estuche Juego de 4 palancas Juego de 6 joysticks: estándar (2), largos (2) y curvos (2) Juego de 2 pad direccionales: facetados y estándarcable USBBaterías AAA','3200','3','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('49','Control inalámbrico para Xbox One: gris y azul','1500','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('50','Control inalámbrico para Xbox One: gris y verde','1500','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('51','Control inalámbrico para Xbox One: negro ','1200','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('52','Control inalámbrico Para Xbox One Blanco ','1300','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('53','Kit Carga y Juega de Xbox One Recarga mientras juegas o después, incluso con la Xbox en modo de espera. La batería recargable de larga duración se carga por completo en menos de 4 horas.	Xbox One X, Xbox One S, Xbox One, Windows 10 ','700','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('54','Auriculares estéreo Para Xbox One Exuberante sonido estéreo y captura de voz con nitidez. Ajuste cómodo para largas sesiones de juegos  Compatible con	Xbox One X, Xbox One S, Xbox One, Windows 10','1300','5','Microsoft');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('55','Mando inalámbrico DUALSHOCK 4 version gold para Playstation 4 ','1800','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('56','Mando inalámbrico DUALSHOCK 4 version Titanium Azul para Playstation 4 ','1900','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('57','Mando inalámbrico DUALSHOCK 4 version Electric Azul para Playstation 4 ','1700','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('58','Mando inalámbrico DUALSHOCK 4 version Silver(plateado) para Playstation 4 ','1500','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('59','Mando inalámbrico DUALSHOCK 4 Negro standard para Playstation 4 ','1200','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('60',' wireless headset gold para PS4 Negro standard para Playstation 4 Habla con tus amigos y planea tácticas con tus compañeros de equipo con gran nitidez gracias a los micrófonos ocultos de anulación de ruido.','2300','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('61',' wireless headset gold para PS4 Negro version rosa oro para Playstation 4 Habla con tus amigos y planea tácticas con tus compañeros de equipo con gran nitidez gracias a los micrófonos ocultos de anulación de ruido.','2500','5','Sony');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('62','Mando Pro de Nintendo Switch Negro incluye  Conector USB Conector USB Type-CSirve para cargar el mando Pro de Nintendo Switch.Batería interna	Batería de ion de litio [CTR-003]Capacidd: 1300mAh','1900','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('63','Mando Pro de Nintendo Switch (edición Super Smash Bros. Ultimate) incluye  Conector USB Conector USB Type-CSirve para cargar el mando Pro de Nintendo Switch.Batería interna	Batería de ion de litio [CTR-003]Capacidd: 1300mAh','2500','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('64','Juego de mandos Joy-Con para Nintendo Switch Par de mandos Joy-Con, derecho e izquierdo, con dos correas de los mandos Joy-Con (grises).','2000','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('65','Juego de mandos Joy-Con para Nintendo Switch Par de mandos Joy-Con, derecho e izquierdo, con dos correas de los mandos Joy-Con (Azul Neon y Amarillo).','2300','5','Nintendo');

insert into Productos(Id_Producto,Desc_Producto,Precio,Cantidad,Proveedor)
values('66','Soporte de carga para mandos Joy-Con para Nintendo Switch Acopla el Joy-Con izquierdo y el Joy-Con derecho a este soporte de carga y úsalo como un mando tradicional.','700','5','Sony');

select*from Productos;


/*Tabla Consolas*/ 
insert into Consolas(Nombre_Consola,Id_Producto)
values('Xbox One S Blanca','1');

insert into Consolas(Nombre_Consola,Id_Producto)
values('Playstation 4 Slim Negra','2');

insert into Consolas(Nombre_Consola,Id_Producto)
values('Nintendo Switch Neon 1.1','6');

select*from Consolas;

/*Tabla Videojuegos*/ 
insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG Rol','M+17 Mature para personas con 17 años o mas ','Definitive Edition','Playstation 4','3','Persona 5 Royal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG Rol','M+17 Mature para personas con 17 años o mas ','Deluxe Edition','Playstation 4','4','Persona 5 Royal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG Rol','M+17 Mature para personas con 17 años o mas ','Standard Edition','Playstation 4','5','Persona 5 Royal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Action-RPG / Hack and Slash /','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Definitive Edition','Playstation 4','7','Nioh 2');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Action-RPG / Hack and Slash /','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Deluxe Edition','Playstation 4','8','Nioh 2');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Action-RPG / Hack and Slash /','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Standard Edition','Playstation 4','9','Nioh 2');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Definitive Edition','Playstation 4','10','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Deluxe Edition','Playstation 4','11','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Standard Edition','Playstation 4','12','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Definitive Edition','Xbox One','13','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Deluxe Edition','Xbox One','14','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Standard Edition','Xbox One','15','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Definitive Edition','Nintendo Switch','16','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Deluxe Edition','Nintendo Switch','17','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Standard Edition','Nintendo Switch','18','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG / Rol','Pegi+16-Mature para personas con 16 o más años de edad','Definitive Edition','Playstation 4','19','Final Fantasy 7 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG / Rol','Pegi+16-Mature para personas con 16 o más años de edad','Deluxe Edition','Playstation 4','20','Final Fantasy 7 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','JRPG / Rol','Pegi+16-Mature para personas con 16 o más años de edad','Standard Edition','Playstation 4','21','Final Fantasy 7 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Definitive Edition','Playstation 4','22','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Deluxe Edition','Playstation 4','23','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Standard Edition','Playstation 4','24','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Definitive Edition','Xbox One','25','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Deluxe Edition','Xbox One','26','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Standard Edition','Xbox One','27','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Definitive Edition','Pc','28','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Deluxe Edition','Pc','29','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Aventura de acción,Survival Horror,Zombis','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Standard Edition','Pc','30','Resident Evil 3 Remake');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Definitive Edition','Playstation 4','31','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Deluxe Edition','Playstation 4','32','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Standard Edition','Playstation 4','33','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Definitive Edition','Pc','34','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Deluxe Edition','Pc','35','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en tercera persona / Shooter multijugador','A+18-Adults only contenido apto solamente para adultos de 18 años o mas','Standard Edition','Pc','36','Predator Hunting Grounds');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Semi nuevo','Lucha / Lucha tipo Melee','T-Teen Adolescentes de 13 o más de años de edad','Definitive Edition','Nintendo Switch','37','Super Smash Bros ultimate');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Semi nuevo','Lucha / Lucha tipo Melee','T-Teen Adolescentes de 13 o más de años de edad','Deluxe Edition','Nintendo Switch','38','Super Smash Bros ultimate');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Semi nuevo','Lucha / Lucha tipo Melee','T-Teen Adolescentes de 13 o más de años de edad','Standard Edition','Nintendo Switch','39','Super Smash Bros ultimate');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Definitive Edition','Pc','40','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Deluxe Edition','Xbox One','41','Doom Eternal');

insert into Videojuegos(Tipo_Videojuego,Genero_Videojuego,Rating_Videojuego,Version_Videojuego,Consola,Id_Producto,Nombre_Videojuego)
values('Estreno','Shooter en primera persona','A+18-Adults only contenido apto solamente para adultos de 18 años o mas', 'Standard Edition','Xbox One','42','Doom Eternal');

select*from Videojuegos;

/*Tabla Facturas el iva profesor lo manejare solo como el 16%*/ 
insert into Facturas(Folio_fact,Fecha,Subtotal,Iva,Total)
values('1','2020-05-01 9:30:40','4200','800','5000');

insert into Facturas(Folio_fact,Fecha,Subtotal,Iva,Total)
values('2','2020-05-01 9:45:50','5460','1040','6500');

insert into Facturas(Folio_fact,Fecha,Subtotal,Iva,Total)
values('3','2020-05-01 9:55:35','1680','320','2000');

select*from Facturas;


/*Tabla Detalle_Factura*/ 
insert into Detalle_Factura(Folio_fact,Id_Producto,Total_movt,Iva_movt)
values('1','1','5000','800');

insert into Detalle_Factura(Folio_fact,Id_Producto,Total_movt,Iva_movt)
values('2','2','6500','1040');

insert into Detalle_Factura(Folio_fact,Id_Producto,Total_movt,Iva_movt)
values('3','3','2000','320');

select*from Detalle_Factura;

/*Tabla Inventario*/
 insert into Inventario(Id_Inventario,Id_Producto,Id_Sucursal,Cantidad,Notas)
 values('1','1','1','1','Se almacena en el inventario Xbox One S Blanco con 500 gb de disco duro compatible con la transmision 4k y Blue-ray disk incluye un control inalambrico con dos baterias y el videojuego de futbol Fifa 2020');

insert into Inventario(Id_Inventario,Id_Producto,Id_Sucursal,Cantidad,Notas)
 values('2','2','1','1','Se almacena en el inventario Playstation 4 Slim Negro con 1000 gb lo que es igual a un 1 Tb de disco duro no ofrece reproducción 4K incluye un control DualShock 4 con su respectivo cargador magnetico y el videojuego exclusivo de Ps4 Horizon Zero Dawn Edicion completa');

insert into Inventario(Id_Inventario,Id_Producto,Id_Sucursal,Cantidad,Notas)
 values('3','3','1','2','Videojuego exclusivo de Playstation 4 Persona 5 Royal Definitive edition que incluye el juego completo con Dlc ademas de un libro de arte con diseños de los personajes');

select*from Inventario;

insert into Ventas(Id_Venta,Venta_date,Id_Inventario,Id_Cliente,Id_Trabajador,Notas)
values('1','2020-05-01 9:30:40','1','1','1','Se vendio un Xbox One S Blanco con 500 gb de disco duro compatible con la transmision 4k y Blue-ray disk incluye un control inalambrico con dos baterias y el videojuego de futbol Fifa 2020 los precios y detalles estan en la factura y su respectivo detalle');

insert into Ventas(Id_Venta,Venta_date,Id_Inventario,Id_Cliente,Id_Trabajador,Notas)
values('2','2020-05-01 9:45:50','2','2','2','Se vendio un Playstation 4 Slim Negro con 1000 gb lo que es igual a un 1 Tb de disco duro no ofrece reproducción 4K incluye un control DualShock 4 con su respectivo cargador magnetico y el videojuego exclusivo de Ps4 Horizon Zero Dawn Edicion completa El precio y los detalles estan en la factura y su repectivo detalle de esta');

insert into Ventas(Id_Venta,Venta_date,Id_Inventario,Id_Cliente,Id_Trabajador,Notas)
values('3','2020-05-01 9:55:35','3','3','1','Se vendio un Juego exclusivo de Playstation 4 Persona 5 Royal version Definitive Edition El precio y los detalles estan en la factura de dicho movimiento');
select*from Ventas;

/*Ejemplos y Operaciones Operador like  y alias */
select Id_Cliente, Id_Sucursal,
Nombre as Nombre_Cliente,
concat(Apellido_P ,Apellido_M)as Apellido
from Clientes
where Nombre like 'E%'
Order by 2 desc;

/*Ejemplo Inner Join */
select C.Id_Cliente,F.Subtotal,V.Venta_date,
F.Subtotal * 0.16 as Iva,
 F.Subtotal + F.Total * 0.16 as Total
 from Facturas as F,Ventas as V
 inner Join CLientes as C on V.Id_Cliente = C.Id_Cliente
 where C.Id_Cliente = 1;
 
 /*Procedimiento almacenado*/ 
 Delimiter $$
create procedure Inventario_x_Ventas(In IxV int)
select 
I.Id_Producto as Numero_Producto,
V.Id_Venta as Numero_Venta,
V.Id_Cliente as Numero_Cliente,
V.Notas as Articulo_Vendido
From
Ventas as V
inner join inventario as I on I.Id_Inventario = V.Id_Inventario
where I.Id_Inventario = IxV;
$$

/*Mandar a llamarlo*/ 
call inventario_x_Ventas(3);

/*Procedimiento almacenado este preocedimiento recibirá como argumento el ID del producto y  mostrará la información de dicho producto dependiendo de que sea*/ 

Delimiter $$
create procedure Producto_Videojuego_(In Pv int)
select 
V.Nombre_Videojuego as Videojuego,
V.Tipo_Videojuego as Tipo,
V.Rating_Videojuego as Clasificacion,
V.Genero_Videojuego as Genero,
V.Version_Videojuego as Version,
V.Consola as Consola,
V.Id_Producto as Numero_Producto
From
Videojuegos as V
inner join Productos as P on V.Id_Producto = P.Id_Producto
where P.Id_Producto = Pv;
$$

call Producto_Videojuego_(25);

/*Procedimiento almacenado este preocedimiento recibirá como argumento el ID del producto y  mostrará la información de dicha consola*/ 
Delimiter $$
create procedure Producto_Consola(In Pc int)
select 
C.Nombre_Consola as Consola,
P.Proveedor as Distribuidor,
P.Desc_Producto as Descripcion,
P.Precio as Costo,
C.Id_Producto as Numero_Producto
From
Consolas as C
inner join Productos as P on C.Id_Producto = P.Id_Producto
where P.Id_Producto = Pc;
$$

call Producto_Consola(6);


Delimiter $$
create procedure Producto_Accesorio(In Pa int)
select 
P.Proveedor as Distribuidor,
P.Desc_Producto as Descripcion,
P.Precio as Costo,
P.Id_Producto as Numero_Producto,
P.Cantidad as Cantidad
From
Productos as P

where P.Id_Producto = Pa;
$$

call Producto_Accesorio();


/*Crear Funciones*/ 
Delimiter $$
Create function Sumar(A int, B int) returns int
reads sql data 
Begin 
declare C int;
set C = A + B;
Return C;
End 
$$

select sumar(6,5) as Resultado;


 /*Crear Funciones esta es para calcular el Iva*/ 
 Delimiter $$
 create function Iva2 (Monto Decimal(9,2), Tasa int)Returns Decimal(9,2)
 Reads sql data
Return Monto * Tasa/100;
$$

select Iva2 (2000,16) as Impuesto;

 /*Crear Vista*/
create view  Videojuego_Producto as 
select 
V.Nombre_Videojuego as Videojuego,
V.Tipo_Videojuego as Tipo,
V.Rating_Videojuego as Clasificacion,
V.Genero_Videojuego as Genero,
V.Version_Videojuego as Version,
V.Consola as Consola,
V.Id_Producto as Numero_Producto
From
Videojuegos as V
inner join Productos as P on V.Id_Producto = P.Id_Producto;

/*Utilizacion de vistas*/
select Videojuego,Tipo,Clasificacion, Genero,Version,Consola,Numero_Producto
from 
Videojuego_Producto;

/*Esta vista es para identificar las consolas*/

create view Consola_Producto as
select 
C.Nombre_Consola as Consola,
P.Proveedor as Distribuidor,
P.Desc_Producto as Clasificacion,
P.Precio as Costo,
C.Id_Producto as Numero_Producto
From
Consolas as C
inner join Productos as P on C.Id_Producto = P.Id_Producto;

select Consola,Distribuidor,Clasificacion,Costo,Numero_Producto
from Consola_Producto;

create view Accesorio_Producto as
select 
P.Proveedor as Distribuidor,
P.Desc_Producto as Descripcion,
P.Precio as Costo,
P.Id_Producto as Numero_Producto,
P.Cantidad as Cantidad
From
Productos as P

select Distribuidor,Descripcion,Costo,Numero_Producto,Cantidad
from Accesorio_Producto;
