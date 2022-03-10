use ejemplo;

INSERT into productos values(5049,"Yogurt natural","Litros",8.75,1.5);
select * from productos;

update productos set desc_prod = 'Yogurt de fresa' where clav_prod = '5049';
select * from facturas where folio_fact = 2 

INSERT into facturas values(2,20200302,113.26,18.12,131.38);
select * from facturas;

INSERT into detalle_factura values(6,5049,13.13,2.10);
select * from detalle_factura;

INSERT into productos values(7804,"Requeson","Kilogramos",6.84,0.75);
select * from productos;

INSERT into facturas values(3,20200302,113.26,18.12,131.38);
select * from facturas;

INSERT into detalle_factura values(6,7804,8.13,0.82);
select * from detalle_factura where folio_fact = 6;

INSERT into productos values(3879,"Leche","Litros",10.0,3.0);
select * from productos;

INSERT into facturas values (4,20200302,113.26,18.12,131.38);
select * from facturas;

INSERT into detalle_factura values(6,3879,30.0,4.80);
select * from detalle_factura;

INSERT into productos values(4597,"Mantequilla","Kilogramos",10.0,1.0);
select * from productos;

INSERT into facturas values(5,20200302,113.26,18.12,131.38);
select * from facturas;

INSERT into detalle_factura values(6,4597,15.0,2.40);
select * from detalle_factura;

INSERT into productos values(1356,"Queso","Kilogramos",8.75,2.0);
select * from productos;

INSERT into facturas values(6,20200302,113.26,18.12,131.38);
select * from facturas;

INSERT into detalle_factura values(6,1356,50.0,8.0);
select * from detalle_factura;

alter table productos change unidad_med unidad_med varchar(15) not null; 
alter table productos change  cantidad  cantidad decimal (5,2) not null;