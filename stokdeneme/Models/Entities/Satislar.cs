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
    
    public partial class Satislar
    {
        public int Satis_ID { get; set; }
        public Nullable<int> Firma_ID { get; set; }
        public Nullable<decimal> Satis_Tutar { get; set; }
        public Nullable<decimal> Odenen_Tutar { get; set; }
        public string Odeme_Tipi { get; set; }
        public Nullable<System.DateTime> Tarih { get; set; }
    }
}
