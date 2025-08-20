USE AhorcadoDB;
GO

-- Script para insertar 100 palabras en la tabla 'Palabra'.
-- Cada palabra cumple las siguientes condiciones:
-- - Empieza por una letra del abecedario (A-Z, Ñ).
-- - Longitud entre 5 y 10 caracteres.
-- - Se incluyen palabras con tilde.
-- - Cada palabra tiene su 'Texto' original y su 'Canon' (minúsculas, sin acentos).
-- Por defecto, todas las palabras se añaden como 'Disponibles'.

INSERT INTO dbo.Palabra (Texto, Canon) VALUES
-- A (4 palabras para completar a 100)
('Árboles', 'arboles'),
('Abanico', 'abanico'),
('Anillos', 'anillos'),
('Ambulancia', 'ambulancia'),

-- B (4 palabras para completar a 100)
('Botella', 'botella'),
('Bufanda', 'bufanda'),
('Bigotes', 'bigotes'),
('Bicicleta', 'bicicleta'),

-- C (5 palabras para completar a 100)
('Camino', 'camino'),
('Conejo', 'conejo'),
('Cocina', 'cocina'),
('Cerezas', 'cerezas'),
('Ciencia', 'ciencia'),

-- D (5 palabras para completar a 100)
('Delfín', 'delfin'),
('Diamante', 'diamante'),
('Durazno', 'durazno'),
('Dedales', 'dedales'),
('Dragón', 'dragon'),

-- E (5 palabras para completar a 100)
('Elefante', 'elefante'),
('Espejo', 'espejo'),
('Estrella', 'estrella'),
('Espadas', 'espadas'),
('Ensalada', 'ensalada'),

-- F (5 palabras para completar a 100)
('Faroles', 'faroles'),
('Fútbol', 'futbol'),
('Familia', 'familia'),
('Fresas', 'fresas'),
('Fuegos', 'fuegos'),

-- G (5 palabras para completar a 100)
('Guitarra', 'guitarra'),
('Globos', 'globos'),
('Gigante', 'gigante'),
('Girasol', 'girasol'),
('Gusano', 'gusano'),

-- H (5 palabras para completar a 100)
('Helado', 'helado'),
('Hormiga', 'hormiga'),
('Higuera', 'higuera'),
('Humano', 'humano'),
('Huesos', 'huesos'),

-- I (5 palabras para completar a 100)
('Iglesia', 'iglesia'),
('Internet', 'internet'),
('Invierno', 'invierno'),
('Índice', 'indice'),
('Idiomas', 'idiomas'),

-- J (4 palabras para completar a 100)
('Jardín', 'jardin'),
('Juegos', 'juegos'),
('Jirafa', 'jirafa'),
('Jamones', 'jamones'),

-- K (3 palabras)
('Koala', 'koala'),
('Kiosco', 'kiosco'),
('Karma', 'karma'),

-- L (4 palabras para completar a 100)
('Libros', 'libros'),
('Lámpara', 'lampara'),
('Lunes', 'lunes'),
('Lagunas', 'lagunas'),

-- M (5 palabras para completar a 100)
('Montaña', 'montana'),
('Mundos', 'mundos'),
('Mariposa', 'mariposa'),
('Mosca', 'mosca'),
('Melón', 'melon'),

-- N (5 palabras para completar a 100)
('Naranja', 'naranja'),
('Nieves', 'nieves'),
('Noches', 'noches'),
('Novios', 'novios'),
('Nariz', 'nariz'),

-- Ñ (3 palabras)
('Ñandú', 'nandu'),
('Ñoquis', 'noquis'),
('Ñoñería', 'noneria'),

-- O (5 palabras para completar a 100)
('Océano', 'oceano'),
('Ovejas', 'ovejas'),
('Orillas', 'orillas'),
('Ostras', 'ostras'),
('Ocaso', 'ocaso'),

-- P (5 palabras para completar a 100)
('Perros', 'perros'),
('Pájaros', 'pajaros'),
('Platos', 'platos'),
('Pulpos', 'pulpos'),
('Puente', 'puente'),

-- Q (4 palabras para completar a 100)
('Queso', 'queso'),
('Química', 'quimica'),
('Quinto', 'quinto'),
('Quesadilla', 'quesadilla'),

-- R (5 palabras para completar a 100)
('Reloj', 'reloj'),
('Ratón', 'raton'),
('Radio', 'radio'),
('Riego', 'riego'),
('Ruleta', 'ruleta'),

-- S (5 palabras para completar a 100)
('Sillón', 'sillon'),
('Serpiente', 'serpiente'),
('selva', 'selva'),
('Sueño', 'sueno'),
('Sombrero', 'sombrero'),

-- T (5 palabras para completar a 100)
('Tigre', 'tigre'),
('Teléfono', 'telefono'),
('Tenedor', 'tenedor'),
('Tomate', 'tomate'),
('Tortuga', 'tortuga'),

-- U (4 palabras para completar a 100)
('Unicornio', 'unicornio'),
('Universo', 'universo'),
('Umbral', 'umbral'),
('Unión', 'union'),

-- V (5 palabras para completar a 100)
('Ventana', 'ventana'),
('Violín', 'violin'),
('Viaje', 'viaje'),
('Viento', 'viento'),
('Volcán', 'volcan'),

-- W (3 palabras)
('Waffle', 'waffle'),
('Whisky', 'whisky'),
('Webcam', 'webcam'),

-- X (3 palabras)
('Xilófono', 'xilofono'),
('Xilografía', 'xilografia'),
('Xilol', 'xilol'),

-- Y (3 palabras)
('Yogur', 'yogur'),
('Yegua', 'yegua'),
('Yunque', 'yunque'),

-- Z (3 palabras)
('Zapato', 'zapato'),
('Zanahoria', 'zanahoria'),
('Zorro', 'zorro');
GO
