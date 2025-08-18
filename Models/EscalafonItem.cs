namespace AhorcadoProyectoWeb.Models
{
    public class EscalafonItem
    {
        public string Cedula { get; set; }
        public string Nombre { get; set; }
        public int Marcador { get; set; }   // suma de Puntos (±)
        public int Ganadas { get; set; }    // partidas con Gano = true
        public int Perdidas { get; set; }   // partidas con Gano = false
    }
}
