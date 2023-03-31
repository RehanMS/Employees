using DataAccessLayer.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class Database
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString);
        SqlCommand cmd = null;
      
        public List<Employees> GetEmps()
        {
            List<Employees> models = new List<Employees>();
             cmd= new SqlCommand("select * from Employee",con);
            con.Open();
            SqlDataReader dr=cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {
                    Employees emp = new Employees();
                    emp.EmpId = Convert.ToInt32(dr["EmpId"]);
                    emp.EmpName = Convert.ToString(dr["EmpName"]);
                    emp.Designation = Convert.ToString(dr["Designation"]);
                    emp.Salary = Convert.ToDouble(dr["Salary"]);
                    emp.Email = Convert.ToString(dr["Email"]);
                    emp.Mobile = Convert.ToString(dr["Mobile"]);
                    emp.Qualification= Convert.ToString(dr["Qualification"]);
                    emp.Manager= Convert.ToString(dr["Manager"]);
                    models.Add(emp);
                }
            }
            con.Close();
            return models;
        }
        public Employees Details(int id)
        {
            Employees emp = new Employees();
            SqlCommand cmd = new SqlCommand("select * from Employee where EmpId=" + id, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if(dr.Read())
                {
                    emp.EmpName = Convert.ToString(dr["EmpName"]);
                    emp.Designation = Convert.ToString(dr["Designation"]);
                    emp.Salary = Convert.ToDouble(dr["Salary"]);
                    emp.Email = Convert.ToString(dr["Email"]);
                    emp.Mobile = Convert.ToString(dr["Mobile"]);
                    emp.Qualification = Convert.ToString(dr["Qualification"]);
                    emp.Manager = Convert.ToString(dr["Manager"]);
                }
                return emp;
            }
            return emp;
        }
        public bool AddEmployee(Employees emp)
        {
            
            SqlCommand cmd = new SqlCommand("sp_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
            cmd.Parameters.AddWithValue("@Designation", emp.Designation);
            cmd.Parameters.AddWithValue("@Salary", emp.Salary);
            cmd.Parameters.AddWithValue("@Email", emp.Email);
            cmd.Parameters.AddWithValue("@Mobile", emp.Mobile);
            cmd.Parameters.AddWithValue("@Qualification", emp.Qualification);
            cmd.Parameters.AddWithValue("@Manager", emp.Manager);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool UpdateEmployee(Employees emp)
        {
            SqlCommand cmd = new SqlCommand("sp_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empid", emp.EmpId);
            cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
            cmd.Parameters.AddWithValue("@Designation", emp.Designation);
            cmd.Parameters.AddWithValue("@Salary", emp.Salary);
            cmd.Parameters.AddWithValue("@Email", emp.Email);
            cmd.Parameters.AddWithValue("@Mobile", emp.Mobile);
            cmd.Parameters.AddWithValue("@Qualification", emp.Qualification);
            cmd.Parameters.AddWithValue("@Manager", emp.Manager);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool DeleteEmployee(int id)
        {
            SqlCommand cmd = new SqlCommand("sp_Delete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmpId", id);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
