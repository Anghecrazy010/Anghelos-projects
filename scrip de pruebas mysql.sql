use ejemplo;
INSERT into
 productos (clav_prod,desc_prod,precio_unitario,unidad_med,cantidad)
values(1356,"queso",25.0,"Kilogramos",2);
select * from productos;

INSERT into
 facturas (fecha,folio_fact,subtotal,iva,total)
values(2020/2/14,9,25.0,4.0,29.0);
select * from facturas;

INSERT into
 detalle_factura (folio_fact,clav_prod,iva_movto,total_motvo)
values(9,1356,4.0,29.0);
select * from detalle_factura;

INSERT into
 productos (clav_prod,desc_prod,precio_unitario,unidad_med,cantidad)
values(3874,"Leche",30.0,"Litros",1);
select * from productos;

INSERT into
 facturas (fecha,folio_fact,subtotal,iva,total)
values(2020/2/14,10,30.0,4.8,34.8);
select * from facturas;

INSERT into
 detalle_factura (folio_fact,clav_prod,iva_movto,total_motvo)
values(10,3874,4.8,34.8);
select * from detalle_factura;



