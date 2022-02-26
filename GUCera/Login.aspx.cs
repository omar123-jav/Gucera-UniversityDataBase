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
                Session["User_Type"] = type.Value.ToString();
                SqlCommand findName = new SqlCommand("SELECT firstName,lastName FROM Users WHERE id = " + id, conn);

                conn.Open();
                SqlDataReader rdr = findName.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    Session["Username"] = rdr[0].ToString() + " " + rdr[1].ToString();
                }
                conn.Close();
                if (type.Value.ToString() == "2")
                {
                    Response.Redirect("~/ViewStudentProfile.aspx");
                }
                else if(type.Value.ToString() == "1")
                {
                    Response.Redirect("~/Admin Homepage.aspx");
                }
                else
                {
                    Response.Redirect("~/InstructorHome.aspx");
                }
                
                
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