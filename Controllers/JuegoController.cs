using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Data.Entity;
using System.Text;
using System.Text.RegularExpressions;
using System.Globalization;
using AhorcadoProyectoWeb.Models;
using AhorcadoProyectoWeb.Views.Home;

namespace AhorcadoProyectoWeb.Controllers
{
    public class JuegoController : Controller
    {
        private const string SesionClave = "EstadoPartida";
        private const string SesionUltUser = "UltimoUsuarioId";
        private const string SesionUltDif = "UltimaDificultad";
        private const int MAX_FALLOS = 5;  // regla: 5 intentos

        // ------------------ Inicio de juego (dropdowns) ------------------

        [HttpGet]
        public ActionResult IniciarJuego()
        {
            var vm = new JuegoViewModel
            {
                Usuarios = GetUsuariosDesdeBD(),
                Dificultades = GetDificultadesList()
            };
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult IniciarJuego(JuegoViewModel vm)
        {
            if (vm.SelectedUsuarioId == null)
                ModelState.AddModelError("SelectedUsuarioId", "Seleccione un usuario.");
            if (vm.SelectedDificultad == null)
                ModelState.AddModelError("SelectedDificultad", "Seleccione la dificultad.");

            if (!ModelState.IsValid)
            {
                vm.Usuarios = GetUsuariosDesdeBD();
                vm.Dificultades = GetDificultadesList();
                return View(vm);
            }

            return RedirectToAction("Partida", new
            {
                usuarioId = vm.SelectedUsuarioId.Value,
                dificultad = (int)vm.SelectedDificultad.Value
            });
        }

        // ------------------ Partida / Lógica del juego ------------------

        [HttpGet]
        public ActionResult Partida(int usuarioId, int dificultad)
        {
            // Nuevo juego: crea estado, elige palabra disponible y la marca como usada
            var estado = CrearEstadoPartida(usuarioId, (Dificultad)dificultad);
            Session[SesionClave] = estado;

            // guarda "últimos" para Nuevo Juego
            Session[SesionUltUser] = usuarioId;
            Session[SesionUltDif] = dificultad;

            var vm = ConstruirVM(estado);
            vm.UsuarioNombre = ObtenerNombreUsuario(usuarioId);
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Adivinar(string letra)
        {
            var estado = Session[SesionClave] as EstadoPartida;
            if (estado == null) return RedirectToAction("IniciarJuego");

            // Validar que sea UNA letra (admite tildes, ü y ñ)
            if (string.IsNullOrWhiteSpace(letra) || !Regex.IsMatch(letra, @"^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ]$"))
                return Redibujar(estado); // ignora entrada inválida

            // "Fold": case-insensitive + tildes-insensitive (pero Ñ ≠ N)
            var ch = Fold(letra[0]);

            if (!estado.LetrasProbadas.Contains(ch))
            {
                estado.LetrasProbadas.Add(ch);

                // compara contra palabra "plegada" (vocales sin tilde, pero Ñ preservada)
                var palabraFold = FoldString(estado.PalabraCanon);
                if (!palabraFold.Contains(ch))
                    estado.Errores++;
            }

            if (PalabraResuelta(estado)) return FinalizarYGuardar(estado, true);
            if (estado.Errores >= estado.MaxFallos) return FinalizarYGuardar(estado, false);
            if (TiempoAgotado(estado)) return FinalizarYGuardar(estado, false);

            return Redibujar(estado);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Rendirse()
        {
            var estado = Session[SesionClave] as EstadoPartida;
            if (estado == null) return RedirectToAction("IniciarJuego");
            return FinalizarYGuardar(estado, false);
        }

        // "Nuevo intento": si la partida no ha terminado, cuenta como pérdida y reinicia
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NuevoIntento()
        {
            var estado = Session[SesionClave] as EstadoPartida;

            int? uid = null, dif = null;
            if (estado != null)
            {
                uid = estado.UsuarioId;
                dif = (int)estado.Dificultad;
                // finalizar como derrota
                FinalizarYGuardar(estado, false);
            }
            else
            {
                uid = Session[SesionUltUser] as int?;
                dif = Session[SesionUltDif] as int?;
            }

            if (uid == null || dif == null)
                return RedirectToAction("IniciarJuego");

            return RedirectToAction("Partida", new { usuarioId = uid.Value, dificultad = dif.Value });
        }

        [HttpGet]
        public ActionResult FinalizarPartida()
        {
            // expone últimos para el botón "Nuevo juego" en resultado
            ViewBag.UltUsuarioId = Session[SesionUltUser] as int?;
            ViewBag.UltDificultad = Session[SesionUltDif] as int?;
            return View();
        }

        // ------------------ Helpers de juego ------------------

        private EstadoPartida CrearEstadoPartida(int usuarioId, Dificultad dif)
        {
            int tiempo = dif == Dificultad.Facil ? 90 : dif == Dificultad.Normal ? 60 : 30;

            using (var db = new AhorcadoEntities())
            {
                // palabra aleatoria disponible
                var idPal = db.Database.SqlQuery<int>(
                    "SELECT TOP 1 IdPalabra FROM dbo.Palabra WHERE Disponible = 1 ORDER BY NEWID()"
                ).FirstOrDefault();

                if (idPal == 0)
                    throw new InvalidOperationException("No hay palabras disponibles. Agregue más palabras.");

                // marcar como usada
                db.Database.ExecuteSqlCommand(
                    "UPDATE dbo.Palabra SET Disponible = 0 WHERE IdPalabra = @p0", idPal);

                var palabra = db.Palabra.First(p => p.IdPalabra == idPal);

                return new EstadoPartida
                {
                    UsuarioId = usuarioId,
                    IdPalabra = palabra.IdPalabra,
                    PalabraTexto = palabra.Texto,   // con tildes para mostrar (mostramos en MAYÚSCULAS)
                    PalabraCanon = palabra.Canon,   // minúsculas (guardar)
                    Dificultad = dif,
                    MaxFallos = MAX_FALLOS,
                    TiempoSegundos = tiempo,
                    Inicio = DateTime.UtcNow
                };
            }
        }

        private PartidaViewModel ConstruirVM(EstadoPartida e)
        {
            // Muestra letras reveladas en MAYÚSCULAS (incluye tildes/Ñ)
            var oculta = string.Join(" ", e.PalabraTexto
                .ToCharArray()
                .Select(c => e.LetrasProbadas.Contains(Fold(c))
                    ? char.ToUpperInvariant(c).ToString()
                    : "_"));

            // segundos restantes (evita reinicio del timer)
            var trans = (int)(DateTime.UtcNow - e.Inicio).TotalSeconds;
            var restantes = Math.Max(0, e.TiempoSegundos - trans);

            var letrasOrden = e.LetrasProbadas.OrderBy(x => x).ToArray();

            return new PartidaViewModel
            {
                UsuarioId = e.UsuarioId,
                Dificultad = e.Dificultad,
                TiempoSegundos = e.TiempoSegundos,
                SegundosRestantes = restantes,
                PuntosVictoria = PuntosBase(e.Dificultad),
                PuntosDerrota = -PuntosBase(e.Dificultad),

                // tablero en mayúsculas
                PalabraOculta = oculta,

                // letras probadas visibles en mayúsculas (solo para la etiqueta)
                LetrasProbadas = string.Join(", ", letrasOrden.Select(ch => ch.ToString().ToUpperInvariant())),
                LetrasProbadasCompact = new string(letrasOrden),  // en minúsculas para deshabilitar botones

                IntentosFallidos = e.Errores,
                MaxFallos = e.MaxFallos
            };
        }

        private bool PalabraResuelta(EstadoPartida e)
        {
            foreach (var c in e.PalabraCanon) // minúsculas
            {
                var f = Fold(c);  // vocales sin tilde, Ñ preservada
                if (!e.LetrasProbadas.Contains(f)) return false;
            }
            return true;
        }

        private bool TiempoAgotado(EstadoPartida e)
        {
            var trans = (int)(DateTime.UtcNow - e.Inicio).TotalSeconds;
            return trans >= e.TiempoSegundos;
        }

        private int PuntosBase(Dificultad d)
            => d == Dificultad.Facil ? 1 : d == Dificultad.Normal ? 2 : 3;

        private string ObtenerNombreUsuario(int id)
        {
            using (var db = new AhorcadoEntities())
                return db.Usuario.Where(u => u.IdUsuario == id)
                                 .Select(u => u.Nombre)
                                 .FirstOrDefault() ?? $"Usuario {id}";
        }

        private ActionResult Redibujar(EstadoPartida estado)
        {
            var vm = ConstruirVM(estado);
            vm.UsuarioNombre = ObtenerNombreUsuario(estado.UsuarioId);
            return View("Partida", vm);
        }

        private ActionResult FinalizarYGuardar(EstadoPartida estado, bool gano)
        {
            var puntos = gano ? PuntosBase(estado.Dificultad) : -PuntosBase(estado.Dificultad);

            using (var db = new AhorcadoEntities())
            {
                db.Partida.Add(new Partida
                {
                    IdUsuario = estado.UsuarioId,
                    IdPalabra = estado.IdPalabra,
                    Dificultad = (byte)estado.Dificultad,
                    Gano = gano,
                    Puntos = puntos,
                    FechaHora = DateTime.Now
                });
                db.SaveChanges();
            }

            // limpiar estado y preparar "Nuevo juego"
            Session.Remove(SesionClave);
            Session[SesionUltUser] = estado.UsuarioId;
            Session[SesionUltDif] = (int)estado.Dificultad;

            // palabra en MAYÚSCULAS en el resultado
            var palabraMayus = estado.PalabraTexto.ToUpperInvariant();

            TempData["JuegoOk"] = gano
                ? $"¡Ganaste! Palabra: {palabraMayus}. +{puntos} punto(s)."
                : $"Perdiste. La palabra era: {palabraMayus}. {puntos} punto(s).";

            return RedirectToAction("FinalizarPartida");
        }

        // ------------------ Normalización (vocales sin tilde, Ñ preservada) ------------------

        private static char Fold(char c)
        {
            c = char.ToLowerInvariant(c);
            switch (c)
            {
                case 'á': case 'à': case 'ä': case 'â': case 'ã': return 'a';
                case 'é': case 'è': case 'ë': case 'ê': return 'e';
                case 'í': case 'ì': case 'ï': case 'î': return 'i';
                case 'ó': case 'ò': case 'ö': case 'ô': case 'õ': return 'o';
                case 'ú': case 'ù': case 'ü': case 'û': return 'u';
                case 'ñ': return 'ñ'; // ñ se mantiene distinta a n
                default: return c;
            }
        }

        private static string FoldString(string s)
        {
            if (string.IsNullOrEmpty(s)) return s;
            var arr = s.ToCharArray().Select(Fold).ToArray();
            return new string(arr);
        }

        // ------------------ Listas auxiliares UI ------------------

        private IEnumerable<SelectListItem> GetUsuariosDesdeBD()
        {
            using (var db = new AhorcadoEntities())
            {
                var items = db.Usuario
                              .OrderBy(u => u.Nombre)
                              .Select(u => new SelectListItem
                              {
                                  Value = u.IdUsuario.ToString(),
                                  Text = (u.Cedula ?? "") + " - " + u.Nombre  // "Cédula - Nombre"
                              })
                              .ToList();

                items.Insert(0, new SelectListItem { Value = "", Text = "— Seleccione —" });
                return items;
            }
        }

        private IEnumerable<SelectListItem> GetDificultadesList() => new[]
        {
            new SelectListItem { Value = "", Text = "— Seleccione —" },
            new SelectListItem { Value = "1", Text = "Fácil" },
            new SelectListItem { Value = "2", Text = "Normal" },
            new SelectListItem { Value = "3", Text = "Difícil" }
        };
    }
}
