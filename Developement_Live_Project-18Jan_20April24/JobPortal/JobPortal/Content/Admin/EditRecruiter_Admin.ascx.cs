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
    public partial class EditRecruiter_Admin : System.Web.UI.UserControl
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["job_portal"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCountry();
                GetState();
                GetCompanyCity();
                EditRecruiterdetails();
            }
        }

        public void GetCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblCountry", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETCOUNTRY");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcompanycountry.DataValueField = "countryid";
            ddlcompanycountry.DataTextField = "countryname";
            ddlcompanycountry.DataSource = dt;
            ddlcompanycountry.DataBind();
            ddlcompanycountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void GetState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblState", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETSTATE");
            cmd.Parameters.AddWithValue("@countryid", ddlcompanycountry.SelectedValue );
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcompanystate.Enabled = true;
            ddlcompanystate.DataValueField = "stateid";
            ddlcompanystate.DataTextField = "statename";
            ddlcompanystate.DataSource = dt;
            ddlcompanystate.DataBind();
            ddlcompanystate.Items.Insert(0, new ListItem("--Select--", "0"));

           
        }

        public void GetCompanyCity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblCity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "GETCITY");
            cmd.Parameters.AddWithValue("@countryid", ddlcompanycity.SelectedValue);
            cmd.Parameters.AddWithValue("@stateid", ddlcompanycity.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcompanycity.Enabled = true;
            ddlcompanycity.DataValueField = "cityid";
            ddlcompanycity.DataTextField = "cityname";
            ddlcompanycity.DataSource = dt;
            ddlcompanycity.DataBind();
            ddlcompanycity.Items.Insert(0, new ListItem("--Select--", "0"));
        }



        public void EditRecruiterdetails()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "EditRecruiterDetailsBy_Admin");
            cmd.Parameters.AddWithValue("@recruiterid", Request.QueryString["QS_Recruiterid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            txtcompanyname.Text = dt.Rows[0]["name"].ToString();
            txtcompanyurl.Text = dt.Rows[0]["url"].ToString();
            txtcomapnyaddress.Text = dt.Rows[0]["address"].ToString();
            ddlcompanycountry.SelectedValue = dt.Rows[0]["country"].ToString();
            ddlcompanystate.SelectedValue = dt.Rows[0]["state"].ToString();
            ddlcompanycity.SelectedValue = dt.Rows[0]["city"].ToString();
            txtcompanycontactperson.Text = dt.Rows[0]["hrname"].ToString();
            txtcompanyhremailid.Text = dt.Rows[0]["emailid"].ToString();
            txtcompanyhrmobileno.Text = dt.Rows[0]["contactno"].ToString();
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {

        }
    }

   
}
