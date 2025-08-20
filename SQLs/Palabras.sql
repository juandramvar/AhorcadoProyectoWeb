USE AhorcadoDB;
GO

BEGIN TRAN;

-- 1) Borrar partidas (tiene FK a Palabra y Usuario)
DELETE FROM dbo.Partida;

-- 2) Borrar palabras
DELETE FROM dbo.Palabra;

-- 3) (Opcional) Reiniciar IDENTITY para que empiece en 1
DBCC CHECKIDENT ('dbo.Palabra', RESEED, 0);

COMMIT;
GO

INSERT INTO dbo.Palabra (Texto, Canon) VALUES
-- A
(N'�RBOLES', N'�rboles'),
(N'ABANICO', N'abanico'),
(N'ANILLOS', N'anillos'),
(N'AMBULANCIA', N'ambulancia'),

-- B
(N'BOTELLA', N'botella'),
(N'BUFANDA', N'bufanda'),
(N'BIGOTES', N'bigotes'),
(N'BICICLETA', N'bicicleta'),

-- C
(N'CAMINO', N'camino'),
(N'CONEJO', N'conejo'),
(N'COCINA', N'cocina'),
(N'CEREZAS', N'cerezas'),
(N'CIENCIA', N'ciencia'),

-- D
(N'DELF�N', N'delf�n'),
(N'DIAMANTE', N'diamante'),
(N'DURAZNO', N'durazno'),
(N'DEDALES', N'dedales'),
(N'DRAG�N', N'drag�n'),

-- E
(N'ELEFANTE', N'elefante'),
(N'ESPEJO', N'espejo'),
(N'ESTRELLA', N'estrella'),
(N'ESPADAS', N'espadas'),
(N'ENSALADA', N'ensalada'),

-- F
(N'FAROLES', N'faroles'),
(N'F�TBOL', N'f�tbol'),
(N'FAMILIA', N'familia'),
(N'FRESAS', N'fresas'),
(N'FUEGOS', N'fuegos'),

-- G
(N'GUITARRA', N'guitarra'),
(N'GLOBOS', N'globos'),
(N'GIGANTE', N'gigante'),
(N'GIRASOL', N'girasol'),
(N'GUSANO', N'gusano'),

-- H
(N'HELADO', N'helado'),
(N'HORMIGA', N'hormiga'),
(N'HIGUERA', N'higuera'),
(N'HUMANO', N'humano'),
(N'HUESOS', N'huesos'),

-- I
(N'IGLESIA', N'iglesia'),
(N'INTERNET', N'internet'),
(N'INVIERNO', N'invierno'),
(N'�NDICE', N'�ndice'),
(N'IDIOMAS', N'idiomas'),

-- J
(N'JARD�N', N'jard�n'),
(N'JUEGOS', N'juegos'),
(N'JIRAFA', N'jirafa'),
(N'JAMONES', N'jamones'),

-- K
(N'KOALA', N'koala'),
(N'KIOSCO', N'kiosco'),
(N'KARMA', N'karma'),

-- L
(N'LIBROS', N'libros'),
(N'L�MPARA', N'l�mpara'),
(N'LUNES', N'lunes'),
(N'LAGUNAS', N'lagunas'),

-- M
(N'MONTA�A', N'monta�a'),
(N'MUNDOS', N'mundos'),
(N'MARIPOSA', N'mariposa'),
(N'MOSCA', N'mosca'),
(N'MEL�N', N'mel�n'),

-- N
(N'NARANJA', N'naranja'),
(N'NIEVES', N'nieves'),
(N'NOCHES', N'noches'),
(N'NOVIOS', N'novios'),
(N'NARIZ', N'nariz'),

-- �
(N'�AND�', N'�and�'),
(N'�OQUIS', N'�oquis'),
(N'�O�ER�A', N'�o�er�a'),

-- O
(N'OC�ANO', N'oc�ano'),
(N'OVEJAS', N'ovejas'),
(N'ORILLAS', N'orillas'),
(N'OSTRAS', N'ostras'),
(N'OCASO', N'ocaso'),

-- P
(N'PERROS', N'perros'),
(N'P�JAROS', N'p�jaros'),
(N'PLATOS', N'platos'),
(N'PULPOS', N'pulpos'),
(N'PUENTE', N'puente'),

-- Q
(N'QUESO', N'queso'),
(N'QU�MICA', N'qu�mica'),
(N'QUINTO', N'quinto'),
(N'QUESADILLA', N'quesadilla'),

-- R
(N'RELOJ', N'reloj'),
(N'RAT�N', N'rat�n'),
(N'RADIO', N'radio'),
(N'RIEGO', N'riego'),
(N'RULETA', N'ruleta'),

-- S
(N'SILL�N', N'sill�n'),
(N'SERPIENTE', N'serpiente'),
(N'SELVA', N'selva'),
(N'SUE�O', N'sue�o'),
(N'SOMBRERO', N'sombrero'),

-- T
(N'TIGRE', N'tigre'),
(N'TEL�FONO', N'tel�fono'),
(N'TENEDOR', N'tenedor'),
(N'TOMATE', N'tomate'),
(N'TORTUGA', N'tortuga'),

-- U
(N'UNICORNIO', N'unicornio'),
(N'UNIVERSO', N'universo'),
(N'UMBRAL', N'umbral'),
(N'UNI�N', N'uni�n'),

