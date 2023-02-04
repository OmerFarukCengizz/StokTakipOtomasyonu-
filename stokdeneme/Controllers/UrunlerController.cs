using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    public class UrunlerController : Controller
    {
        // GET: Urunler
        stokEntities1 db = new stokEntities1();
        public ActionResult Index(string ara,int sayfa=1)
        {        
            List<Urunler> degerler = db.Urunler.ToList();     
            return View(db.Urunler.Where(s => s.Urun_Ad.ToLower().Contains(ara)||ara==null).ToList().ToPagedList(sayfa,15));
        }
        [HttpGet]
        public ActionResult Ekleme()
        {
            List<SelectListItem> firmas = (from x in db.Firmalar.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.Firma_Ad,
                                                 Value = x.Firma_ID.ToString(),
                                             }).ToList();
            ViewBag.frms = firmas;
            List<SelectListItem> degerler = (from i in db.kategoriler.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.Kategori_ad,
                                                Value = i.Kategori_ID.ToString(),
                                          }) .ToList();
            ViewBag.dgr=degerler;
            List<SelectListItem> marks = (from n in db.Markalar.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = n.Marka_Isim,
                                                 Value = n.Marka_ID.ToString(),
                                             }).ToList();
            ViewBag.mrklr = marks;
            return View(); 
        }
        [HttpPost]
        public ActionResult Ekleme(Urunler p1)
        {
            var fr = db.Firmalar.Where(m => m.  Firma_ID == p1. Firmalar.Firma_ID).FirstOrDefault();
            p1.Firmalar = fr;
            var ktg = db.kategoriler.Where(m => m.Kategori_ID == p1.kategoriler.Kategori_ID).FirstOrDefault();
            p1.kategoriler = ktg;
            var mrk = db.Markalar.Where(m => m.Marka_ID == p1.Markalar.Marka_ID).FirstOrDefault();
            p1.Markalar = mrk;
            db.Urunler.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var urnler = db.Urunler.Find(id);
            db.Urunler.Remove(urnler);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Güncelle(int id)
        {
            var ur = db.Urunler.Find(id);
            List<SelectListItem> firmas = (from x in db.Firmalar.ToList()
                                           select new SelectListItem
                                           {
                                               Text = x.Firma_Ad,
                                               Value = x.Firma_ID.ToString(),
                                           }).ToList();
            ViewBag.frms = firmas;
            List<SelectListItem> degerler = (from i in db.kategoriler.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.Kategori_ad,
                                                 Value = i.Kategori_ID.ToString(),
                                             }).ToList();
            ViewBag.dgr = degerler;
            List<SelectListItem> marks = (from n in db.Markalar.ToList()
                                          select new SelectListItem
                                          {
                                              Text = n.Marka_Isim,
                                              Value = n.Marka_ID.ToString(),
                                          }).ToList();
            ViewBag.mrklr = marks;
            return View("Güncelle", ur);
        }
        public ActionResult Guncel(Urunler p1)
        {
            var u = db.Urunler.Find(p1.Urun_ID);
            u.Barkod_no = p1.Barkod_no;
            u.Urun_Ad= p1.Urun_Ad;
            var fr = db.Firmalar.Where(m => m.Firma_ID == p1.Firmalar.Firma_ID).FirstOrDefault();
            u.Firma_ID = fr.Firma_ID;
            //  u.Marka_ID= p1.Marka_ID;
            var mrk = db.Markalar.Where(m => m.Marka_ID == p1.Markalar.Marka_ID).FirstOrDefault();
            u.Marka_ID = mrk.Marka_ID;
            // u.Kategori_ID= p1.Kategori_ID;
            var ktg = db.kategoriler.Where(m => m.Kategori_ID == p1.kategoriler.Kategori_ID).FirstOrDefault();
            u.Kategori_ID = ktg.Kategori_ID;
            u.KDV_Haric_Fiyat = p1.KDV_Haric_Fiyat;
            u.KDV_ID= p1.KDV_ID;
            u.Yuzdelik_Kar=p1.Yuzdelik_Kar;
            u.Iskonto=p1.Iskonto;
            u.Stok=p1.Stok;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Urunlist(string ara)
        {
            
            return View(db.Urunler.Where(s => s.Urun_Ad.ToLower().Contains(ara) || ara == null).ToList());
        }
    }
}