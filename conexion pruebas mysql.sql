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