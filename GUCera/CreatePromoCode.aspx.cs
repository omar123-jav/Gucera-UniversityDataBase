using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class CreatePromoCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            UserLabel.Text = Session["Username"].ToString();
        }

        protected void create_Click(object sender, EventArgs e)
        {

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);
            String cod = (code.Text);
            
            decimal disc = Decimal.Parse(discount.Text);
            int admin = Int32.Parse(Session["User_ID"].ToString());
            SqlCommand logproc = new SqlCommand("dbo.AdminCreatePromocode", conn);
            logproc.CommandType = System.Data.CommandType.StoredProcedure;
            logproc.Parameters.Add(new SqlParameter("@code", cod));
            logproc.Parameters.Add(new SqlParameter("@adminId", admin));
            logproc.Parameters.Add(new SqlParameter("@isuueDate", issuedate.Text));
            logproc.Parameters.Add(new SqlParameter("@expiryDate", expirydate.Text));
            logproc.Parameters.Add(new SqlParameter("@discount", disc));
            conn.Open();
            logproc.ExecuteNonQuery();
            conn.Close();
            MessageLabel.Text = ("Promo Code Created Succesfully");

        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin Homepage.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}