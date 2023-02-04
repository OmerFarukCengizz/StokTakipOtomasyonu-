using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    public class MarkalarController : Controller
    {
        // GET: Markalar
        stokEntities1 db = new stokEntities1();
        public ActionResult Index()
        {
            var degerler = db.Markalar.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult Ekleme()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Ekleme(Markalar p1)
        {
            db.Markalar.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var mark = db.Markalar.Find(id);
            db.Markalar.Remove(mark);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Güncelle(int id)
        {
            var mr = db.Markalar.Find(id);
            return View("Güncelle", mr);
        }
        public ActionResult Guncel(Markalar p2)
        {
            var m = db.Markalar.Find(p2.Marka_ID);
            m.Marka_Isim = p2.Marka_Isim;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}