-- V
(N'VENTANA', N'ventana'),
(N'VIOL�N', N'viol�n'),
(N'VIAJE', N'viaje'),
(N'VIENTO', N'viento'),
(N'VOLC�N', N'volc�n'),

-- W
(N'WAFFLE', N'waffle'),
(N'WHISKY', N'whisky'),
(N'WEBCAM', N'webcam'),

-- X
(N'XIL�FONO', N'xil�fono'),
(N'XILOGRAF�A', N'xilograf�a'),
(N'XILOL', N'xilol'),

-- Y
(N'YOGUR', N'yogur'),
(N'YEGUA', N'yegua'),
(N'YUNQUE', N'yunque'),

-- Z
(N'ZAPATO', N'zapato'),
(N'ZANAHORIA', N'zanahoria'),
(N'ZORRO', N'zorro');

USE AhorcadoDB;
GO
--Palabras extra para completar la mitad con tilde.
-- Inserta solo si no existe (comparaci�n acento-insensible sobre Canon)
IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'canci�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CANCI�N', N'canci�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'acci�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ACCI�N', N'acci�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'raz�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'RAZ�N', N'raz�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cami�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAMI�N', N'cami�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'avi�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'AVI�N', N'avi�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'bot�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'BOT�N', N'bot�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'campe�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAMPE�N', N'campe�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'lecci�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'LECCI�N', N'lecci�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'edici�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'EDICI�N', N'edici�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�rdenes')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�RDENES', N'�rdenes');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�ximo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�XIMO', N'm�ximo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�nimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�NIMO', N'm�nimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�sica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�SICA', N'm�sica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�blico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�BLICO', N'p�blico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�gina')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�GINA', N'p�gina');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N's�bado')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'S�BADO', N's�bado');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'mi�rcoles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MI�RCOLES', N'mi�rcoles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'r�pido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'R�PIDO', N'r�pido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'l�gico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'L�GICO', N'l�gico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'f�sica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'F�SICA', N'f�sica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�dico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�DICO', N'm�dico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�tiles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�TILES', N'�tiles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'caf�s')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAF�S', N'caf�s');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'sof�s')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'SOF�S', N'sof�s');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'regi�n')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'REGI�N', N'regi�n');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'veh�culo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'VEH�CULO', N'veh�culo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'r�cord')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'R�CORD', N'r�cord');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cr�ter')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CR�TER', N'cr�ter');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'l�mparas')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'L�MPARAS', N'l�mparas');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�rmol')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�RMOL', N'm�rmol');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�rbitro')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�RBITRO', N'�rbitro');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ngulo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NGULO', N'�ngulo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�mbitos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�MBITOS', N'�mbitos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�poca')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�POCA', N'�poca');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'c�modo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'C�MODO', N'c�modo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'h�roe')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'H�ROE', N'h�roe');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'h�roes')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'H�ROES', N'h�roes');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'h�medo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'H�MEDO', N'h�medo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'h�meda')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'H�MEDA', N'h�meda');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�todos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�TODOS', N'm�todos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�rroco')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�RROCO', N'p�rroco');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N't�pico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'T�PICO', N't�pico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N't�pico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'T�PICO', N't�pico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'c�pula')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'C�PULA', N'c�pula');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'c�digo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'C�DIGO', N'c�digo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cr�nica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CR�NICA', N'cr�nica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�liza')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�LIZA', N'p�liza');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ntimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NTIMO', N'�ntimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ntegro')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NTEGRO', N'�ntegro');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ndices')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NDICES', N'�ndices');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ptimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�PTIMO', N'�ptimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ptica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�PTICA', N'�ptica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�leos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�LEOS', N'�leos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�pera')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�PERA', N'�pera');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�cido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�CIDO', N'�cido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�giles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�GILES', N'�giles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�nimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NIMO', N'�nimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�rido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�RIDO', N'�rido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ureo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�UREO', N'�ureo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�xito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�XITO', N'�xito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�xitos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�XITOS', N'�xitos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�nico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NICO', N'�nico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�nicos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NICOS', N'�nicos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�talo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�TALO', N'p�talo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�talos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�TALOS', N'p�talos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'p�ndulo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'P�NDULO', N'p�ndulo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'd�bito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'D�BITO', N'd�bito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'd�cada')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'D�CADA', N'd�cada');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'd�biles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'D�BILES', N'd�biles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�ngeles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�NGELES', N'�ngeles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�rgano')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�RGANO', N'�rgano');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'�rganos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'�RGANOS', N'�rganos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cr�dito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CR�DITO', N'cr�dito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cr�ditos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CR�DITOS', N'cr�ditos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'f�brica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'F�BRICA', N'f�brica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'f�bricas')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'F�BRICAS', N'f�bricas');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�trica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�TRICA', N'm�trica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'c�mara')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'C�MARA', N'c�mara');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'c�maras')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'C�MARAS', N'c�maras');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'm�scara')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'M�SCARA', N'm�scara');
GO


SELECT
  Total      = COUNT(*),
  ConTilde   = SUM(CASE WHEN Canon LIKE N'%�%' OR Canon LIKE N'%�%' OR
                             Canon LIKE N'%�%' OR Canon LIKE N'%�%' OR Canon LIKE N'%�%'
                        THEN 1 ELSE 0 END)
FROM dbo.Palabra;