using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using NewAdventureWorks.Models;

namespace NewAdventureWorks.Models
{
    public class OrgStructure
    {
        [Key]
        public int ID { get; set; }
        public vEmployee Employee { get; set; }
        public vEmployee Manager { get; set; }
        public IList<vEmployee> DirectReports { get; set; }
    }
}