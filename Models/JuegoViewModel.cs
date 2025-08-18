using System.Collections.Generic;
using System.Web.Mvc;

namespace AhorcadoProyectoWeb.Models
{
    public class JuegoViewModel
    {
        public int? SelectedUsuarioId { get; set; }
        public Dificultad? SelectedDificultad { get; set; }

        public IEnumerable<SelectListItem> Usuarios { get; set; }
        public IEnumerable<SelectListItem> Dificultades { get; set; }
    }
}
