//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Beta.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_cliente
    {
        public int idcliente { get; set; }
        public string nit { get; set; }
        public string nombrecliente { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public int idciudad { get; set; }
    
        public virtual tbl_cuidad tbl_cuidad { get; set; }
    }
}
