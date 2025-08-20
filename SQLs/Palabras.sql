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
(N'ÁRBOLES', N'árboles'),
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
(N'DELFÍN', N'delfín'),
(N'DIAMANTE', N'diamante'),
(N'DURAZNO', N'durazno'),
(N'DEDALES', N'dedales'),
(N'DRAGÓN', N'dragón'),

-- E
(N'ELEFANTE', N'elefante'),
(N'ESPEJO', N'espejo'),
(N'ESTRELLA', N'estrella'),
(N'ESPADAS', N'espadas'),
(N'ENSALADA', N'ensalada'),

-- F
(N'FAROLES', N'faroles'),
(N'FÚTBOL', N'fútbol'),
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
(N'ÍNDICE', N'índice'),
(N'IDIOMAS', N'idiomas'),

-- J
(N'JARDÍN', N'jardín'),
(N'JUEGOS', N'juegos'),
(N'JIRAFA', N'jirafa'),
(N'JAMONES', N'jamones'),

-- K
(N'KOALA', N'koala'),
(N'KIOSCO', N'kiosco'),
(N'KARMA', N'karma'),

-- L
(N'LIBROS', N'libros'),
(N'LÁMPARA', N'lámpara'),
(N'LUNES', N'lunes'),
(N'LAGUNAS', N'lagunas'),

-- M
(N'MONTAÑA', N'montaña'),
(N'MUNDOS', N'mundos'),
(N'MARIPOSA', N'mariposa'),
(N'MOSCA', N'mosca'),
(N'MELÓN', N'melón'),

-- N
(N'NARANJA', N'naranja'),
(N'NIEVES', N'nieves'),
(N'NOCHES', N'noches'),
(N'NOVIOS', N'novios'),
(N'NARIZ', N'nariz'),

-- Ñ
(N'ÑANDÚ', N'ñandú'),
(N'ÑOQUIS', N'ñoquis'),
(N'ÑOÑERÍA', N'ñoñería'),

-- O
(N'OCÉANO', N'océano'),
(N'OVEJAS', N'ovejas'),
(N'ORILLAS', N'orillas'),
(N'OSTRAS', N'ostras'),
(N'OCASO', N'ocaso'),

-- P
(N'PERROS', N'perros'),
(N'PÁJAROS', N'pájaros'),
(N'PLATOS', N'platos'),
(N'PULPOS', N'pulpos'),
(N'PUENTE', N'puente'),

-- Q
(N'QUESO', N'queso'),
(N'QUÍMICA', N'química'),
(N'QUINTO', N'quinto'),
(N'QUESADILLA', N'quesadilla'),

-- R
(N'RELOJ', N'reloj'),
(N'RATÓN', N'ratón'),
(N'RADIO', N'radio'),
(N'RIEGO', N'riego'),
(N'RULETA', N'ruleta'),

-- S
(N'SILLÓN', N'sillón'),
(N'SERPIENTE', N'serpiente'),
(N'SELVA', N'selva'),
(N'SUEÑO', N'sueño'),
(N'SOMBRERO', N'sombrero'),

-- T
(N'TIGRE', N'tigre'),
(N'TELÉFONO', N'teléfono'),
(N'TENEDOR', N'tenedor'),
(N'TOMATE', N'tomate'),
(N'TORTUGA', N'tortuga'),

-- U
(N'UNICORNIO', N'unicornio'),
(N'UNIVERSO', N'universo'),
(N'UMBRAL', N'umbral'),
(N'UNIÓN', N'unión'),

-- V
(N'VENTANA', N'ventana'),
(N'VIOLÍN', N'violín'),
(N'VIAJE', N'viaje'),
(N'VIENTO', N'viento'),
(N'VOLCÁN', N'volcán'),

-- W
(N'WAFFLE', N'waffle'),
(N'WHISKY', N'whisky'),
(N'WEBCAM', N'webcam'),

