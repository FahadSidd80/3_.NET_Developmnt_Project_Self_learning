using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace JobPortal.Content.Admin
{
    public partial class Admin_Edit_RecruiterJobPost : System.Web.UI.UserControl
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["job_portal"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["QueryStrngJobid"] != null && Request.QueryString["QueryStrngJobid"] != "")
                {
                    EditJobPost();
                    BindJobTitle();
                    BindCompanyName();
                }
                
            }
        }

        public void BindJobTitle()
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
            ddljobtitle.Items.Insert(0, new ListItem("--Select--","0"));
        }

        public void BindCompanyName()
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

     
        public void EditJobPost()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "EditJobPost_ByAdmin");
            cmd.Parameters.AddWithValue("@jobid", Request.QueryString["QueryStrngJobid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobtitle.SelectedValue = dt.Rows[0]["jobprofileid"].ToString();
            ddlcompanyname.SelectedValue = dt.Rows[0]["recruiterid"].ToString();
            txtminexperience.Text = dt.Rows[0]["minexperience"].ToString();
            txtmaxexperience.Text = dt.Rows[0]["maxexperience"].ToString();
            txtminsalary.Text = dt.Rows[0]["minsalary"].ToString();
            txtmaxsalary.Text = dt.Rows[0]["maxsalary"].ToString();
            txtvacancies.Text = dt.Rows[0]["vacancies"].ToString();
            txtcomments.Text = dt.Rows[0]["comment"].ToString();
            

        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "UpdateJobPost_ByAdmin");
            cmd.Parameters.AddWithValue("@jobid", Request.QueryString["QueryStrngJobid"]);
            cmd.Parameters.AddWithValue("@jobtitleid", ddljobtitle.SelectedValue);
            cmd.Parameters.AddWithValue("@recruiterid", ddlcompanyname.SelectedValue);
            cmd.Parameters.AddWithValue("@minexperince", txtminexperience.Text);
            cmd.Parameters.AddWithValue("@maxexperince", txtmaxexperience.Text);
            cmd.Parameters.AddWithValue("@minsalary",txtminsalary.Text);
            cmd.Parameters.AddWithValue("@maxsalary", txtmaxsalary.Text); 
            cmd.Parameters.AddWithValue("@noofvacancies", txtvacancies.Text);
            cmd.Parameters.AddWithValue("@comment", txtcomments.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ManageJobPost.aspx");
        }
    }
}