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
    public partial class IssueCert : System.Web.UI.Page
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
                cVerify.CommandType = System.Data.CommandType.Text;
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
            DropDownList2.Visible = false;
            Label4.Visible = false;
            Button1.Visible = false;
            Button2.Visible = true;
        }


        protected void Button2_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                Button2.Visible = false;
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand getStudentsToBeCertified = new SqlCommand("SELECT sid FROM StudentTakeCourse Where insid=" + Session["User_ID"] + " and cid=" + DropDownList1.SelectedValue + " and grade>2.0", conn);
                getStudentsToBeCertified.CommandType = System.Data.CommandType.Text;
                
                try
                {
                    conn.Open();
                    DropDownList2.DataSource = getStudentsToBeCertified.ExecuteReader();
                    DropDownList2.DataTextField = "sid";
                    DropDownList2.DataValueField = "sid";
                    DropDownList2.DataBind();
                    conn.Close();
                    DropDownList2.Visible = true;
                    Button1.Visible = true;
                    Label4.Visible = true;

                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened! Please Try Again!");
                }

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand certifyCourse = new SqlCommand("InstructorIssueCertificateToStudent", conn);
                certifyCourse.CommandType = System.Data.CommandType.StoredProcedure;
                certifyCourse.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                certifyCourse.Parameters.Add(new SqlParameter("@sid", DropDownList2.SelectedValue));
                certifyCourse.Parameters.Add(new SqlParameter("@issueDate", DateTime.Now));
                certifyCourse.Parameters.Add(new SqlParameter("@insId", Session["User_ID"].ToString()));
               
                conn.Open();
                try
                {
                    certifyCourse.ExecuteNonQuery();
                    conn.Close();
                    Label2.Visible = false;
                    Label4.Visible = false;
                    Button1.Visible = false;
                    DropDownList2.Visible = false;
                    Label success = new Label();
                    success.Text = "certified successfully!";
                    form1.Controls.Add(success);
                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened!you may have certified this student before ..please try again");

                }
            }
            else
            {
                MessageLabel.Text = ("Try Again!");
            }
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