-- X
(N'XILÓFONO', N'xilófono'),
(N'XILOGRAFÍA', N'xilografía'),
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
-- Inserta solo si no existe (comparación acento-insensible sobre Canon)
IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'canción')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CANCIÓN', N'canción');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'acción')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ACCIÓN', N'acción');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'razón')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'RAZÓN', N'razón');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'camión')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAMIÓN', N'camión');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'avión')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'AVIÓN', N'avión');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'botón')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'BOTÓN', N'botón');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'campeón')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAMPEÓN', N'campeón');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'lección')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'LECCIÓN', N'lección');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'edición')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'EDICIÓN', N'edición');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'órdenes')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓRDENES', N'órdenes');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'máximo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÁXIMO', N'máximo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'mínimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÍNIMO', N'mínimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'música')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÚSICA', N'música');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'público')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÚBLICO', N'público');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'página')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÁGINA', N'página');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'sábado')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'SÁBADO', N'sábado');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'miércoles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MIÉRCOLES', N'miércoles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'rápido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'RÁPIDO', N'rápido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'lógico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'LÓGICO', N'lógico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'física')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'FÍSICA', N'física');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'médico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÉDICO', N'médico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'útiles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÚTILES', N'útiles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cafés')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CAFÉS', N'cafés');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'sofás')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'SOFÁS', N'sofás');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'región')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'REGIÓN', N'región');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'vehículo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'VEHÍCULO', N'vehículo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'récord')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'RÉCORD', N'récord');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cráter')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CRÁTER', N'cráter');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'lámparas')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'LÁMPARAS', N'lámparas');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'mármol')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÁRMOL', N'mármol');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'árbitro')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁRBITRO', N'árbitro');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ángulo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁNGULO', N'ángulo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ámbitos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁMBITOS', N'ámbitos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'época')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÉPOCA', N'época');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cómodo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CÓMODO', N'cómodo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'héroe')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'HÉROE', N'héroe');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'héroes')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'HÉROES', N'héroes');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'húmedo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'HÚMEDO', N'húmedo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'húmeda')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'HÚMEDA', N'húmeda');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'métodos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÉTODOS', N'métodos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'párroco')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÁRROCO', N'párroco');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'típico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'TÍPICO', N'típico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'tópico')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'TÓPICO', N'tópico');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cúpula')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CÚPULA', N'cúpula');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'código')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CÓDIGO', N'código');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'crónica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CRÓNICA', N'crónica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'póliza')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÓLIZA', N'póliza');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'íntimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÍNTIMO', N'íntimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'íntegro')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÍNTEGRO', N'íntegro');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'índices')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÍNDICES', N'índices');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'óptimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓPTIMO', N'óptimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'óptica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓPTICA', N'óptica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'óleos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓLEOS', N'óleos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ópera')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓPERA', N'ópera');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ácido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁCIDO', N'ácido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ágiles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁGILES', N'ágiles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ánimo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁNIMO', N'ánimo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'árido')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁRIDO', N'árido');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'áureo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁUREO', N'áureo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'éxito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÉXITO', N'éxito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'éxitos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÉXITOS', N'éxitos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'único')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÚNICO', N'único');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'únicos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÚNICOS', N'únicos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'pétalo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÉTALO', N'pétalo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'pétalos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÉTALOS', N'pétalos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'péndulo')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'PÉNDULO', N'péndulo');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'débito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'DÉBITO', N'débito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'década')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'DÉCADA', N'década');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'débiles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'DÉBILES', N'débiles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'ángeles')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÁNGELES', N'ángeles');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'órgano')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓRGANO', N'órgano');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'órganos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'ÓRGANOS', N'órganos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'crédito')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CRÉDITO', N'crédito');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'créditos')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CRÉDITOS', N'créditos');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'fábrica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'FÁBRICA', N'fábrica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'fábricas')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'FÁBRICAS', N'fábricas');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'métrica')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÉTRICA', N'métrica');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cámara')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CÁMARA', N'cámara');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'cámaras')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'CÁMARAS', N'cámaras');

IF NOT EXISTS (SELECT 1 FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = N'máscara')
INSERT INTO dbo.Palabra (Texto, Canon) VALUES (N'MÁSCARA', N'máscara');
GO


SELECT
  Total      = COUNT(*),
  ConTilde   = SUM(CASE WHEN Canon LIKE N'%á%' OR Canon LIKE N'%é%' OR
                             Canon LIKE N'%í%' OR Canon LIKE N'%ó%' OR Canon LIKE N'%ú%'
                        THEN 1 ELSE 0 END)
FROM dbo.Palabra;