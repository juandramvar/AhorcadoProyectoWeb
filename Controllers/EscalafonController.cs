using System.Linq;
using System.Web.Mvc;
using System.Collections.Generic;
using AhorcadoProyectoWeb.Views.Home;
using AhorcadoProyectoWeb.Models;

namespace AhorcadoProyectoWeb.Controllers
{
    public class EscalafonController : Controller
    {
        [HttpGet]
        public ActionResult Index() => RedirectToAction("VerEscalafon");

        [HttpGet]
        public ActionResult VerEscalafon()
        {
            using (var db = new AhorcadoEntities())
            {
                // stats por usuario
                var stats = db.Partida
                              .GroupBy(p => p.IdUsuario)
                              .Select(g => new
                              {
                                  IdUsuario = g.Key,
                                  Marcador = g.Sum(x => x.Puntos),
                                  Ganadas = g.Sum(x => x.Gano ? 1 : 0),
                                  Perdidas = g.Sum(x => x.Gano ? 0 : 1)
                              })
                              .ToList();

                // LEFT JOIN con usuarios para incluir también quienes aún no jugaron
                var datos = (from u in db.Usuario.ToList()
                             join s in stats on u.IdUsuario equals s.IdUsuario into gj
                             from s in gj.DefaultIfEmpty()
                             select new EscalafonItem
                             {
                                 Cedula = u.Cedula,
                                 Nombre = u.Nombre,
                                 Marcador = s?.Marcador ?? 0,
                                 Ganadas = s?.Ganadas ?? 0,
                                 Perdidas = s?.Perdidas ?? 0
                             })
                             .OrderByDescending(x => x.Marcador)
                             .ThenBy(x => x.Nombre)
                             .ToList();

                return View(datos);
            }
        }
    }
}
