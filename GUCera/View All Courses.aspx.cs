using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class View_All_Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            UserLabel.Text = Session["Username"].ToString();

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["GUCera"].ToString());
            SqlCommand com = new SqlCommand("dbo.AdminViewAllCourses", conn);
            com.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = com.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string name = rdr.GetString(rdr.GetOrdinal("name"));
                decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                int cr = rdr.GetInt32(rdr.GetOrdinal("credithours"));
                int content = rdr.GetOrdinal("content");
                string cont= rdr.IsDBNull(content) ? "No Content Yet" : rdr.GetString(content);

                int acc = rdr.GetOrdinal("accepted");
                bool accepted = rdr.IsDBNull(acc) ? false : rdr.GetBoolean(acc);

                Label instname = new Label();
                instname.Text = "Course Name: "+name+", Credit Hours: "+cr+ ", Price: " + price+ ", Content: " + cont+ ", Accepted: " + accepted;
                PlaceDiv.Controls.Add(instname);
                PlaceDiv.Controls.Add(new LiteralControl("<br />"));

            }
            conn.Close();

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