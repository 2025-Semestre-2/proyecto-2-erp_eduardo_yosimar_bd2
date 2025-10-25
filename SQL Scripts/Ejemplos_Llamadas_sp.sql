USE WideWorldImporters;
GO


-- Obtener las categorias de los lcientes.
EXEC sp_ObtenerCategoriasClientes;

-- Obtener las cateogiras de proveedores
EXEC sp_ObtenerCategoriasProveedores;

-- Obtener metodos de entrega.
EXEC sp_ObtenerMetodosEntrega;

-- Obtener clientes
EXEC sp_ObtenerClientes  @NombreCliente = null, @Categoria = null, @MetodoEntrega = null;

EXEC sp_ObtenerClientes  @NombreCliente = 'abe', @Categoria = null, @MetodoEntrega = null;

EXEC sp_ObtenerClientePorID @ClienteID = 102;

-- Obtener proveedores.
EXEC sp_ObtenerProveedores  @NombreProveedor = null, @Categoria = null, @MetodoEntrega = null;

EXEC sp_ObtenerProveedores  @NombreProveedor = 'abe', @Categoria = null, @MetodoEntrega = null;

EXEC sp_ObtenerProveedorPorID @ProveedorID = 1;


-- Obtener inventario.
EXEC sp_ObtenerInventario  @NombreProducto = 'a', @Grupo = 'clo', @CantidadMinima = 10, @CantidadMaxima = 100;

EXEC sp_ObtenerInventario  @NombreProducto = null, @Grupo = null, @CantidadMinima = null, @CantidadMaxima = null;

EXEC sp_ObtenerProductoPorID @ProductID = 4;

EXEC sp_ObtenerListaGruposPorProducto @ProductID = 4;

-- Obtener factura.
EXEC sp_ObtenerFacturas  @NumeroFactura = null, @NombreCliente = 'ab',  @FechaMinima = '2013-05-01', @FechaMaxima = '2014-06-01', @MontoMinimo = 500, @MontoMaximo = 3000;

EXEC sp_ObtenerFacturas  @NumeroFactura =  null, @NombreCliente =  null,  @FechaMinima =  null, @FechaMaxima =  null, @MontoMinimo =  null, @MontoMaximo =  null;

EXEC sp_ObtenerFacturaPorID @NumeroFactura = 10;

EXEC sp_ObtenerDetalleFacturaPorID @NumeroFactura = 10;


-- Estadisticas:

EXEC sp_EstadisticasDeComprasPorProveedor @NombreProveedor = null, @Categoria = 'Novelty Goods Supplier';

EXEC sp_EstadisticasVentasPorCliente @NombreCliente = null, @CategoriaCliente = null;

EXEC sp_TopProductosPorGananciaPorAnio @AnioInicio = 2014, @AnioFin = 2015;

EXEC sp_TopClientesPorPedidosPorAnio @AnioInicio = 2014, @AnioFin = 2014;

EXEC sp_TopProveedoresPorOrdenesPorAnio @AnioInicio = 2014, @AnioFin = 2016;
