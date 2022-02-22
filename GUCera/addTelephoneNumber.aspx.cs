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
    public partial class addTelephoneNumber : System.Web.UI.Page
    {
        protected int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Int32.Parse(Session["User_id"].ToString());
        }

        protected void addNumberButton_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            
            string num = number.Text;

            SqlCommand addNumberProc = new SqlCommand("dbo.addMobile", conn);

            addNumberProc.CommandType = System.Data.CommandType.StoredProcedure;

            addNumberProc.Parameters.Add(new SqlParameter("@mobile_number", num));
            addNumberProc.Parameters.Add(new SqlParameter("@id", id));
            
            conn.Open();
            try
            {
                addNumberProc.ExecuteNonQuery();
                MessageLabel.Text = ("Number was added successfully!");
            }catch(System.Data.SqlClient.SqlException exep)
            {
                MessageLabel.Text = ("This number is already added!");
            }
            conn.Close();

        }

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewStudentProfile.aspx");
        }
    }
}