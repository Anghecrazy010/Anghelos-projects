Create Database Blackbuster;

 Use Blackbuster;
 
 Create Table if not exists sucursales (
 ID_sucursal int(4) Unsigned not null auto_increment,
  Nombre_Sucursal varchar(35) not NULL,
    Fecha_Inauguracion date not null,
      primary key(ID_Sucursal)
       
     
 
 );
 
  Create Table Telefono_sucursal (
 Lada char(4) not null,
  Numero char(7) not NULL,
    ID_sucursal int(4) not null,
       
     
 
 
 );
 
   Create Table Direccion_sucursal (
 Calle varchar(30) not null,
  num_ext Varchar(5) not NULL,
    num_int Varchar(5) not null,
      Colonia Varchar(30),
      Cp Char(5),
      Ciudad Varchar(20),
      ID_sucursal int(5),
     
 
 
 );