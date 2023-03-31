using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Model
{
    public class Employees
    {
        public int EmpId { get; set; }
        public string EmpName { get; set; }
        public string  Designation { get; set; }
        public double Salary { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string  Qualification { get; set; }
        public string Manager { get; set; }
    }
}
