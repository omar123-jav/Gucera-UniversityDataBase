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
    public partial class UpdateContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            UserLabel.Text = Session["Username"].ToString();
            if (!IsPostBack)
            {
                string constr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(constr);
                SqlCommand cVerify = new SqlCommand("SELECT name , id FROM InstructorTeachCourse it INNER JOIN Course c ON it.cid=c.id WHERE it.insid=" + Session["User_ID"], conn);
                try
                {
                    conn.Open();
                    DropDownList1.DataSource = cVerify.ExecuteReader();
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "id";
                    DropDownList1.DataBind();
                    conn.Close();

                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened! Please Try Again!");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string constr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(constr);
                SqlCommand ucdp = new SqlCommand("UpdateCourseContent", conn);
                ucdp.CommandType = System.Data.CommandType.StoredProcedure;
                ucdp.Parameters.Add(new SqlParameter("@instrId", Session["User_ID"].ToString()));
                ucdp.Parameters.Add(new SqlParameter("@courseId", DropDownList1.SelectedValue));
                ucdp.Parameters.Add(new SqlParameter("@content", TextBox3.Text));
                try
                {
                    conn.Open();
                    ucdp.ExecuteNonQuery();
                    conn.Close();
                    MessageLabel.Text = ("Updated Successfully!");
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