using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebAppl_23_MasterPage
{
    public partial class StudentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCountry();
                GetGridview();
                ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlstate.Enabled = false;

            }
        }

        public void GetGridview()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblemployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        public void GetCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblcountry_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcountry.DataValueField = "cid";
            ddlcountry.DataTextField = "cname";
            con.Close();
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void GetState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblstate_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@countryid", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlstate.DataValueField = "sid";
            ddlstate.DataTextField = "sname";
            con.Close();
            ddlstate.Enabled = true;
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void ClearForm()
        {
            txtname.Text = "";
            txtage.Text = "";
            rblgender.ClearSelection();
            ddlcountry.SelectedValue = "0";
            ddlstate.Enabled = false;
            ddlstate.SelectedValue = "0";
            btnsave.Text = "Save";

        }
        protected void btnsave_Click(object sender, EventArgs e)
        {

            if (btnsave.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblemployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Insert");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                GetGridview();
                ClearForm();
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblemployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Update");
                cmd.Parameters.AddWithValue("@updateid", ViewState["updateid"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                GetGridview();
                ClearForm();
            }

        }
        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlcountry.SelectedValue == "0")
            {
                ddlstate.Enabled = false;
                ddlstate.SelectedValue = "0";
            }
            else
            {
                GetState();
            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblemployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Delete");
                cmd.Parameters.AddWithValue("@deleteid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                GetGridview();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tblemployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Edit");
                cmd.Parameters.AddWithValue("@editid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["country"].ToString();
                GetState();
                ddlstate.SelectedValue = dt.Rows[0]["state"].ToString();
                ViewState["updateid"] = e.CommandArgument;
                btnsave.Text = "Update";

            }

        }

      
    }
}