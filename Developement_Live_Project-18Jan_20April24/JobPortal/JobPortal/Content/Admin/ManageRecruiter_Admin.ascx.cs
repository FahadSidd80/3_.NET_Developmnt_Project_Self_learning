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
    public partial class ManageRecruiter_Admin : System.Web.UI.UserControl
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["job_portal"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGridRecruiter();
                //    if (Session["recruiterid"] != null & Session["recruiterid"].ToString() != "")
                //    {
                //        lblrecruitermsg.Text = Session["recruitername"].ToString();
                //    }
                //    else
                //    {
                //        Response.Redirect("Logout.aspx");
                //    }


            }
        }



        public void GetGridRecruiter()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETRECRUITERPROFILE_ByAdmin");
            //cmd.Parameters.AddWithValue("@recruiterid", Session["recruiterid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grdrecruiter.DataSource = dt;
            grdrecruiter.DataBind();
        }
        protected void grdrecruiter_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "DELETERECRUITERPROFILE");
                cmd.Parameters.AddWithValue("@recruiterid", e.CommandArgument);
                //cmd.Parameters.AddWithValue("@recruiterid", Session["recruiterid"]);
                cmd.ExecuteNonQuery();
                con.Close();
                //Session["RecruiterID"] = e.CommandArgument;
                //lbldeletemsg.Text = "your account has been deleted successfully, it's safe to logout !!";
                //lbldeletemsg.ForeColor = Color.ForestGreen;
                //Session.Abandon();
                Response.Redirect("ManageRecruiter.aspx");



            }
            //Response.Redirect("RecruiterHome.aspx");
            //Response.Redirect("Logout.aspx");
            else if (e.CommandName == "Edt")
            {
                //Session["recruiterid"] = e.CommandArgument;
                //Response.Redirect("JobrecruiterForm.aspx");// send value by using session variable
                //Response.Redirect("JobrecruiterForm.aspx?Qs=" + e.CommandArgument);  //  send value by using query string variable
                Response.Redirect("EditRecruiterBy_Admin.aspx?QS_Recruiterid = " + e.CommandArgument);
            }
        }
    }
}