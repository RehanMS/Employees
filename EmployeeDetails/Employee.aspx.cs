
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using System.Web.Hosting;
using DataAccessLayer.Model;
using System.Security.Principal;

namespace EmployeeDetails
{
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlCon"].ConnectionString);
        EmpBAL obj = new EmpBAL();
  
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetEmployee();
            }
          
        }

        private void GetEmployee()
        {
            
            gvEmployee.DataSource = obj.GetEmployees();
            gvEmployee.DataBind();
        }


        protected void btnInsert_Click(object sender, EventArgs e)
        {

            Employees emp = new Employees();
            emp.EmpName = txtename.Text;
            emp.Designation = ddlDesign.Text;
            emp.Salary = Convert.ToDouble(txtsal.Text);
            emp.Email = txtemail.Text;
            emp.Mobile = txtmob.Text;
            emp.Qualification = ddlQualification.Text;
            emp.Manager = txtmanager.Text;

            var emps = obj.InsertEmp(emp);
            GetEmployee();
            lblResult.Text = "Employee Added Successfully !";
        }

        protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvEmployee.Rows[e.RowIndex];
            Label Eid = (Label)(row.FindControl("lblEid"));

            int id = Convert.ToInt16(Eid.Text);
            string confirm = Request.Form["Confirm_value"];
            Response.Write("<script>alert('Do you want Delete?')</script>") ;
            obj.DeleteEmp(id);
            GetEmployee();
        }


        protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gvEmployee.EditIndex = e.NewEditIndex;
            GetEmployee();
        }

        protected void gvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Employees emps = new Employees();
            GridViewRow row = gvEmployee.Rows[e.RowIndex];
            Label Eid = row.Cells[0].FindControl("lblid") as Label;
            TextBox txtName = row.Cells[1].FindControl("txtEname") as TextBox;
            TextBox ddlDesn = row.Cells[2].FindControl("txtDesignation") as TextBox;
            TextBox txtSalary = row.Cells[3].FindControl("txtSalary") as TextBox;
            TextBox txtEmail = row.Cells[4].FindControl("txtEmail") as TextBox;
            TextBox txtMob = row.Cells[5].FindControl("txtMobile") as TextBox;
            TextBox ddlQual = row.Cells[6].FindControl("txtQual") as TextBox;
            TextBox txtMannager = row.Cells[7].FindControl("txtManager") as TextBox;


            emps.EmpId = Convert.ToInt32(Eid.Text);
            emps.EmpName = txtName.Text;
            emps.Designation = ddlDesn.Text;
            emps.Salary = Convert.ToInt32(txtSalary.Text);
            emps.Email = txtEmail.Text;
            emps.Mobile = txtMob.Text;
            emps.Qualification = ddlQual.Text;
            emps.Manager = txtMannager.Text;


            var emp = obj.UpdateEmp(emps);
            gvEmployee.EditIndex = -1;
            GetEmployee();
            lblResult.Text = "Employee Updated Successfully !";
        }

        protected void gvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEmployee.EditIndex = -1;
            GetEmployee();
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            txtename.Text = string.Empty;
            ddlDesign.ID = string.Empty;
            txtsal.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtmob.Text = string.Empty;
            ddlQualification.Text = string.Empty;
            txtmanager.Text = string.Empty;
        }


    }
}