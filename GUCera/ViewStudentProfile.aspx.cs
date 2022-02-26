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
    public partial class VeiwStudentProfile : System.Web.UI.Page
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

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand viewProfileProc = new SqlCommand("dbo.viewMyProfile");
            viewProfileProc.CommandType = System.Data.CommandType.StoredProcedure;

            viewProfileProc.Parameters.Add(new SqlParameter("@id", id));

            viewProfileProc.Connection = conn;
            conn.Open();

            //viewProfileProc.ExecuteNonQuery();
            SqlDataReader drr = viewProfileProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            using(drr)
            {
                drr.Read();
                first_name.Text = drr["firstName"].ToString();
                last_name.Text = drr["lastName"].ToString();
                email.Text = drr["email"].ToString();
                addr.Text = drr["address"].ToString();
                password.Text = drr["password"].ToString();
                gender.Text = (drr["gender"].ToString() == "1") ? "Female" : "Male";
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addCreditCard.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addTelephoneNumber.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CourseList.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAssignmentContent.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SubmitAssignment.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAssignGrades.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewMyPromoCodes.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewCertificate.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddFeedback.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}