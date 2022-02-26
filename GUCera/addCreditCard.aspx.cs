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
    public partial class addCreditCard : System.Web.UI.Page
    {
        protected int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            id = Int32.Parse(Session["User_ID"].ToString());
            UserLabel.Text = Session["Username"].ToString();
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand creditCardProc = new SqlCommand("dbo.addCreditCard", conn);
            creditCardProc.CommandType = System.Data.CommandType.StoredProcedure;

            creditCardProc.Parameters.Add(new SqlParameter("@sid", id));
            creditCardProc.Parameters.Add(new SqlParameter("@cvv", cvv.Text));
            creditCardProc.Parameters.Add(new SqlParameter("number", number.Text));
            creditCardProc.Parameters.Add(new SqlParameter("@expiryDate", expDate.Text));
            creditCardProc.Parameters.Add(new SqlParameter("@cardHolderName", holder.Text));

            conn.Open();
            try
            {
                creditCardProc.ExecuteNonQuery();
            }
            catch
            {
                MessageLabel.Text = "Credit Card Already Added";
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewStudentProfile.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}