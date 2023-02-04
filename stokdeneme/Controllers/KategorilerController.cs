using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    public class KategorilerController : Controller
    {
        // GET: Kategoriler
        stokEntities1 db = new stokEntities1();
        public ActionResult Index()
        {
            var degerler = db.kategoriler.ToList();
            return View(degerler);
        }
        [HttpGet]
        public ActionResult Ekleme()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Ekleme(kategoriler p1)
        {
            db.kategoriler.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var katgr = db.kategoriler.Find(id);
            db.kategoriler.Remove(katgr);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Güncelle(int id)
        {
            var ktgrlr = db.kategoriler.Find(id);
            return View("Güncelle", ktgrlr);
        }
        public ActionResult Guncel(kategoriler p1)
        {
            var k = db.kategoriler.Find(p1.Kategori_ID);
            k.Kategori_ad = p1.Kategori_ad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}