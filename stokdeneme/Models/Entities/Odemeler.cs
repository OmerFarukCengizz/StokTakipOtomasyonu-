//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace stokdeneme.Models.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Odemeler
    {
        public int Odeme_ID { get; set; }
        public int Firma_ID { get; set; }
        public Nullable<decimal> Odenen_tutar { get; set; }
        public string Odeme_kod { get; set; }
        public Nullable<System.DateTime> Odeme_tarih { get; set; }
    }
}