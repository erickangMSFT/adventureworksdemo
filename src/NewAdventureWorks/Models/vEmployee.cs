namespace NewAdventureWorks.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
 

    [Table("HumanResources.vEmployee")]
    public partial class vEmployee
    {
        [Key]
        [Display(Name="Employee ID")]
        public int BusinessEntityID { get; set; }

        [Display(Name="National ID")]
        [StringLength(15)]
        public string NationalIDNumber { get; set; }

        [Display(Name ="Login ID")]
        [StringLength(256)]
        public string LoginID { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string MiddleName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(50)]
        [Display(Name ="Position")]
        public string JobTitle { get; set; }

        [StringLength(25)]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        [Display(Name="PhoneNumber Type")]
        public string PhoneNumberType { get; set; }

        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        public string EmailAddress { get; set; }


        [Display(Name="Department ID")]
        public short DepartmentID { get; set; }
        [StringLength(50)]

        [Display(Name = "Division")]
        public string GroupName { get; set; }

        [Display(Name= "Department")]
        [StringLength(50)]
        public string DepartmentName { get; set; }

        
        [StringLength(60)]
        
        public string AddressLine1 { get; set; }

        public string AddressLine2 { get; set; }


        [StringLength(30)]
        public string City { get; set; }



        [StringLength(50)]
        [Display(Name ="State")]
        public string StateProvinceName { get; set; }



        [StringLength(15)]
        [DataType(DataType.PostalCode)]
        public string PostalCode { get; set; }


        [Display(Name ="Country")]
        [StringLength(50)]
        public string CountryRegionName { get; set; }

        [Column(TypeName = "xml")]
        [Display(Name="Addtional Contact Info")]
        public string AdditionalContactInfo { get; set; }


        [Display(Name="Organizational Level")]
        public short? OrganizationLevel { get; set; }
    }   
        
}
