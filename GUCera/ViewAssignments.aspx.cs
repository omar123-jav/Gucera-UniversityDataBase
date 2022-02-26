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
    public partial class ViewAssignments : System.Web.UI.Page
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
                    Label3.Visible = true;
                    Button1.Visible = true;
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
                SqlCommand viewAssigns = new SqlCommand("select * from Assignment WHERE cid = "+DropDownList1.SelectedValue, conn);
                viewAssigns.CommandType = System.Data.CommandType.Text;
                viewAssigns.Parameters.Add(new SqlParameter("@instrId", Session["User_ID"]));
                viewAssigns.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                try
                {
                    conn.Open();
                    SqlDataReader reader = viewAssigns.ExecuteReader();
                    if (!(reader.HasRows))
                    {
                        Label l1 = new Label();
                        l1.Text = "No Assignments yet";
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
                        Label3.Visible = false;
                        DropDownList1.Visible = false;
                        Button1.Visible = false;
                        GridView1.Visible = true;
                        conn.Close();
                    }
                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened ! please try Again");
                    Label3.Visible = true;
                    Button1.Visible = true;
                    DropDownList1.Visible = true;
                }
            }
            else
            {
                MessageLabel.Text = ("Try again!");
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