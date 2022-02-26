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
    public partial class AddFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            if (DropDownList1.Items.Count == 0)
            {
                DropDownList1.DataBind();
                DropDownList1_SelectedIndexChanged(DropDownList1, e);
            }
            UserLabel.Text = Session["Username"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            int cid = Int32.Parse(Session["SelectedCourse"] + "");
            int sid = Int32.Parse(Session["User_ID"] + "");

            SqlCommand submitFeedbackProc = new SqlCommand("addFeedback", conn);

            submitFeedbackProc.CommandType = System.Data.CommandType.StoredProcedure;

            submitFeedbackProc.Parameters.Add(new SqlParameter("@comment", CommentText.Text));
            submitFeedbackProc.Parameters.Add(new SqlParameter("@cid", cid));
            submitFeedbackProc.Parameters.Add(new SqlParameter("@sid", sid));

            conn.Open();
            submitFeedbackProc.ExecuteNonQuery();
            MessageLabel.Text = "Feedback Added Successfully";
            CommentText.Text = "";
            conn.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            conn.Open();

            string courseName = DropDownList1.SelectedValue;
            SqlCommand getId = new SqlCommand("select id From Course WHERE name = '" + courseName + "'", conn);
            SqlDataReader drr = getId.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


            while (drr.Read())
            {
                Session["SelectedCourse"] = Int32.Parse(drr[0].ToString());
            }

            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
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