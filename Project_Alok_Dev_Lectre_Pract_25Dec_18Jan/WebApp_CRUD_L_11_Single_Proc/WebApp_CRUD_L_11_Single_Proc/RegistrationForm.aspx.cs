using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp_CRUD_L_11_Single_Proc
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_CRUD_L_11_SP; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Insert");
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@gender", txtgender.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Cleartext();
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action","Update");
                cmd.Parameters.AddWithValue("@updid", ViewState["EditbuttonID"]);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@gender", txtgender.Text);
                cmd.Parameters.AddWithValue("@age", txtage.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Cleartext();
            }
        }

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Display");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        public void Cleartext()
        {
            txtname.Text = "";
            txtgender.Text = "";
            txtage.Text = "";
            btnsave.Text = "Submit";
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Delete");
                cmd.Parameters.AddWithValue("@deleteid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();

            }
            else if (e.CommandName == "Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Edit");
                cmd.Parameters.AddWithValue("@editid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtgender.Text = dt.Rows[0]["gender"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                btnsave.Text = "Update";
                ViewState["EditbuttonID"] = e.CommandArgument;
            }
        }

       
    }
}