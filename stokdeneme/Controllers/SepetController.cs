using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    [Authorize]
    public class SepetController : Controller
    {
        // GET: Sepet
        stokEntities1 db = new stokEntities1();
        public ActionResult Index(decimal? TUTAR)
        {
            if (User.Identity.IsAuthenticated)
            {
                var kullaniciadi = User.Identity.Name;
                var kullanici=db.Kullanicilar.FirstOrDefault(x=>x.Kullaniciadi==kullaniciadi);
                var model = db.Sepet.Where(x => x.KullaniciID == kullanici.KullaniciID).ToList();
                var kid = db.Sepet.FirstOrDefault(x=>x.KullaniciID==kullanici.KullaniciID);

                if (model != null)
                {
                    if (kid == null)
                    {
                        ViewBag.TUTAR = "Sepetinizde ürün bulunmuyor";
                    }
                    else if (kid != null)
                    {
                        TUTAR = db.Sepet.Sum(x => x.Toplam_fiyat);
                        ViewBag.TUTAR = TUTAR + "TL";
                    }
                }
                
                return View(model);
            }
            return HttpNotFound();
        }
        public ActionResult SepeteEkle(int id)
        {
            if (User.Identity.IsAuthenticated)
            {
                var kullaniciadi = User.Identity.Name;
                var model = db.Kullanicilar.FirstOrDefault(x => x.Kullaniciadi == kullaniciadi);
                var u = db.Urunler.Find(id);
                var sepet = db.Sepet.FirstOrDefault(x=>x.KullaniciID==model.KullaniciID && x.Urun_ID == id);
                if (model != null) 
                { 
                if (sepet != null)
                {
                    sepet.Urun_Miktar++;
                    sepet.Toplam_fiyat = sepet.Urun_Miktar * sepet.KDVsiz_fiyat;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                    var s = new Sepet
                    {
                    KullaniciID = model.KullaniciID,
                    Urun_ID = u.Urun_ID,
                    Urun_Miktar = 1,
                    KDVsiz_fiyat = u.KDV_Haric_Fiyat,
                    Toplam_fiyat = u.KDV_Haric_Fiyat,
                    Firma_ID = u.Firma_ID,
                    KDV_ID= u.KDV_ID,
                    Tarih = DateTime.Now,
                };
                db.Entry(s).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return RedirectToAction("Index");
                }
            }
            return HttpNotFound();
        }
        public ActionResult TotalCount(int? count)
        {
            if (User.Identity.IsAuthenticated)
            {
                var model=db.Kullanicilar.FirstOrDefault(x=>x.Kullaniciadi==User.Identity.Name);
                count=db.Sepet.Where(x=>x.KullaniciID==model.KullaniciID).Count();
                ViewBag.count = count;
                if (count == 0)
                {
                    ViewBag.count = "";
                }
                return PartialView();
            }
            return HttpNotFound();
        }
        public ActionResult Arttir(int id)
        {
            var model = db.Sepet.Find(id);
            model.Urun_Miktar++;
            model.Toplam_fiyat = model.KDVsiz_fiyat * model.Urun_Miktar;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Azalt(int id)
        {
            var model = db.Sepet.Find(id);
            if (model.Urun_Miktar == 1)
            {
                db.Sepet.Remove(model);
                db.SaveChanges();
            }
            model.Urun_Miktar--;
            model.Toplam_fiyat = model.KDVsiz_fiyat * model.Urun_Miktar;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil(int id)
        {
            var model=db.Sepet.Find(id);
            db.Sepet.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
        
}