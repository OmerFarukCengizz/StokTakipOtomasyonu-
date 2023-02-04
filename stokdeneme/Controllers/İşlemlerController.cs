using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stokdeneme.Models.Entities;
namespace stokdeneme.Controllers
{
    [Authorize]
    public class İşlemlerController : Controller
    {
        // GET: İşlemler
        stokEntities1 db = new stokEntities1();
        public ActionResult Siparis()
        {
            var degerler=db.Firmalar.ToList();
            return View(degerler);
        }
        public ActionResult SiparisBilgi(int id,string ara)
        {
          
            var model=db.Urunler.Where(x => x.Firmalar.Firma_ID == id).ToList();
            
            var firma=db.Firmalar.Where(x=>x.Firma_ID==id).Select(x=>x.Firma_Ad).FirstOrDefault();
            ViewBag.viewfirma = firma;
            if (!string.IsNullOrEmpty(ara))
            {
                model=model.Where(x=>x.Urun_Ad.ToLower().Contains(ara)).ToList();  
            }
            return View(model);
        }
     
    }
}