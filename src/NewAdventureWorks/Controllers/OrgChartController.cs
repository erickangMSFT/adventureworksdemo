using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.SqlClient;
using NewAdventureWorks.Models;
using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.DataContracts;



namespace NewAdventureWorks.Controllers
{
    public class OrgChartController : Controller
    {
        AdventureWorksCloud db = new AdventureWorksCloud();
        // GET: OrgChart
        public ActionResult Index()
        {
            

            return View();
        }

        // GET: OrgChart/Details/5
        public ActionResult OrgChart(int? id)
        {
            id = id ?? 1;
            OrgStructure orgstructure = new OrgStructure();
            
            //Application Insight Telemetry 
            var tc = new TelemetryClient();
            
            var eventTel = new EventTelemetry();
            
            var stopwatch = System.Diagnostics.Stopwatch.StartNew();

            vEmployee employee = db.vEmployees.SqlQuery("exec [HumanResources].[uspGetEmployeeDetail] @BusinessEntityID", new SqlParameter("@BusinessEntityID", id)).FirstOrDefault();
            vEmployee manager = db.vEmployees.SqlQuery("exec [HumanResources].[uspGetDirectManager] @BusinessEntityID", new SqlParameter("@BusinessEntityID", id)).FirstOrDefault();
            List<vEmployee> directreports = db.vEmployees.SqlQuery("exec [HumanResources].[uspGetDirectReports] @BusinessEntityID", new SqlParameter("@BusinessEntityID", id)).ToList();

            stopwatch.Stop();
            eventTel.Name = "SQLQueryPerformance - OrgChart View";
            eventTel.Metrics["Query Time"] = stopwatch.Elapsed.TotalMilliseconds;
            eventTel.Properties["Query Description"] = "SQL DB query to get a manager and direct reports using the hierarchy id.";

            tc.TrackEvent(eventTel);          
            
            orgstructure.Employee = employee;
            orgstructure.Manager = manager;
            orgstructure.DirectReports = directreports;
            
            return View(orgstructure);
        }

        // GET: OrgChart/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrgChart/Create
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

        // GET: OrgChart/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: OrgChart/Edit/5
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

        // GET: OrgChart/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: OrgChart/Delete/5
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
