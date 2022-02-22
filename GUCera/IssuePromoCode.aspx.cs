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
    public partial class IssuePromoCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);
            String cod = (codr.SelectedValue);

            int sid = Int32.Parse(studentid.Text);
           
            SqlCommand logproc = new SqlCommand("dbo.AdminIssuePromocodeToStudent", conn);
            logproc.CommandType = System.Data.CommandType.StoredProcedure;
            logproc.Parameters.Add(new SqlParameter("@pid", cod));
            logproc.Parameters.Add(new SqlParameter("@sid", sid));
           
            conn.Open();
            try
            {
                logproc.ExecuteNonQuery();
            }
            catch
            {
                Response.Write("Promo Code Already Issued");
                return;
            }
            conn.Close();
            Response.Write("Promo Code Issued Succesfully");

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}