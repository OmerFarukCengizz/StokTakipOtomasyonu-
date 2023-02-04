using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    public class FirmalarController : Controller
    {
        // GET: Firmalar
        stokEntities1 db = new stokEntities1();
        public ActionResult Index()
        {
            var degerler = db.Firmalar.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult Ekleme()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Ekleme(Firmalar p1)
        {
            db.Firmalar.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var frmlr = db.Firmalar.Find(id);
            db.Firmalar.Remove(frmlr);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Güncelle(int id)
        {
            var frml = db.Firmalar.Find(id);
            return View("Güncelle", frml);
        }
        public ActionResult Guncel(Firmalar p1)
        {
            var f = db.Firmalar.Find(p1.Firma_ID);
            f.Firma_Ad = p1.Firma_Ad;
            f.Firma_Alacak=p1.Firma_Alacak;
            f.Firma_Verecek=p1.Firma_Verecek;
            f.Firma_indirim=p1.Firma_indirim;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}