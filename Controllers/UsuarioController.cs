using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using System.Linq;
using System.Data.Entity;
using AhorcadoProyectoWeb.Views.Home; // EDMX real: AhorcadoEntities, Usuario

namespace AhorcadoProyectoWeb.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: /Usuario/RegistrarUsuario
        [HttpGet]
        public ActionResult RegistrarUsuario()
        {
            return View();
        }

        // POST: /Usuario/RegistrarUsuario
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RegistrarUsuario(string cedula, string nombre)
        {
            // ----- Normalización y limpieza -----
            var cedulaRaw = (cedula ?? "").Trim();
            var nombreRaw = (nombre ?? "").Trim();

            // Deja solo dígitos en cédula (el usuario puede escribir con guiones/espacios)
            var cedulaLimpia = Regex.Replace(cedulaRaw, @"\D", ""); // quita todo lo no-dígito

            // Normaliza nombre (tildes) y colapsa espacios
            var nombreNorm = nombreRaw.Normalize(NormalizationForm.FormC);
            nombreNorm = Regex.Replace(nombreNorm, @"\s+", " ").Trim();

            // Capitalización
            if (!string.IsNullOrEmpty(nombreNorm))
            {
                var ti = CultureInfo.CurrentCulture.TextInfo;
                nombreNorm = ti.ToTitleCase(nombreNorm.ToLower());
            }

            // ----- Validaciones -----
            if (string.IsNullOrWhiteSpace(cedulaRaw))
                ModelState.AddModelError("cedula", "Ingrese la cédula.");

            if (string.IsNullOrWhiteSpace(nombreRaw))
                ModelState.AddModelError("nombre", "Ingrese el nombre.");

            // cédula: 9 a 12 dígitos
            if (!string.IsNullOrEmpty(cedulaLimpia) && !Regex.IsMatch(cedulaLimpia, @"^\d{9,12}$"))
                ModelState.AddModelError("cedula", "La cédula debe contener solo dígitos (9–12).");

            // nombre: solo letras y espacios (admite tildes/ñ), 2–50
            if (!string.IsNullOrEmpty(nombreNorm) && !Regex.IsMatch(nombreNorm, @"^[A-Za-zÀ-ÿÑñ\s]{2,50}$"))
                ModelState.AddModelError("nombre", "El nombre solo admite letras y espacios (2–50).");

            if (!ModelState.IsValid)
            {
                ViewData["cedula"] = cedulaLimpia;
                ViewData["nombre"] = nombreNorm;
                return View();
            }

            // ----- Guardado real en BD -----
            using (var db = new AhorcadoEntities())
            {
                // Duplicado por cédula
                bool existe = db.Usuario.Any(u => u.Cedula == cedulaLimpia);
                if (existe)
                {
                    ModelState.AddModelError("cedula", "Ya existe un usuario con esa cédula.");
                    ViewData["cedula"] = cedulaLimpia;
                    ViewData["nombre"] = nombreNorm;
                    return View();
                }

                db.Usuario.Add(new Usuario
                {
                    Cedula = cedulaLimpia,
                    Nombre = nombreNorm
                });
                db.SaveChanges();
            }

            TempData["UsuarioOk"] = $"Usuario “{nombreNorm}” con cédula {cedulaLimpia} registrado correctamente.";
            return RedirectToAction("RegistrarUsuario");
        }
    }
}
