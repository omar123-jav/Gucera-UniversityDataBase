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
    public partial class Accept_Courses1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);
            int course =Int32.Parse (courseid.SelectedValue);
            int admin = Int32.Parse(Session["User_ID"].ToString());
            
            SqlCommand logproc = new SqlCommand("dbo.AdminAcceptRejectCourse", conn);
            logproc.CommandType = System.Data.CommandType.StoredProcedure;
            logproc.Parameters.Add(new SqlParameter("@courseId", course));
            logproc.Parameters.Add(new SqlParameter("@adminId",admin));
            conn.Open();
            logproc.ExecuteNonQuery();
            conn.Close();
            Response.Write("Course Accepted Succesfully");

        }
    }
}