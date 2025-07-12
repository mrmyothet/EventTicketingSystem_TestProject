using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EventTicketingSystem.Database.AppDbContext;

public partial class TblBusinessemail
{
    [Key]
    public string? Businessemailid { get; set; }

    public string? Businessemailcode { get; set; }

    public string? Fullname { get; set; }

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public string? Createdby { get; set; }

    public DateTime? Createdat { get; set; }

    public string? Modifiedby { get; set; }

    public DateTime? Modifiedat { get; set; }

    public bool? Deleteflag { get; set; }
}
