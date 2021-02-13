using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Beta.Models;

namespace Beta.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index(String message ="")
        {
            ViewBag.Message = message;
            return View();
        }
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            if(!string.IsNullOrEmpty(email)&&!string.IsNullOrEmpty(password))
            {
                MonosabioDBEntities db = new MonosabioDBEntities();
                var user = db.Usuarios.FirstOrDefault(e => e.email == email && e.contrasena == password);
                //direferente que null
                if(user != null)
                {
                    // encontramos usuario
                    FormsAuthentication.SetAuthCookie(user.email, true);
                    return RedirectToAction("Index","Profile");
                   
                }
                else
                {
                    return RedirectToAction("Index", new { message = "Datos Invalidos" });
                }
            }
            else
            {
                return RedirectToAction("Index", new { message = "Llena los campos para iniciar sesion" });
            }

        }

        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }
    }
}