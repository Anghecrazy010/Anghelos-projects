create database Universal_gamer_planet;
use Universal_gamer_planet;

create table Estado(
Id_Estado int auto_increment not null,
Nombre_Estado varchar(20) not null,
primary key(Id_Estado)
);

create table Municipio(
Id_Municipio int auto_increment not null,
Nombre_Municipio varchar(25) not null,
Id_Estado int not null,
foreign key (Id_Estado) references Estado(Id_Estado) on delete cascade,
primary key(Id_Municipio)
);

create table Sucursales(
Id_Sucursal tinyint not null,
Nombre varchar(30) not null,
Id_Estado int not null,
Id_Municipio int not null,
Notas varchar(40) null,
primary key(Id_Sucursal)
);
Alter table Sucursales add foreign key (Id_Municipio) references Municipio (Id_Municipio);
Alter table Sucursales add foreign key (Id_Estado) references Estado (Id_Estado);
alter table Sucursales add Notas varchar(40) null;
alter table Sucursales modify Nombre varchar(50) not null;

create table Clientes(
Id_cliente int auto_increment not null,
Nombre varchar(25) not null,
Apellido_P varchar(25) not null,
Apellido_M varchar(25) not null,
Corre_electronico varchar(30) not null,
Suscripcion tinyint(1),
Id_Direccion mediumint not null,
primary key(Id_cliente)
);
Alter table Clientes add foreign key (Id_Direccion) references Direccion(Id_Direccion);

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
Correo_electronico varchar(30) not null,
Id_Direccion mediumint not null,
primary key(Id_Trabajador)
);
Alter table Empleados add foreign key (Id_Sucursal) references Sucursales (Id_Sucursal);


create table Direccion(
Id_Direccion mediumint not null,
Direccion varchar(30) not null,
Codigo_Postal int(10) not null,
Telefono int(15) not null,
Id_Municipio int not null,
Id_Sucursal tinyint not null,
Id_Trabajador int not null,
Id_Cliente int not null,
primary key(Id_Direccion)
);
Alter table Direccion add foreign key(Id_Municipio) references Municipio (Id_Municipio);
Alter table Direccion add foreign key(Id_Trabajador) references Empleados (Id_Trabajador);
Alter table Direccion add foreign key(Id_Cliente) references Clientes  (Id_Cliente);

create table Consolas(
Id_Consola int(6) auto_increment not null,
Nombre_C varchar(20) not null,
Precio Decimal(5,2) not null,
Modelo varchar(25) not null,
primary key(Id_Consola)
);
Alter table Consolas modify Precio decimal(8,2) not null;

create table Videojuegos(
Id_Game int auto_increment not null,
Nombre_G varchar(30) not null,
Precio_G Decimal(5,2) not null,
Tipo varchar(20) not null,
Version varchar(25) not null,
Genero varchar(30) not null,
Clasificacion varchar(30) not null,
Id_Consola int(6) not null,
foreign key (Id_Consola) references Consolas(Id_Consola),
primary key(Id_Game)
);
Alter table Videojuegos modify Precio_G Decimal(6,2) not null;

create table Accesorios(
Id_Accesorio int not null,
Nombre varchar(25) not null,
Marca varchar(25) not null,
Descripcion Varchar(50),
Descuentos_Sub varchar(100),
Precio_A decimal(5,2),
Id_Consola int(6) not null,
primary key(Id_Accesorio)
);

Alter table Accesorios add foreign key(Id_Consola) references Consolas (Id_Consola);

create table Empresa(
Id_Cif int not null,
Nombre varchar(15) not null,
Direccion varchar(30) not null,
Id_Municipio int not null,
Id_Estado int not null,
primary key(Id_Cif)
);
Alter table Empresa add foreign key(Id_Municipio) references Municipio (Id_Municipio);
Alter table Empresa add foreign key(Id_Estado) references Estado (Id_Estado);

create table Pagos(
Id_Pago int auto_increment not null,
Fecha_Pago datetime,
Turno char(2),
Monto decimal(5,2),
Id_Game int not null,
Id_Cliente int not null,
Id_Trabajador int not null,
Id_Sucursal tinyint not null,
Id_Consola int(6) null,
Id_Accesorio int not null,
primary key(Id_Pago)
);

Alter table Pagos add foreign key(Id_Game) references Videojuegos (Id_Game);
Alter table Pagos add foreign key(Id_Cliente) references Clientes (Id_Cliente);
Alter table Pagos add foreign key(Id_Trabajador) references Empleados (Id_Trabajador);
Alter table Pagos add foreign key(Id_Sucursal) references Sucursales (Id_Sucursal);
Alter table Pagos add foreign key(Id_Consola) references Consolas (Id_Consola);
Alter table Pagos add foreign key(Id_Accesorio) references Accesorios (Id_Accesorio);
Alter table Pagos modify Monto decimal(9,2) not null;

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


/*Tabla Sucursales*/ 
Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas)
values('1','Universal gamer planet centro','1','1','Esta sucursal esta en funcionamiento');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas)
values('2','Universal gamer planet plaza Galerias','1','1','Esta sucursal esta en funcionamiento');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas)
values('3','Universal gamer planet Zona Dorada','1','1','Esta sucursal esta en funcionamiento');

Insert into Sucursales(Id_Sucursal,Nombre,Id_Estado,Id_Municipio,Notas)
values('4','Universal gamer planet Acaya','1','1','Esta sucursal esta en funcionamiento');

select * from Sucursales;

/*Tabla consolas*/ 
Insert into Consolas(Id_Consola,Nombre_C,Precio,Modelo)
values('1','Xbox 360','2500.00','120 Gb Elite');




select * from Consolas;



