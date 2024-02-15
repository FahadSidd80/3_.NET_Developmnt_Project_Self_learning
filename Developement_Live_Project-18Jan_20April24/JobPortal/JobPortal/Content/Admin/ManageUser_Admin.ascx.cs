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
    public partial class ManageUser_Admin : System.Web.UI.UserControl
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["job_portal"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetGridUserAdmin();
            }
        }

        public void GetGridUserAdmin()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tblAdmin",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.Parameters.AddWithValue("@action", "GetUserProfileByAdmin");
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grduseradmin.DataSource = dt;
            grduseradmin.DataBind();
        }

        protected void grduseradmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}