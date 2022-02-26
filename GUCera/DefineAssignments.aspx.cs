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
    public partial class DefineAssignments : System.Web.UI.Page
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
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand da = new SqlCommand("DefineAssignmentOfCourseOfCertianType", conn);
                da.CommandType = System.Data.CommandType.StoredProcedure;
                da.Parameters.Add(new SqlParameter("@instId", Session["User_ID"]));
                da.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                da.Parameters.Add(new SqlParameter("@number", Convert.ToInt16(TextBox4.Text)));
                da.Parameters.Add(new SqlParameter("@fullGrade", Convert.ToInt16(TextBox5.Text)));
                da.Parameters.Add(new SqlParameter("@type", DropDownList2.SelectedValue));
                da.Parameters.Add(new SqlParameter("@deadline", Convert.ToDateTime(TextBox8.Text))); //fomret is YYYY-MM-DD
                da.Parameters.Add(new SqlParameter("@content", TextBox7.Text));
                da.Parameters.Add(new SqlParameter("@weight", Convert.ToDecimal(TextBox6.Text)));
                conn.Open();
                try
                {
                    da.ExecuteNonQuery();
                    conn.Close();
                    Label sucess = new Label();
                    sucess.Text = "Defined Successfully!";
                    form1.Controls.Add(sucess);
                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened! please try again!");
                }

            }
            else
                MessageLabel.Text = ("Please Try Again!");

        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(conStr);
            SqlCommand cVerify = new SqlCommand("SELECT * FROM InstructorTeachCourse WHERE InstructorTeachCourse.cid=" + Convert.ToString(args) + "AND InstructorTeachCourse.insid=" + Session["User_ID"].ToString(), conn);
            SqlDataReader dataReader = cVerify.ExecuteReader();
            if (dataReader.HasRows)
                args.IsValid = true;
            else
                args.IsValid = false;
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