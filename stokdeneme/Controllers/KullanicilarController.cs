using stokdeneme.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace stokdeneme.Controllers
{
    [AllowAnonymous]
    public class KullanicilarController : Controller
    {
        
        // GET: Kullanicilar
        stokEntities1 db=new stokEntities1();
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Kullanicilar k)
        {
            var kullanici=db.Kullanicilar.FirstOrDefault(x=>x.Kullaniciadi==k.Kullaniciadi && x.Sifre==k.Sifre);
            if(kullanici!=null)
            {
                FormsAuthentication.SetAuthCookie(k.Kullaniciadi, false);
                return RedirectToAction("Siparis","İşlemler");
            }
            ViewBag.hata = "Kullanıcı adı veya şifre hatalı";
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index","Home");
        }
    }
}