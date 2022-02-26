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
    public partial class AddNewInstructor : System.Web.UI.Page
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
                int secondinstt = Int16.Parse(TextBox2.Text);
                SqlCommand aai = new SqlCommand("AddAnotherInstructorToCourse", conn);
                aai.CommandType = System.Data.CommandType.StoredProcedure;
                aai.Parameters.Add(new SqlParameter("@insid", secondinstt));
                aai.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                aai.Parameters.Add(new SqlParameter("@adderIns", Session["User_ID"].ToString()));
                conn.Open();
                try
                {
                    aai.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception e1)
                {
                    MessageLabel.Text = (e1.Message);
                }
            }
            else
                MessageLabel.Text = ("Try Again");

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand cVerify = new SqlCommand("SELECT * FROM Instructor WHERE Instructor.id =" + Convert.ToString(args), conn);
            try
            {
                conn.Open();
                SqlDataReader dataReader = cVerify.ExecuteReader();
                if (dataReader.HasRows)
                    args.IsValid = true;
                else
                    args.IsValid = false;
                conn.Close();
            }
            catch (Exception)
            {
                //Response.Write("An error happened ! please try again");
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