using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;


namespace GUCera
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            string id = username.Text;
            string pass = password.Text;

            SqlCommand logproc = new SqlCommand("dbo.userLogin", conn);

            logproc.CommandType = System.Data.CommandType.StoredProcedure;

            logproc.Parameters.Add(new SqlParameter("@id", id));
            logproc.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter succ = logproc.Parameters.Add("@Success", System.Data.SqlDbType.Int);
            SqlParameter type = logproc.Parameters.Add("@Type", System.Data.SqlDbType.Int);

            succ.Direction = System.Data.ParameterDirection.Output;
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            logproc.ExecuteNonQuery();
            conn.Close();

            if (succ.Value.ToString() == "1")
            {
                Session["User_ID"] = id;
                Response.Redirect("~/Accept Courses.aspx");
            }
            else
                MessageLabel.Text = ("Wrong username or password");



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrationSelect.aspx");
        }
    }
}