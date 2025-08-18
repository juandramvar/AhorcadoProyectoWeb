--------------------------------------------------------------------
# AhorcadoProyectoWeb
--------------------------------------------------------------------
# NOMBRES / CARNÉ DE LOS INTEGRANTES
Juan Diego Ramírez Vargas
FH22011760

Alexander Sojo Jiménez
FI23030406

--------------------------------------------------------------------
# USUARIOS / CORREO UTILIZADOS EN GITHUB
User: juandramvar
Email: juandramvar@gmail.com

User: AlexanderSojoJ
Email: alesojojimes@gmail.com

--------------------------------------------------------------------
# IMAGEN / DIAGRAMA DE TABLAS CREADAS
Link: (editar después al subir la imagen)

--------------------------------------------------------------------
# REFERENCIAS Y PROMPTS RESUMIDOS UTILIZADOS EN EL PROYECTO
# REFERENCIAS

Entity Framework 6 – Database First (EDMX) – guía oficial para invertir el modelo desde una BD existente.
https://learn.microsoft.com/en-us/ef/ef6/modeling/designer/workflows/database-first 
Microsoft Learn

SQL Server – Collations & Unicode (reglas de comparación/sort, uso de CI_AI para “case/accent insensitive”).
https://learn.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support 
Microsoft Learn

Tokens anti-CSRF en MVC (@Html.AntiForgeryToken() + [ValidateAntiForgeryToken]).
Regla de seguridad (CA5391): https://learn.microsoft.com/en-us/dotnet/fundamentals/code-analysis/quality-rules/ca5391 
Microsoft Learn

Artículo histórico (MVC clásico): https://blog.stevensanderson.com/2008/09/01/prevent-cross-site-request-forgery-csrf-using-aspnet-mvcs-antiforgerytoken-helper/ 
Steve Sanderson's Blog

Mermaid – Entity Relationship Diagram.
https://mermaid.js.org/syntax/entityRelationshipDiagram.html 
Mermaid

Bootstrap – Botones (estilos, tamaños, disabled).
v5.3: https://getbootstrap.com/docs/5.3/components/buttons/ 
Bootstrap

.gitignore para Visual Studio (plantilla oficial de GitHub).
https://github.com/github/gitignore/blob/main/VisualStudio.gitignore 
GitHub

# PROMPTS DE INTELIGENCIA ARTIFICIAL (resumen)

(1) Lógica de partida (timer, intentos, teclado, mayúsculas)

Entrada: “Al jugar: seleccionar palabra aleatoria de la BD, mostrar guiones, botones A-Z (incluye Ñ), 5 fallos, contador regresivo según dificultad; mostrar letras y palabra en MAYÚSCULAS; al finalizar, guardar puntos.”
Salida (resumen): JuegoController.Partida/Adivinar/Rendirse/NuevoIntento/FinalizarPartida, selección aleatoria SELECT TOP 1 ... ORDER BY NEWID() y marca Disponible=0, normalización de tildes (ñ ≠ n), cálculo de puntos, sesión para reintentos; vistas Partida.cshtml y FinalizarPartida.cshtml.

(2) Timeout que dispara POST a Rendirse

Entrada: “Al llegar el timer a 0 aparece error en /Juego/Rendirse.”
Salida (resumen): Form oculto real con @Html.AntiForgeryToken() y JS que hace form.submit() al llegar a 0; sin botones extra durante la partida (solo “Nuevo intento”).

(3) Teclado estilizado

Entrada: “Mejorar el diseño del teclado de letras (más grande/bonito) sin tocar la lógica.”
Salida (resumen): Estilos CSS (gradiente, sombras, radio 12px), clases .btn-letter, filas centradas; disabled en gris con :disabled.

(4) Git: ignorar .vs/, bin/, obj y error ‘Permission denied’

Entrada: “No me deja hacer commit/push por archivos .vsidx bloqueados.”
Salida (resumen): Crear .gitignore con .vs/, [Bb]in/, [Oo]bj]/; git rm -r --cached .vs bin obj y nuevo commit; explicación de por qué .vs/ no debe versionarse.

(5) Pantalla de Inicio minimalista

Entrada: “Reemplazar la Home por una tarjeta con acciones (Jugar, Usuario, Escalafón, Diccionario).”
Salida (resumen): Views/Home/Index.cshtml con tarjetas y botones, estilos suaves; limpieza de About.cshtml y Contact.cshtml (plantilla).

(6) Normalización de mayúsculas y tildes

Entrada: “En el juego y mensaje final quiero la palabra toda en MAYÚSCULAS, pero que las comparaciones sigan siendo acento-insensibles.”
Salida (resumen): Tablero y mensajes usan ToUpperInvariant() para mostrar; comparación con función Fold (vocales sin acento, preservando ñ).
