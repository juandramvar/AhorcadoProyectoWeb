-- BD (ajusta el nombre si quieres)
IF DB_ID('AhorcadoDB') IS NULL
    CREATE DATABASE AhorcadoDB;
GO
USE AhorcadoDB;
GO

-- Usuario
IF OBJECT_ID('dbo.Usuario') IS NULL
BEGIN
    CREATE TABLE dbo.Usuario(
        IdUsuario     INT IDENTITY(1,1) PRIMARY KEY,
        Cedula        VARCHAR(12) NOT NULL,   -- guardamos “solo dígitos”
        Nombre        NVARCHAR(50) NOT NULL,
        CONSTRAINT UQ_Usuario_Cedula UNIQUE (Cedula)
    );
END
GO

-- Palabra
IF OBJECT_ID('dbo.Palabra') IS NULL
BEGIN
    CREATE TABLE dbo.Palabra(
        IdPalabra     INT IDENTITY(1,1) PRIMARY KEY,
        Texto         NVARCHAR(50) NOT NULL,
        Canon         NVARCHAR(50) NOT NULL,  -- por ejemplo, minúsculas normalizadas
        CONSTRAINT UQ_Palabra_Texto UNIQUE (Texto),
        CONSTRAINT UQ_Palabra_Canon UNIQUE (Canon)
    );
    -- Sugerencia de índice para búsquedas por Canon
    CREATE INDEX IX_Palabra_Canon ON dbo.Palabra(Canon);
END
GO

-- Partida (histórico de juegos)
IF OBJECT_ID('dbo.Partida') IS NULL
BEGIN
    CREATE TABLE dbo.Partida(
        IdPartida     INT IDENTITY(1,1) PRIMARY KEY,
        IdUsuario     INT NOT NULL FOREIGN KEY REFERENCES dbo.Usuario(IdUsuario),
        IdPalabra     INT NOT NULL FOREIGN KEY REFERENCES dbo.Palabra(IdPalabra),
        Dificultad    TINYINT NOT NULL,    -- 1=Fácil, 2=Normal, 3=Difícil
        FechaHora     DATETIME NOT NULL DEFAULT(GETDATE()),
        Gano          BIT NOT NULL,        -- 1=Ganó, 0=Perdió
        Puntos        INT NOT NULL         -- +1/+2/+3 o -1/-2/-3 según reglas
    );

    CREATE INDEX IX_Partida_Usuario ON dbo.Partida(IdUsuario);
    CREATE INDEX IX_Partida_Fecha   ON dbo.Partida(FechaHora);
END
GO

--Edicion de palabras para que este disponible o no.
USE AhorcadoDB;
GO

ALTER TABLE dbo.Palabra
ADD Disponible BIT NOT NULL CONSTRAINT DF_Palabra_Disponible DEFAULT(1) WITH VALUES;
GO

---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
 --Reactivar todas las palabras
UPDATE dbo.Palabra SET Disponible = 1;