--usp_sel_DetalleCompra 'mchumbe'
CREATE PROCEDURE usp_sel_DetalleCompra
(
	@usuario varchar(30)
)as 
BEGIN
	select 
		CO.compra_codigo as codigo_compra,
		CONCAT(U.usuario_nombres, ' ',U.usuario_apellidos) as nombres_persona,
		U.usuario_login as login_usuario,
		PO.producto_nombre as nombre_producto,
		CO.compra_cantidad as cantidad_compra,
		CO.compra_subtotal as subtotal_compra,
		CO.compra_igv as igv_compra,
		CO.compra_total as total_compra,
		CONVERT(varchar(20), CO.compra_fecha, 103) as fecha_compra
	from compras CO
	INNER JOIN productos PO
		ON PO.producto_id = CO.compra_producto
	INNER JOIN usuarios U
		ON U.usuario_codigo = CO.compra_usuario
	WHERE U.usuario_login = @usuario
END
