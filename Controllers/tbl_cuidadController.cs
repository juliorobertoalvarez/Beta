using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Beta.Models;

namespace Beta.Controllers
{
    public class tbl_cuidadController : Controller
    {
        private MonosabioDBEntities db = new MonosabioDBEntities();

        // GET: tbl_cuidad
        public ActionResult Index()
        {
            return View(db.tbl_cuidad.ToList());
        }

        // GET: tbl_cuidad/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbl_cuidad tbl_cuidad = db.tbl_cuidad.Find(id);
            if (tbl_cuidad == null)
            {
                return HttpNotFound();
            }
            return View(tbl_cuidad);
        }

        // GET: tbl_cuidad/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tbl_cuidad/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idciudad,nombreciudad,tamano,indice,ingreso")] tbl_cuidad tbl_cuidad)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cuidad.Add(tbl_cuidad);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbl_cuidad);
        }

        // GET: tbl_cuidad/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbl_cuidad tbl_cuidad = db.tbl_cuidad.Find(id);
            if (tbl_cuidad == null)
            {
                return HttpNotFound();
            }
            return View(tbl_cuidad);
        }

        // POST: tbl_cuidad/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idciudad,nombreciudad,tamano,indice,ingreso")] tbl_cuidad tbl_cuidad)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbl_cuidad).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_cuidad);
        }

        // GET: tbl_cuidad/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbl_cuidad tbl_cuidad = db.tbl_cuidad.Find(id);
            if (tbl_cuidad == null)
            {
                return HttpNotFound();
            }
            return View(tbl_cuidad);
        }

        // POST: tbl_cuidad/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbl_cuidad tbl_cuidad = db.tbl_cuidad.Find(id);
            db.tbl_cuidad.Remove(tbl_cuidad);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
