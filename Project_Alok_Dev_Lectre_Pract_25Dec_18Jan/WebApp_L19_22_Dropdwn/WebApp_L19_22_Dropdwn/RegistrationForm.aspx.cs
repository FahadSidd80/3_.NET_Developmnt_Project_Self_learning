using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp_L19_22_Dropdwn
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayGrid();
                GetBloodgroup();
                GetCourse();
            }
        }


        public void GetBloodgroup()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_bloodgroup_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            rblbg.DataValueField = "bid";
            rblbg.DataTextField = "bname";
            rblbg.DataSource = dt;
            rblbg.DataBind();
        }

        public void GetCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Course_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcourse.DataValueField = "cid";
            ddlcourse.DataTextField = "cname";
            ddlcourse.DataSource = dt;
            ddlcourse.DataBind();
            ddlcourse.Items.Insert(0, new ListItem("--Select--","0"));
        }

        public void DisplayGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Registration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Registration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","Insert");
            cmd.Parameters.AddWithValue("@name",txtname.Text);
            cmd.Parameters.AddWithValue("@bloodgroup", rblbg.SelectedValue);
            cmd.Parameters.AddWithValue("@course",ddlcourse.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayGrid();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}