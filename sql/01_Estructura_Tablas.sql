DROP TABLE IF EXISTS RequerimientosCiudadanos;
DROP TABLE IF EXISTS Cuadrillas;
DROP TABLE IF EXISTS TiposServicio;
DROP TABLE IF EXISTS ZonasAdministrativas;

CREATE TABLE ZonasAdministrativas (
    ZonaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreZona NVARCHAR(100) NOT NULL,
    Sede NVARCHAR(100) NOT NULL
);

CREATE TABLE TiposServicio (
    TipoServicioID INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(100) NOT NULL,
    PrioridadDefecto NVARCHAR(20) DEFAULT 'Media'
);

CREATE TABLE Cuadrillas (
    CuadrillaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCuadrilla NVARCHAR(100) NOT NULL,
    EmpresaPublica NVARCHAR(100) NOT NULL,
    ZonaID INT NOT NULL,
    CONSTRAINT FK_Cuadrillas_Zonas FOREIGN KEY (ZonaID) REFERENCES ZonasAdministrativas(ZonaID)
);

CREATE TABLE RequerimientosCiudadanos (
    RequerimientoID INT IDENTITY(1,1) PRIMARY KEY,
    ZonaID INT NOT NULL,
    TipoServicioID INT NOT NULL,
    CuadrillaID INT NULL,
    DireccionDetallada NVARCHAR(250) NOT NULL,
    Estado NVARCHAR(30) DEFAULT 'Pendiente',
    FechaRegistro DATETIME2 DEFAULT SYSDATETIME(),
    CONSTRAINT FK_Req_Zonas FOREIGN KEY (ZonaID) REFERENCES ZonasAdministrativas(ZonaID),
    CONSTRAINT FK_Req_Servicios FOREIGN KEY (TipoServicioID) REFERENCES TiposServicio(TipoServicioID),
    CONSTRAINT FK_Req_Cuadrillas FOREIGN KEY (CuadrillaID) REFERENCES Cuadrillas(CuadrillaID)
);

INSERT INTO ZonasAdministrativas (NombreZona, Sede) VALUES 
('Administración Zonal Eugenio Espejo', 'Norte'),
('Administración Zonal Manuela Sáenz', 'Centro Histórico'),
('Administración Zonal Eloy Alfaro', 'Sur');

INSERT INTO TiposServicio (Descripcion, PrioridadDefecto) VALUES 
('Reparación de alcantarillado y bacheo', 'Alta'),
('Mantenimiento de luminarias y parques', 'Media'),
('Limpieza y recolección de escombros', 'Baja');

INSERT INTO Cuadrillas (NombreCuadrilla, EmpresaPublica, ZonaID) VALUES 
('Cuadrilla Vial 01', 'EPMMOP', 1),
('Cuadrilla Parques 02', 'EPMMOP', 2),
('Cuadrilla Agua 03', 'EPMAPS', 3);
