CREATE TABLE carreras(
 clave int not null auto_increment,
descripcion char(100) not null,
  PRIMARY KEY (clave)
);
create database practica_php;
use practica_php;

create table alumnos(
clave char(10) not null,
nombre varchar(150) not null,
direccion varchar(250) not null,
foto char(50) not null,
sexo char(1) not null,
fecha_nacimiento date not null,
email varchar(150),
carrera int not null,
Foreign key(carrera) References carreras(clave) ON DELETE CASCADE
);






