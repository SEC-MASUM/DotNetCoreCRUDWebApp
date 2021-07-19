using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetCoreCRUDWebApp.Models
{
    public class StudentContext : DbContext 
    {
        public StudentContext(DbContextOptions<StudentContext> options) : base(options)
        {

        }

        public DbSet<Student> Student_tb { get; set; }
        public DbSet<Departments> Department_tb { get; set; }

    }
}
