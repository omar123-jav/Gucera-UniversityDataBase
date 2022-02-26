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
    public partial class ViewFeedbacks : System.Web.UI.Page
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
                    GridView1.Visible = false;
                    Button1.Visible = true;
                    Label3.Visible = true;
                    DropDownList1.Visible = true;
                }
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand viewFeeds = new SqlCommand("ViewFeedbacksAddedByStudentsOnMyCourse", conn);
                viewFeeds.CommandType = System.Data.CommandType.StoredProcedure;
                viewFeeds.Parameters.Add(new SqlParameter("@instrId", Session["User_ID"].ToString()));
                viewFeeds.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                Label3.Visible = false;
                Button1.Visible = false;
                DropDownList1.Visible = false;
                conn.Open();
                try
                {
                    SqlDataReader reader = viewFeeds.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    if (!(reader.HasRows))
                    {
                        Label l1 = new Label();
                        l1.Text = "No Feedbacks yet";
                        form1.Controls.Add(l1);
                        conn.Close();
                    }
                    else
                    {

                        System.Data.DataTable dt = new DataTable();
                        dt.Load(reader);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        conn.Close();
                        GridView1.Visible = true;
                        Label3.Visible = false;
                        DropDownList1.Visible = false;
                        Button1.Visible = false;

                    }
                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened! please try again");
                    Label3.Visible = true;
                    Button1.Visible = true;
                    DropDownList1.Visible = true;
                }
            }
            else
            {
                MessageLabel.Text = ("Try Again!");
                Label3.Visible = true;
                Button1.Visible = true;
                DropDownList1.Visible = true;
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