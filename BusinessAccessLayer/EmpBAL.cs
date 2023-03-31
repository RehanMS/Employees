using DataAccessLayer;
using DataAccessLayer.Model;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace BusinessAccessLayer
{
    public class EmpBAL
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString);
        Database context = new Database();  
        public List<Employees> GetEmployees()
        {
            List<Employees> list = new List<Employees>();
            List<Employees> emps= context.GetEmps();

            foreach(var item in emps)
            {
                Employees emp = new Employees();
                emp.EmpId = item.EmpId;
                emp.EmpName= item.EmpName;
                emp.Designation = item.Designation;
                emp.Salary = item.Salary;
                emp.Email = item.Email;
                emp.Mobile= item.Mobile;
                emp.Qualification= item.Qualification;
                emp.Manager = item.Manager;

                list.Add(emp);
            }
            return list;

        }
        public string InsertEmp(Employees emp)
        {
            context.AddEmployee(emp);
            return "Employee is inserted";
        }
        public int DeleteEmp(int id)
        {
            context.DeleteEmployee(id);
            return id;
        }
        public string UpdateEmp(Employees emps)
        {
            context.UpdateEmployee(emps);
            return "Employee Updated";
        }
        

    }
}
