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
    public partial class Register : System.Web.UI.Page
    {
        private string select;
        protected void Page_Load(object sender, EventArgs e)
        {
            select = Request.QueryString["select"];
        }

        protected void register(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            string fName = firstName.Text;
            string lName = lastName.Text;
            string pass = password.Text;
            string emails = email.Text;
            string addr = address.Text;
            string gend = gender.SelectedValue.ToString();

            int genderBit;
            if (gend == "Male")
                genderBit = 0;
            else
                genderBit = 1;

            SqlCommand registerProc = (select.Equals("0"))? new SqlCommand("dbo.instructorRegister", conn) : new SqlCommand("dbo.studentRegister", conn);

            registerProc.CommandType = System.Data.CommandType.StoredProcedure;

            registerProc.Parameters.Add(new SqlParameter("@first_name",fName));
            registerProc.Parameters.Add(new SqlParameter("@last_name", lName));
            registerProc.Parameters.Add(new SqlParameter("@password", pass));
            registerProc.Parameters.Add(new SqlParameter("@email", emails));
            registerProc.Parameters.Add(new SqlParameter("@address", addr));
            registerProc.Parameters.Add(new SqlParameter("@gender", genderBit));

            conn.Open();
            SqlCommand checkEmail = new SqlCommand("select email From Users", conn);

            SqlDataReader drr2 = checkEmail.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (drr2.Read())
            {
                if (emails.Equals(drr2[0].ToString()))
                {
                    MessageLabel.Text = "There already is a user with this email.";
                    return;
                }
            }

            conn.Close();

            conn.Open();

            registerProc.ExecuteNonQuery();

            SqlCommand getId = new SqlCommand("select max(id) From Users",conn);

            SqlDataReader drr = getId.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            int userId = -1;
            while(drr.Read())
            {
                userId = Int32.Parse(drr[0].ToString());
            }

            MessageLabel.Text = ("Registration Successful! Your ID is " + userId);
            conn.Close();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}