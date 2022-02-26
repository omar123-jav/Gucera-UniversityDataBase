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
    public partial class AddNewCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            UserLabel.Text = Session["Username"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand addCourseProc = new SqlCommand("InstAddCourse", conn);
                addCourseProc.CommandType = CommandType.StoredProcedure;
                addCourseProc.Parameters.Add(new SqlParameter("@name", TextBox2.Text));
                addCourseProc.Parameters.Add(new SqlParameter("@price", Convert.ToDecimal(TextBox3.Text)));
                addCourseProc.Parameters.Add(new SqlParameter("@creditHours", Convert.ToInt16(TextBox4.Text)));
                addCourseProc.Parameters.Add(new SqlParameter("@instructorId", Session["User_ID"].ToString()));
                conn.Open();
                try
                {
                    addCourseProc.ExecuteNonQuery();
                    conn.Close();
                    
                    Label3.Visible = false;
                    Label4.Visible = false;
                    Label5.Visible = false;
                    TextBox3.Visible = false;
                    TextBox4.Visible = false;
                    TextBox2.Visible = false;
                    Button1.Visible = false;
                    MessageLabel.Text = ("Added Successfully!");

                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened! please try again");
                }
            }
            else
                MessageLabel.Text = ("Try Again!");

        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InstructorHome.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }

    
}