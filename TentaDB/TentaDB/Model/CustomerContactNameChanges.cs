namespace TentaDB.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CustomerContactNameChanges
    {
        [Key]
        public int ContactNameChangesID { get; set; }

        [Required]
        [StringLength(40)]
        public string Customer { get; set; }

        [Required]
        [StringLength(30)]
        public string OldName { get; set; }

        [Required]
        [StringLength(30)]
        public string NewName { get; set; }

        public DateTime ChangedDate { get; set; }
    }
}
