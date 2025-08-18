using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using System.Data.Entity;
using System.Globalization;
using AhorcadoProyectoWeb.Views.Home;
using AhorcadoProyectoWeb.Models;

namespace AhorcadoProyectoWeb.Controllers
{
    public class DiccionarioController : Controller
    {
        private const int MIN_LEN = 5;
        private const int MAX_LEN = 10;

        private static readonly Regex RegexLetrasEspanol =
            new Regex(@"^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ]+$", RegexOptions.Compiled);

        [HttpGet]
        public ActionResult AgregarPalabra() => View();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AgregarPalabra(string texto)
        {
            var entrada = (texto ?? "").Trim();
            if (string.IsNullOrWhiteSpace(entrada))
            {
                ModelState.AddModelError("texto", "Ingrese una palabra.");
                return View();
            }

            // Normaliza a FormC para consistencia de tildes
            var normalizada = entrada.Normalize(NormalizationForm.FormC);

            if (!RegexLetrasEspanol.IsMatch(normalizada))
            {
                ModelState.AddModelError("texto", "Solo letras (admite tildes, ü y ñ). Sin espacios ni símbolos.");
                return View();
            }

            if (normalizada.Length < MIN_LEN || normalizada.Length > MAX_LEN)
            {
                ModelState.AddModelError("texto", $"La palabra debe tener entre {MIN_LEN} y {MAX_LEN} letras.");
                return View();
            }

            // Canon en minúsculas; Texto en MAYÚSCULAS para mostrar/jugar
            var canonLower = normalizada.ToLowerInvariant();
            var textoUpper = normalizada.ToUpperInvariant();

            using (var db = new AhorcadoEntities())
            {
                // Duplicado acento-insensible (sin distinguir tildes)
                var yaExiste = db.Database
                    .SqlQuery<int>(
                        "SELECT COUNT(1) FROM dbo.Palabra WHERE Canon COLLATE Latin1_General_CI_AI = @p0",
                        canonLower
                    ).FirstOrDefault() > 0;

                if (yaExiste)
                {
                    ModelState.AddModelError("texto", "La palabra ya existe en el diccionario (sin distinguir tildes).");
                    return View();
                }

                db.Palabra.Add(new Palabra
                {
                    Texto = textoUpper,   // GUARDAMOS EN MAYÚSCULAS
                    Canon = canonLower
                });
                db.SaveChanges();
            }

            TempData["DiccionarioOk"] = $"Palabra “{textoUpper}” guardada correctamente.";
            return RedirectToAction("AgregarPalabra");
        }

        // ---------- Estado del diccionario ----------
        [HttpGet]
        public ActionResult Estado()
        {
            var m = CalcularEstadoDiccionario();
            return View(m);
        }

        private DiccionarioEstadoViewModel CalcularEstadoDiccionario()
        {
            var letras = "abcdefghijklmnñopqrstuvwxyz".ToCharArray();
            using (var db = new AhorcadoEntities())
            {
                var total = db.Palabra.Count();

                var porInicial = db.Palabra
                    .GroupBy(p => p.Canon.Substring(0, 1))
                    .Select(g => new { Inicial = g.Key, Cant = g.Count() })
                    .ToList();

                var lista = letras.Select(ch =>
                {
                    var key = ch.ToString();
                    var hit = porInicial.FirstOrDefault(x => x.Inicial == key);
                    var cant = hit?.Cant ?? 0;
                    return new LetraCount { Letra = key.ToUpper(), Cantidad = cant, Cumple = cant >= 3 };
                }).ToList();

                int conTilde = db.Palabra.Count(p =>
                    p.Canon.Contains("á") || p.Canon.Contains("é") ||
                    p.Canon.Contains("í") || p.Canon.Contains("ó") ||
                    p.Canon.Contains("ú"));

                double porcTilde = total == 0 ? 0.0 : (conTilde * 100.0 / total);

                return new DiccionarioEstadoViewModel
                {
                    TotalPalabras = total,
                    ConTilde = conTilde,
                    PorcentajeTilde = porcTilde,
                    CumpleTilde = conTilde * 2 >= total,
                    Letras = lista,
                    CumpleMinimoPorLetra = lista.All(x => x.Cumple),
                    CaseInsensitiveOK = true
                };
            }
        }
    }
}
