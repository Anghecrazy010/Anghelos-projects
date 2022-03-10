create database inventario;
use inventario;
create table empresas(
id_Cif int (8) unsigned not null,
Nombre varchar (10) not null,
Direccion varchar (20) not null,
Localidad varchar (20) not null,
Provincia varchar (20) not null,
primary key (id_Cif)
);


create table suministros(
id_Cif int unsigned not null,
Tipo varchar (20) not null,
Modelo int not null,
Precio_compra decimal(5,2) not null,
foreign key (id_Cif) references empresas(id_Cif)

);

create table piezas(
Precio_venta decimal(5,2) not null,
Tipo varchar (20) not null,
Modelo int not null


);

create table existencias(
N_almacen int (8) not null,
Cantidad int not null,
Tipo varchar (20) not null,
Modelo int not null


);
alter table suministros add primary key (Tipo);

alter table piezas add primary key (Modelo);

alter table piezas add foreign key (Tipo) references suministros (Tipo);

alter table existencias add foreign key (Modelo) references piezas (Modelo);


