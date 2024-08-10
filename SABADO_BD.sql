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

SET IDENTITY_INSERT [dbo].[tCarrito] ON 
GO
INSERT [dbo].[tCarrito] ([IdCarrito], [ConsecutivoUsuario], [IdProducto], [Cantidad], [FechaCarrito]) VALUES (10, 1005, 1, 2, CAST(N'2024-08-10T11:01:50.753' AS DateTime))
GO
INSERT [dbo].[tCarrito] ([IdCarrito], [ConsecutivoUsuario], [IdProducto], [Cantidad], [FechaCarrito]) VALUES (11, 1005, 3, 1, CAST(N'2024-08-10T11:02:15.957' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tCarrito] OFF
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

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (1, N'Camiseta RM', N'Camiseta Sport del Real Madrid Númer 9', CAST(10000.00 AS Decimal(18, 2)), 1, 1, 10, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (3, N'Camiseta Bar', N'Camiseta Sport del Real Madrid Númer 9', CAST(20000.00 AS Decimal(18, 2)), 1, 1, 10, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Nombre], [Descripcion], [PrecioUnitario], [IdCategoria], [IdProveedor], [Inventario], [Imagen], [Estado]) VALUES (4, N'Camiseta MC', N'Camiseta Sport del Real Madrid Númer 9', CAST(30000.00 AS Decimal(18, 2)), 1, 1, 10, N'https://th.bing.com/th/id/OIP._qIym2Dp8vJp5mqULak_-AAAAA?rs=1&pid=ImgDetMain', 1)
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
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1003, N'304590415', N'ecalvo90415@ufide.ac.cr', N'gWYGxPMLmwncMqU1dU1F9A==', N'Eduardo Calvo Castillo', 1, 1, 1, CAST(N'2024-07-27T11:38:59.820' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1004, N'117040465', N'bgonzalez40465@ufide.ac.cr', N'14bOecF5ZzXCHaJAfUiw+A==', N'Byron González Muñoz', 1, 1, NULL, NULL)
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Correo], [Contrasenna], [Nombre], [Estado], [IdRol], [EsTemporal], [VigenciaTemporal]) VALUES (1005, N'117020932', N'bruiz20932@ufide.ac.cr', N'AsvBDUqDOKX88CbmXbXfTg==', N'Brandon Ruíz', 1, 1, 0, CAST(N'2024-08-03T09:33:42.677' AS DateTime))
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
			Estado
	  FROM	dbo.tProducto prod
	  INNER JOIN dbo.tCategoria cat ON prod.IdCategoria = cat.IdCategoria
	  INNER JOIN dbo.tProveedor prov ON prod.IdProveedor = prov.IdProveedor

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