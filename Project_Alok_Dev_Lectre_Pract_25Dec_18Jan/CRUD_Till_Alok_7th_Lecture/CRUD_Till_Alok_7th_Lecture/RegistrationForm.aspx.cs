using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CRUD_Till_Alok_7th_Lecture
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=LTIN254607; initial catalog=DB_CRUD_ALOK_Till_7th_Lcture; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text=="Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblRegistration(name,gender,age)values('" + txtname.Text + "','" + txtgender.Text + "','" + txtage.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Cleartext();
            }
            else if (btnsave.Text=="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update  tblregistration set name='"+txtname.Text+"', gender = '"+txtgender.Text+"', age='"+txtage.Text+"' where rid ='" + ViewState["EditbuttonID"] +"' ",con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
                Cleartext();
            }
           
        }

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblRegistration",con);
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
                SqlCommand cmd = new SqlCommand("delete from tblRegistration where rid = '"+e.CommandArgument+"'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();

            }
            else if (e.CommandName=="Edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblRegistration where rid = '"+e.CommandArgument+"'", con);
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

            //DataRow[] dr = new DataRow[dt.Rows.Count];
            //dt.Rows.CopyTo(dr, 0);
            //String[] tblreg = Array.ConvertAll(dr, new Converter<DataRow, String>(DataRowToString));
            //private static String DataRowToSTring(DataRow dr)
            //{
            //    return Convert.ToString(dr["name"].ToString());
            //    return Convert.ToString(dr["gender"].ToString());
            //    return Convert.ToString(dr["age"].ToString());
            //    //return Convert.ToString(dr["name"].ToString());
            //}

        }

       
    }
}