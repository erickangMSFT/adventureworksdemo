using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NewAdventureWorks.Models;
using System.Data;
using System.Data.Entity;
using System.Net;
using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.DataContracts;


namespace NewAdventureWorks.Controllers
{
    
    public class vEmployeeController : Controller
    {
        private AdventureWorksCloud db = new AdventureWorksCloud();
        // GET: vEmployee
 
        public ActionResult Index()
        {
            var tc = new TelemetryClient();
            
            var eventTel = new EventTelemetry();

            var stopwatch = System.Diagnostics.Stopwatch.StartNew();
            
            var employees = from e in db.vEmployees
                            select e;
            stopwatch.Stop();
            eventTel.Name = "SQLQueryPerformance - Directory View";
            eventTel.Metrics["Query Time"] = stopwatch.Elapsed.TotalMilliseconds;
            eventTel.Properties["Query Description"] = "SQL DB query to get all employee directory list.";
            tc.TrackEvent(eventTel);
            return View(employees.ToList());
        }

        // GET: vEmployee/Details/5
        public ActionResult Details(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var tc = new TelemetryClient();
            
            var eventTel = new EventTelemetry();
            

            var stopwatch = System.Diagnostics.Stopwatch.StartNew();
            var employee = from e in db.vEmployees
                           where e.BusinessEntityID == id
                           select e;
            var employees = from e in db.vEmployees
                            select e;

            stopwatch.Stop();
            eventTel.Name = "SQLQueryPerformance - Detail View";
            eventTel.Metrics["Query Time"] = stopwatch.Elapsed.TotalMilliseconds;
            eventTel.Properties["Query Description"] = "SQL DB query to get an employee's detail";
            tc.TrackEvent(eventTel);
            return View(employee.FirstOrDefault());
        }

        // GET: vEmployee/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: vEmployee/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: vEmployee/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: vEmployee/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: vEmployee/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: vEmployee/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
