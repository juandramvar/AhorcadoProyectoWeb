using System.Collections.Generic;

namespace AhorcadoProyectoWeb.Models
{
    public class LetraCount
    {
        public string Letra { get; set; }
        public int Cantidad { get; set; }
        public bool Cumple { get; set; }
    }

    public class DiccionarioEstadoViewModel
    {
        public int TotalPalabras { get; set; }

        public int ConTilde { get; set; }
        public double PorcentajeTilde { get; set; }
        public bool CumpleTilde { get; set; }

        public List<LetraCount> Letras { get; set; }
        public bool CumpleMinimoPorLetra { get; set; }

        public bool CaseInsensitiveOK { get; set; }

        public bool TodoOk => CumpleTilde && CumpleMinimoPorLetra && CaseInsensitiveOK;
    }
}
