using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using stokdeneme.Models.Entities;

namespace stokdeneme.Controllers
{
    public class DetayController : Controller
    {
        // GET: Detay
        stokEntities1 db = new stokEntities1();
        public ActionResult Index(int id)
        {
            var model = db.Siparis_Detay.Where(x=>x.Siparisler.Siparis_ID==id).ToList();
            var firma = db.Siparisler.Where(x => x.Siparis_ID == id).Select(x => x.Siparis_ID).FirstOrDefault();
            ViewBag.viewfirma = firma;
            return View(model);
        }
        public ActionResult Hepsinial(decimal? TUTAR)
        {
            if (User.Identity.IsAuthenticated)
            {
                var kullaniciadi = User.Identity.Name;
                var kullanici = db.Kullanicilar.FirstOrDefault(x => x.Kullaniciadi == kullaniciadi);
                var model = db.Sepet.Where(x => x.KullaniciID == kullanici.KullaniciID).ToList();
                var kid = db.Sepet.FirstOrDefault(x => x.KullaniciID == kullanici.KullaniciID);

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
        [HttpPost]
        public ActionResult Hepsinial2()
        {
            Random rand = new Random();
            int randum= rand.Next();
            var username=User.Identity.Name;
            var kullanici=db.Kullanicilar.FirstOrDefault(x=>x.Kullaniciadi==username);
            var model = db.Sepet.Where(x => x.KullaniciID == kullanici.KullaniciID).ToList();
            int row = 0;
            foreach(var item in model)
            {
                var siparis = new Siparis_Detay
                {
                    Sepet_ID= model[row].Sepet_ID,
                    Siparis_ID = randum,
                    KullaniciID =model[row].KullaniciID,
                    Urun_ID= model[row].Urun_ID,
                    KDV_ID = model[row].KDV_ID,
                    Urun_adet= model[row].Urun_Miktar,
                    KDVsiz_fiyat= model[row].KDVsiz_fiyat,
                    Firma_ID= model[row].Firma_ID,
                    Tarih= DateTime.Now,
                };
                db.Siparis_Detay.Add(siparis);
                row++;
            }
            foreach(var item in model)
            {
                var urun = db.Urunler.FirstOrDefault(x => x.Urun_ID == item.Urun_ID);
                if (urun != null)
                {
                    urun.Stok= (int)(urun.Stok+item.Urun_Miktar);
                }
            }
            db.Sepet.RemoveRange(model);
            db.SaveChanges();
            return RedirectToAction("Index", "Sepet");
        }
        public ActionResult İslemler()
        {
            var model=db.Siparisler.ToList();
            return View(model);
        }
    }
}