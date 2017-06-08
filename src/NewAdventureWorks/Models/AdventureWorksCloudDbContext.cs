namespace NewAdventureWorks.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AdventureWorksCloud : DbContext
    {
        public AdventureWorksCloud()
            : base("name=AdventureWorksCloud")
        {
        }

        public virtual DbSet<vEmployee> vEmployees { get; set; }
        
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }

      
    }
}
