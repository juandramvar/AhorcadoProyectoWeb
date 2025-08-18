namespace AhorcadoProyectoWeb.Models
{
    public class PartidaViewModel
    {
        public int UsuarioId { get; set; }
        public string UsuarioNombre { get; set; }

        public Dificultad Dificultad { get; set; }
        public int TiempoSegundos { get; set; }      // total según dificultad
        public int SegundosRestantes { get; set; }   // lo que falta ahora

        public int PuntosVictoria { get; set; }
        public int PuntosDerrota { get; set; }

        // Estado visible del juego
        public string PalabraOculta { get; set; }         // ej: _ R _ B O L (en mayúsculas)
        public string LetrasProbadas { get; set; }        // "A, E, I, O, U"
        public string LetrasProbadasCompact { get; set; } // "aeiouñ" (para deshabilitar botones)
        public int IntentosFallidos { get; set; }
        public int MaxFallos { get; set; }
    }
}
