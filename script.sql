-- Drop table

-- DROP TABLE DALE_SALE_DB.dbo.Producto;

CREATE TABLE DALE_SALE_DB.dbo.Producto (
	Id uniqueidentifier NOT NULL,
	Nombre nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Valor float NOT NULL,
	CONSTRAINT PK_Producto PRIMARY KEY (Id)
);

-- Drop table

-- DROP TABLE DALE_SALE_DB.dbo.Cliente;

CREATE TABLE DALE_SALE_DB.dbo.Cliente (
	Id uniqueidentifier NOT NULL,
	Cedula bigint NOT NULL,
	Nombre nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Apellido nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Telefono nvarchar COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY (Id)
);


-- Drop table

-- DROP TABLE DALE_SALE_DB.dbo.Venta;

CREATE TABLE DALE_SALE_DB.dbo.Venta (
	Id uniqueidentifier NOT NULL,
	ClienteId uniqueidentifier NOT NULL,
	ProductoId uniqueidentifier NOT NULL,
	ValorUnitario float NOT NULL,
	ValorTotal float NOT NULL,
	Cantidad int DEFAULT 0 NOT NULL,
	CONSTRAINT PK_Venta PRIMARY KEY (Id),
	CONSTRAINT VENTA_CLIENTE_FK FOREIGN KEY (ClienteId) REFERENCES DALE_SALE_DB.dbo.Cliente(Id),
	CONSTRAINT VENTA_PRODUCTO_FK FOREIGN KEY (ProductoId) REFERENCES DALE_SALE_DB.dbo.Producto(Id)
);
 CREATE NONCLUSTERED INDEX IX_Venta_ClienteId ON dbo.Venta (  ClienteId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Venta_ProductoId ON dbo.Venta (  ProductoId ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;

