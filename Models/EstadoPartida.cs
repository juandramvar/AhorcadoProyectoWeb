using System;
using System.Collections.Generic;

namespace AhorcadoProyectoWeb.Models
{
    [Serializable]
    public class EstadoPartida
    {
        public int UsuarioId { get; set; }
        public int IdPalabra { get; set; }
        public string PalabraTexto { get; set; }   // con tildes/ñ para mostrar
        public string PalabraCanon { get; set; }   // minúsculas para comparar
        public Dificultad Dificultad { get; set; }

        public HashSet<char> LetrasProbadas { get; set; } = new HashSet<char>();
        public int Errores { get; set; } = 0;
        public int MaxFallos { get; set; } = 6;    // clásico ahorcado
        public int TiempoSegundos { get; set; }    // 90 / 60 / 30
        public DateTime Inicio { get; set; } = DateTime.UtcNow;
    }
}
