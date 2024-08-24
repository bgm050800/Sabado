USE [master]
GO

CREATE DATABASE [SABADO_BD]
GO

USE [SABADO_BD]
GO

CREATE TABLE [dbo].[tCarrito](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tCategoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
 CONSTRAINT [PK_tCategoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tDetalle](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdMaestro] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetalle] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tMaestro](
	[IdMaestro] [int] IDENTITY(1,1) NOT NULL,
	[Consecutivo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tMaestro] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tProducto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Inventario] [int] NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tProveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NOT NULL,
 CONSTRAINT [PK_tProveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tRol](
	[IdRol] [tinyint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](100) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdRol] [tinyint] NOT NULL,
	[EsTemporal] [bit] NULL,
	[VigenciaTemporal] [datetime] NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tCategoria] ON 
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1, N'Ropa')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (2, N'Electrónica')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (3, N'Libros')
GO
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO

SET IDENTITY_INSERT [dbo].[tDetalle] ON 
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (10, 7, 1, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(2600.00 AS Decimal(18, 2)), CAST(22600.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (11, 8, 1, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), CAST(11300.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (12, 9, 4, 1, CAST(30000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(3900.00 AS Decimal(18, 2)), CAST(33900.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (13, 10, 4, 3, CAST(30000.00 AS Decimal(18, 2)), CAST(90000.00 AS Decimal(18, 2)), CAST(11700.00 AS Decimal(18, 2)), CAST(101700.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (14, 10, 1, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)), CAST(2600.00 AS Decimal(18, 2)), CAST(22600.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (15, 10, 3, 4, CAST(20000.00 AS Decimal(18, 2)), CAST(80000.00 AS Decimal(18, 2)), CAST(10400.00 AS Decimal(18, 2)), CAST(90400.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (16, 11, 1, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), CAST(11300.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (17, 12, 4, 5, CAST(30000.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), CAST(19500.00 AS Decimal(18, 2)), CAST(169500.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tDetalle] OFF
GO

SET IDENTITY_INSERT [dbo].[tMaestro] ON 
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (7, 1004, CAST(N'2024-03-17T10:15:45.020' AS DateTime), CAST(20000.00 AS Decimal(18, 2)), CAST(2600.00 AS Decimal(18, 2)), CAST(22600.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (8, 1005, CAST(N'2024-03-18T10:23:42.057' AS DateTime), CAST(10000.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), CAST(11300.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (9, 1005, CAST(N'2024-04-19T10:39:37.770' AS DateTime), CAST(30000.00 AS Decimal(18, 2)), CAST(3900.00 AS Decimal(18, 2)), CAST(339000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (10, 1004, CAST(N'2024-04-20T10:51:19.533' AS DateTime), CAST(190000.00 AS Decimal(18, 2)), CAST(24700.00 AS Decimal(18, 2)), CAST(214700.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (11, 1005, CAST(N'2024-05-21T08:29:14.033' AS DateTime), CAST(10000.00 AS Decimal(18, 2)), CAST(1300.00 AS Decimal(18, 2)), CAST(11300.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [Fecha], [SubTotal], [Impuesto], [Total]) VALUES (12, 1004, CAST(N'2024-05-22T08:49:06.230' AS DateTime), CAST(150000.00 AS Decimal(18, 2)), CAST(19500.00 AS Decimal(18, 2)), CAST(169500.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tMaestro] OFF
GO

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (1, N'Camiseta RM', N'Camiseta Sport del Real Madrid Númer 9', CAST(10000.00 AS Decimal(18, 2)), 1, 1, 12, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (3, N'Camiseta Bar', N'Camiseta Sport del Real Madrid Númer 9', CAST(20000.00 AS Decimal(18, 2)), 1, 1, 16, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (4, N'Camiseta MC', N'Camiseta Sport del Real Madrid Númer 9', CAST(30000.00 AS Decimal(18, 2)), 1, 1, 0, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[tProveedor] ON 
GO
INSERT [dbo].[tProveedor] ([IdProveedor], [Nombre]) VALUES (1, N'Nike')
GO
INSERT [dbo].[tProveedor] ([IdProveedor], [Nombre]) VALUES (2, N'Sony')
GO
INSERT [dbo].[tProveedor] ([IdProveedor], [Nombre]) VALUES (3, N'Lib Internacional')
GO
SET IDENTITY_INSERT [dbo].[tProveedor] OFF
GO

SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([IdRol], [Descripcion]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[tRol] ([IdRol], [Descripcion]) VALUES (2, N'Usuario')
GO
INSERT [dbo].[tRol] ([IdRol], [Descripcion]) VALUES (3, N'Prueba')
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1003, N'304590415', N'ecalvo90415@ufide.ac.cr', N'gWYGxPMLmwncMqU1dU1F9A==', N'Eduardo Calvo Castillo', 0, 1, 1, CAST(N'2024-07-27T11:38:59.820' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1004, N'117040465', N'bgonzalez40465@ufide.ac.cr', N'//L9diz6oFCPvLvFCKZjZQ==', N'Byron González Muñoz', 1, 1, 0, CAST(N'2024-08-17T09:15:53.637' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1005, N'117020932', N'bruiz20932@ufide.ac.cr', N'//L9diz6oFCPvLvFCKZjZQ==', N'Brandon Ruíz', 1, 2, 0, CAST(N'2024-08-17T09:11:07.623' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[tProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tProducto]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tUsuario]
GO

ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tMaestro] FOREIGN KEY([IdMaestro])
REFERENCES [dbo].[tMaestro] ([IdMaestro])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tMaestro]
GO

ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[tProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tProducto]
GO

ALTER TABLE [dbo].[tMaestro]  WITH CHECK ADD  CONSTRAINT [FK_tMaestro_tUsuario] FOREIGN KEY([Consecutivo])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tMaestro] CHECK CONSTRAINT [FK_tMaestro_tUsuario]
GO

ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tCategoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tCategoria]
GO

ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tProveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[tProveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tProveedor]
GO

ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tRol] ([IdRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

CREATE PROCEDURE [dbo].[ActualizarContrasenna] 
	@Consecutivo INT ,
	@Contrasenna VARCHAR(100),
	@EsTemporal BIT,
	@VigenciaTemporal DATETIME
AS
BEGIN

	UPDATE tUsuario
	   SET Contrasenna = @Contrasenna,
		   EsTemporal = @EsTemporal,
		   VigenciaTemporal = @VigenciaTemporal
	 WHERE Consecutivo = @Consecutivo
	
END
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@Consecutivo INT,
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(100),
	@Correo VARCHAR(100),
	@IdRol TINYINT
AS
BEGIN
	
	IF NOT EXISTS(SELECT 1 FROM dbo.tUsuario WHERE (Correo = @Correo 
												OR Identificacion = @Identificacion)
												AND Consecutivo != @Consecutivo)
	BEGIN

		UPDATE tUsuario
		   SET Identificacion = @Identificacion,
			   Nombre = @Nombre,
			   Correo = @Correo,
			   IdRol = @IdRol
		 WHERE Consecutivo = @Consecutivo

	END

END
GO

CREATE PROCEDURE [dbo].[CambiarEstadoProducto]
	@IdProducto INT
AS
BEGIN
	
	UPDATE tProducto
	SET Estado = CASE WHEN Estado = 1 THEN 0 ELSE 1 END
	WHERE IdProducto = @IdProducto

END
GO

CREATE PROCEDURE [dbo].[CambiarEstadoUsuario]
	@Consecutivo INT
AS
BEGIN
	
	UPDATE tUsuario
	SET Estado = CASE WHEN Estado = 1 THEN 0 ELSE 1 END
	WHERE Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ConsultarCarrito]
	@ConsecutivoUsuario INT
AS
BEGIN

	SELECT	IdCarrito,
			ConsecutivoUsuario,
			C.IdProducto,
			P.Nombre,
			P.PrecioUnitario,
			Cantidad,
			FechaCarrito,
			(C.Cantidad * P.PrecioUnitario) SubTotal,
			(c.Cantidad * P.PrecioUnitario) * 0.13 Impuesto,
			(C.Cantidad * P.PrecioUnitario) + (c.Cantidad * P.PrecioUnitario) * 0.13 Total
	FROM	dbo.tCarrito C
	INNER JOIN tProducto P ON C.IdProducto = P.IdProducto
	WHERE ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ConsultarClientes]

AS
BEGIN

--463 300.00

	SET LANGUAGE Spanish

	SELECT	SUM(Total) 'Total',
			DATENAME(MONTH, DATEADD(MONTH, MONTH(Fecha), -1)) 'NombreMes',
			DATEPART(MONTH,Fecha) 'NumeroMes'
	FROM	tMaestro
	GROUP BY DATEPART(MONTH,Fecha)
	ORDER BY DATEPART(MONTH,Fecha)

END
GO

CREATE PROCEDURE [dbo].[ConsultarDetalleFactura]
	@IdMaestro INT
AS
BEGIN

	SELECT	IdDetalle,
			IdMaestro,
			D.IdProducto,
			P.Nombre,
			Cantidad,
			D.PrecioUnitario,
			SubTotal,
			Impuesto,
			Total
	  FROM dbo.tDetalle D
	  INNER JOIN tProducto P ON D.IdProducto = p.IdProducto 
	WHERE IdMaestro = @IdMaestro

END
GO

CREATE PROCEDURE [dbo].[ConsultarFacturas]
	@ConsecutivoUsuario INT
AS
BEGIN

	SELECT	IdMaestro,
			Consecutivo 'ConsecutivoUsuario',
			Fecha 'FechaCompra',
			SubTotal,
			Impuesto,
			Total
	  FROM	dbo.tMaestro
	WHERE Consecutivo = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]

AS
BEGIN

	SELECT	IdProducto,
			prod.Nombre 'NombreProducto',
			Descripcion,
			PrecioUnitario,
			prod.IdCategoria,
			cat.Nombre 'NombreCategoria',
			prod.IdProveedor,
			prov.Nombre 'NombreProveedor',
			Inventario,
			Imagen,
			Estado,
			CASE WHEN Estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END EstadoDescripcion
	  FROM	dbo.tProducto prod
	  INNER JOIN dbo.tCategoria cat ON prod.IdCategoria = cat.IdCategoria
	  INNER JOIN dbo.tProveedor prov ON prod.IdProveedor = prov.IdProveedor

END
GO

CREATE PROCEDURE [dbo].[ConsultarProductosVendidos]

AS
BEGIN

--463 300.00

	SELECT	SUM(Cantidad) 'Cantidad',
			Nombre,
			DATEPART(MONTH,FECHA) 'Mes'
	FROM	tDetalle D
	INNER JOIN tMaestro M ON D.IdMaestro = M.IdMaestro
	INNER JOIN tProducto P ON D.IdProducto = P.IdProducto
	GROUP BY Nombre, DATEPART(MONTH,FECHA)
	ORDER BY SUM(Cantidad) DESC

END
GO

CREATE PROCEDURE [dbo].[ConsultarRoles]

AS
BEGIN

	SELECT	IdRol 'value', Descripcion 'text'
	FROM	tRol

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@Consecutivo INT
AS
BEGIN

	SELECT	Consecutivo,
			Identificacion,
			Correo,
			Nombre,
			Estado,
			CASE WHEN Estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END EstadoDescripcion,
			R.IdRol,
			R.Descripcion
	  FROM	dbo.tUsuario U
	  INNER JOIN dbo.tRol R ON U.IdRol = R.IdRol
	  WHERE Consecutivo = 	@Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuarioIdentificacion]
	@Identificacion VARCHAR(20)
AS
BEGIN

	SELECT	Consecutivo,
			Identificacion,
			Correo,
			Nombre,
			Estado,
			CASE WHEN Estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END EstadoDescripcion,
			R.IdRol,
			R.Descripcion
	  FROM	dbo.tUsuario U
	  INNER JOIN dbo.tRol R ON U.IdRol = R.IdRol
	  WHERE Identificacion = @Identificacion

END
GO

CREATE PROCEDURE [dbo].[ConsultarUsuarios]

AS
BEGIN

	SELECT	Consecutivo,
			Identificacion,
			Correo,
			Nombre,
			Estado,
			CASE WHEN Estado = 1 THEN 'ACTIVO' ELSE 'INACTIVO' END EstadoDescripcion,
			R.IdRol,
			R.Descripcion
	  FROM	dbo.tUsuario U
	  INNER JOIN dbo.tRol R ON U.IdRol = R.IdRol

END
GO

CREATE PROCEDURE [dbo].[ConsultarVentas]

AS
BEGIN

--463 300.00

	SET LANGUAGE Spanish

	SELECT	SUM(Total) 'Total',
			DATENAME(MONTH, DATEADD(MONTH, MONTH(Fecha), -1)) 'NombreMes',
			DATEPART(MONTH,Fecha) 'NumeroMes'
	FROM	tMaestro
	GROUP BY DATEPART(MONTH,Fecha)
	ORDER BY DATEPART(MONTH,Fecha)

END
GO

CREATE PROCEDURE [dbo].[EliminarProductoCarrito]
	@ConsecutivoUsuario INT,
	@IdProducto			INT
AS
BEGIN
	
	DELETE FROM tCarrito WHERE ConsecutivoUsuario = @ConsecutivoUsuario AND IdProducto = @IdProducto

END
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo			varchar(100),
	@Contrasenna	varchar(100)
AS
BEGIN

	SELECT	Consecutivo,
			Identificacion,
			Correo,
			Nombre,
			Estado,
			IdRol,
			EsTemporal,
			VigenciaTemporal
	  FROM	dbo.tUsuario
	  WHERE Correo = @Correo
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[PagarCarrito]
	@ConsecutivoUsuario INT
AS
BEGIN
	
	INSERT	INTO dbo.tMaestro (Consecutivo,Fecha,SubTotal,Impuesto,Total)
	SELECT	ConsecutivoUsuario,
			GETDATE(),
			SUM(P.PrecioUnitario * Cantidad),
			SUM((P.PrecioUnitario * Cantidad) * 0.13),
			SUM((P.PrecioUnitario * Cantidad) + (P.PrecioUnitario * Cantidad) * 0.13)
	FROM	tCarrito C
	INNER	JOIN	tProducto P ON C.IdProducto = P.IdProducto
	WHERE	ConsecutivoUsuario = @ConsecutivoUsuario
	GROUP BY ConsecutivoUsuario


	INSERT INTO dbo.tDetalle (IdMaestro,IdProducto,Cantidad,PrecioUnitario,SubTotal,Impuesto,Total)
	SELECT	SCOPE_IDENTITY(),
			C.IdProducto,
			Cantidad,
			P.PrecioUnitario,
			P.PrecioUnitario * Cantidad,
			(P.PrecioUnitario * Cantidad) * 0.13,
			(P.PrecioUnitario * Cantidad) + (P.PrecioUnitario * Cantidad) * 0.13
	FROM	tCarrito C
	INNER	JOIN	tProducto P ON C.IdProducto = P.IdProducto
	WHERE	ConsecutivoUsuario = @ConsecutivoUsuario


	UPDATE	P
	SET Inventario = Inventario - C.Cantidad
	FROM tProducto P
	INNER JOIN tCarrito C ON P.IdProducto = C.IdProducto
	WHERE	ConsecutivoUsuario = @ConsecutivoUsuario


	DELETE FROM tCarrito WHERE ConsecutivoUsuario = @ConsecutivoUsuario

END
GO

CREATE PROCEDURE [dbo].[RegistrarCarrito]
	@ConsecutivoUsuario INT,
	@IdProducto  INT,
	@Cantidad    INT
AS
BEGIN

	IF EXISTS(SELECT 1 FROM tCarrito WHERE ConsecutivoUsuario = @ConsecutivoUsuario
										AND IdProducto = @IdProducto)
	BEGIN

		UPDATE dbo.tCarrito
		SET Cantidad = @Cantidad
		WHERE ConsecutivoUsuario = @ConsecutivoUsuario
										AND IdProducto = @IdProducto

	END
	ELSE
	BEGIN

		INSERT INTO dbo.tCarrito (ConsecutivoUsuario,IdProducto,Cantidad,FechaCarrito)
		VALUES (@ConsecutivoUsuario,@IdProducto,@Cantidad,GETDATE())

	END

END
GO

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Identificacion	varchar(20),
	@Correo			varchar(100),
	@Contrasenna	varchar(100),
	@Nombre			varchar(100)
AS
BEGIN

	DECLARE @Estado		BIT = 1,
			@Rol		TINYINT = 2,
			@Temporal	TINYINT = 0

	IF NOT EXISTS(SELECT 1 FROM dbo.tUsuario WHERE Correo = @Correo OR Identificacion = @Identificacion)
	BEGIN

		INSERT INTO dbo.tUsuario(Identificacion,Correo,Contrasenna,Nombre,Estado,IdRol, EsTemporal, VigenciaTemporal)
		VALUES(@Identificacion,@Correo,@Contrasenna,@Nombre,@Estado,@Rol,@Temporal,GETDATE())

	END

END
GO

CREATE PROCEDURE [dbo].[ValidarExistencias]
	@ConsecutivoUsuario INT
AS
BEGIN

	SELECT	ConsecutivoUsuario, C.IdProducto, Cantidad, Inventario
	FROM	tCarrito C
	INNER JOIN tProducto P ON C.IdProducto = P.IdProducto
	WHERE	ConsecutivoUsuario = @ConsecutivoUsuario
		AND Cantidad > Inventario

END
GO