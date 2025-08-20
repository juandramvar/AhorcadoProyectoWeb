USE AhorcadoDB;
GO

-- Script para insertar 100 palabras en la tabla 'Palabra'.
-- Cada palabra cumple las siguientes condiciones:
-- - Empieza por una letra del abecedario (A-Z, �).
-- - Longitud entre 5 y 10 caracteres.
-- - Se incluyen palabras con tilde.
-- - Cada palabra tiene su 'Texto' original y su 'Canon' (min�sculas, sin acentos).
-- Por defecto, todas las palabras se a�aden como 'Disponibles'.

INSERT INTO dbo.Palabra (Texto, Canon) VALUES
-- A (4 palabras para completar a 100)
('�rboles', 'arboles'),
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
('Delf�n', 'delfin'),
('Diamante', 'diamante'),
('Durazno', 'durazno'),
('Dedales', 'dedales'),
('Drag�n', 'dragon'),

-- E (5 palabras para completar a 100)
('Elefante', 'elefante'),
('Espejo', 'espejo'),
('Estrella', 'estrella'),
('Espadas', 'espadas'),
('Ensalada', 'ensalada'),

-- F (5 palabras para completar a 100)
('Faroles', 'faroles'),
('F�tbol', 'futbol'),
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
('�ndice', 'indice'),
('Idiomas', 'idiomas'),

-- J (4 palabras para completar a 100)
('Jard�n', 'jardin'),
('Juegos', 'juegos'),
('Jirafa', 'jirafa'),
('Jamones', 'jamones'),

-- K (3 palabras)
('Koala', 'koala'),
('Kiosco', 'kiosco'),
('Karma', 'karma'),

-- L (4 palabras para completar a 100)
('Libros', 'libros'),
('L�mpara', 'lampara'),
('Lunes', 'lunes'),
('Lagunas', 'lagunas'),

-- M (5 palabras para completar a 100)
('Monta�a', 'montana'),
('Mundos', 'mundos'),
('Mariposa', 'mariposa'),
('Mosca', 'mosca'),
('Mel�n', 'melon'),

-- N (5 palabras para completar a 100)
('Naranja', 'naranja'),
('Nieves', 'nieves'),
('Noches', 'noches'),
('Novios', 'novios'),
('Nariz', 'nariz'),

-- � (3 palabras)
('�and�', 'nandu'),
('�oquis', 'noquis'),
('�o�er�a', 'noneria'),

-- O (5 palabras para completar a 100)
('Oc�ano', 'oceano'),
('Ovejas', 'ovejas'),
('Orillas', 'orillas'),
('Ostras', 'ostras'),
('Ocaso', 'ocaso'),

-- P (5 palabras para completar a 100)
('Perros', 'perros'),
('P�jaros', 'pajaros'),
('Platos', 'platos'),
('Pulpos', 'pulpos'),
('Puente', 'puente'),

-- Q (4 palabras para completar a 100)
('Queso', 'queso'),
('Qu�mica', 'quimica'),
('Quinto', 'quinto'),
('Quesadilla', 'quesadilla'),

-- R (5 palabras para completar a 100)
('Reloj', 'reloj'),
('Rat�n', 'raton'),
('Radio', 'radio'),
('Riego', 'riego'),
('Ruleta', 'ruleta'),

-- S (5 palabras para completar a 100)
('Sill�n', 'sillon'),
('Serpiente', 'serpiente'),
('selva', 'selva'),
('Sue�o', 'sueno'),
('Sombrero', 'sombrero'),

-- T (5 palabras para completar a 100)
('Tigre', 'tigre'),
('Tel�fono', 'telefono'),
('Tenedor', 'tenedor'),
('Tomate', 'tomate'),
('Tortuga', 'tortuga'),

-- U (4 palabras para completar a 100)
('Unicornio', 'unicornio'),
('Universo', 'universo'),
('Umbral', 'umbral'),
('Uni�n', 'union'),

-- V (5 palabras para completar a 100)
('Ventana', 'ventana'),
('Viol�n', 'violin'),
('Viaje', 'viaje'),
('Viento', 'viento'),
('Volc�n', 'volcan'),

-- W (3 palabras)
('Waffle', 'waffle'),
('Whisky', 'whisky'),
('Webcam', 'webcam'),

-- X (3 palabras)
('Xil�fono', 'xilofono'),
('Xilograf�a', 'xilografia'),
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
