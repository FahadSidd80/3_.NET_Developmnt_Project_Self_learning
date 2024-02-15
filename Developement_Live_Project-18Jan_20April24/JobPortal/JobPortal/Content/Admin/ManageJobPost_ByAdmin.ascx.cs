using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace JobPortal.Content.Admin
{
    public partial class ManageJobPost_ByAdmin : System.Web.UI.UserControl
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["job_portal"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGridManageJobPostAdmin();
                GetCompanyName_Admin();
                GetJobProfile_admin();
            }
        }
        public void GetJobProfile_admin()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblJobprofile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETJOBPROFILE");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobtitle.DataValueField = "jobprofileid";
            ddljobtitle.DataTextField = "jobprofilename";
            ddljobtitle.DataSource = dt;
            ddljobtitle.DataBind();
            ddljobtitle.Items.Insert(0, new ListItem("--Select--", "0"));
        }
          

        public void GetCompanyName_Admin()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblRecruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETFILTERCOMPANY");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcompanyname.DataValueField = "recruiterid";
            ddlcompanyname.DataTextField = "recruitername";
            ddlcompanyname.DataSource = dt;
            ddlcompanyname.DataBind();
            ddlcompanyname.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void GetGridManageJobPostAdmin()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","GetManageJobPostByAdmin");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grdjobpostadmin.DataSource = dt;
            grdjobpostadmin.DataBind();
        }
        protected void gridjobpostadmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "DELETEJOB_Admin");
                cmd.Parameters.AddWithValue("@jobid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                GetGridManageJobPostAdmin();
            }
            else if (e.CommandName == "Edt")
            {
                Response.Redirect("EditJobPostBy_Admin.aspx?QueryStrngJobid=" + e.CommandArgument);
                
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GetFilterJobs_admin");
            cmd.Parameters.AddWithValue("@jobtitleid", ddljobtitle.SelectedValue);
            cmd.Parameters.AddWithValue("@companyname", ddlcompanyname.SelectedValue);
            cmd.Parameters.AddWithValue("@usersalary", txtusersalary.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grdjobpostadmin.DataSource = dt;
            grdjobpostadmin.DataBind();
            if (dt.Rows.Count > 0)
            {
                lblmessageJobpostadmin.Text = "";

            }
            else 
            {
                lblmessageJobpostadmin.Text = "No records found ...!!";
                lblmessageJobpostadmin.ForeColor = Color.Red;
            }
        }

        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            GetGridManageJobPostAdmin();
            lblmessageJobpostadmin.Text = "";
            ddljobtitle.SelectedValue = "0";
            ddlcompanyname.SelectedValue = "0";
            txtusersalary.Text = "";
        }
    }
}