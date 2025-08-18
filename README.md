# AhorcadoProyectoWeb / GRUPO 8

## NOMBRES / CARNÉ / USUARIO Y CORREO DE LOS INTEGRANTES

**Nombre:** Juan Diego Ramírez Vargas  
**Carné:** FH22011760  
**User:** juandramvar  
**Email:** juandramvar@gmail.com

**Nombre:** Alexander Sojo Jiménez  
**Carné:** FI23030406  
**User:** AlexanderSojoJ  
**Email:** alesojojimes@gmail.com


## IMAGEN / DIAGRAMA DE TABLAS CREADAS
**Link:** _(editar después al subir la imagen)_


## REFERENCIAS

- **Entity Framework 6 – Database First (EDMX)** – guía oficial para invertir el modelo desde una BD existente.  
  https://learn.microsoft.com/en-us/ef/ef6/modeling/designer/workflows/database-first  _(Microsoft Learn)_

- **SQL Server – Collations & Unicode** (reglas de comparación/sort, uso de **CI_AI** para “case/accent insensitive”).  
  https://learn.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support  _(Microsoft Learn)_

- **Tokens anti-CSRF en MVC** (`@Html.AntiForgeryToken()` + `[ValidateAntiForgeryToken]`).  
  Regla de seguridad (CA5391): https://learn.microsoft.com/en-us/dotnet/fundamentals/code-analysis/quality-rules/ca5391  _(Microsoft Learn)_  
  Artículo histórico (MVC clásico): https://blog.stevensanderson.com/2008/09/01/prevent-cross-site-request-forgery-csrf-using-aspnet-mvcs-antiforgerytoken-helper/  _(Steve Sanderson’s Blog)_

- **Mermaid – Entity Relationship Diagram (ERD)**.  
  https://mermaid.js.org/syntax/entityRelationshipDiagram.html  _(Mermaid)_

- **Bootstrap – Botones** (estilos, tamaños, disabled).  
  v5.3: https://getbootstrap.com/docs/5.3/components/buttons/  _(Bootstrap)_

- **.gitignore para Visual Studio** (plantilla oficial).  
  https://github.com/github/gitignore/blob/main/VisualStudio.gitignore  _(GitHub)_


## PROMPTS DE INTELIGENCIA ARTIFICIAL (resumen)

**(1) Lógica de partida (timer, intentos, teclado, mayúsculas)**  
**Entrada:** “Al jugar: seleccionar palabra aleatoria de la BD, mostrar guiones, botones A-Z (incluye Ñ), 5 fallos, contador regresivo según dificultad; mostrar letras y palabra en MAYÚSCULAS; al finalizar, guardar puntos.”  
**Salida (resumen):** `JuegoController.Partida/Adivinar/Rendirse/NuevoIntento/FinalizarPartida`, selección aleatoria `SELECT TOP 1 ... ORDER BY NEWID()` y marca `Disponible=0`, normalización de tildes (ñ ≠ n), cálculo de puntos, sesión para reintentos; vistas `Partida.cshtml` y `FinalizarPartida.cshtml`.

**(2) Timeout que dispara POST a `Rendirse`**  
**Entrada:** “Al llegar el timer a 0 aparece error en `/Juego/Rendirse`.”  
**Salida (resumen):** Form **oculto real** con `@Html.AntiForgeryToken()` y JS que hace `form.submit()` al llegar a 0; sin botones extra durante la partida (solo “Nuevo intento”).

**(3) Teclado estilizado**  
**Entrada:** “Mejorar el diseño del teclado de letras (más grande/bonito) sin tocar la lógica.”  
**Salida (resumen):** Estilos CSS (gradiente, sombras, radio 12px), clase `.btn-letter`, filas centradas; `:disabled` en gris.

**(4) Git: ignorar `.vs/`, `bin/`, `obj` y error ‘Permission denied’**  
**Entrada:** “No me deja hacer commit/push por archivos `.vsidx` bloqueados.”  
**Salida (resumen):** Crear `.gitignore` con `.vs/`, `[Bb]in/`, `[Oo]bj/`; `git rm -r --cached .vs bin obj` y nuevo commit; explicación de por qué `.vs/` no debe versionarse.

**(5) Pantalla de Inicio minimalista**  
**Entrada:** “Reemplazar la Home por una tarjeta con acciones (Jugar, Usuario, Escalafón, Diccionario).”  
**Salida (resumen):** `Views/Home/Index.cshtml` con tarjetas y botones, estilos suaves; limpieza de `About.cshtml` y `Contact.cshtml` (plantilla).

**(6) Normalización de mayúsculas y tildes**  
**Entrada:** “En el juego y mensaje final quiero la palabra toda en MAYÚSCULAS, pero que las comparaciones sigan siendo acento-insensibles.”  
**Salida (resumen):** Tablero y mensajes usan `ToUpperInvariant()` para mostrar; comparación con función `Fold` (vocales sin acento, preservando `ñ`).
