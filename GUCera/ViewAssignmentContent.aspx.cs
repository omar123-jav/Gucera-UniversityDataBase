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
    public partial class ViewAssignmentContent : System.Web.UI.Page
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
                DropDownList2.DataBind();
                DropDownList2_SelectedIndexChanged(DropDownList2, e);
            }
            UserLabel.Text = Session["Username"].ToString();
        }

        
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            int cid = Int32.Parse(Session["SelectedCourse"]+"");
            int sid = Int32.Parse(Session["User_ID"]+"");

            SqlCommand viewContentProc = new SqlCommand("viewAssign", conn);

            viewContentProc.CommandType = System.Data.CommandType.StoredProcedure;

            viewContentProc.Parameters.Add(new SqlParameter("@courseId", cid));
            viewContentProc.Parameters.Add(new SqlParameter("@Sid", sid));

            conn.Open();

            SqlDataReader drr = viewContentProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            

            while (drr.Read())
            {
                if (drr[1].ToString() == DropDownList2.SelectedValue.ToString())
                {
                    ContentLink.Text = drr[6].ToString();
                    TypeLabel.Text = drr[2].ToString();
                    DueLabel.Text = drr[5].ToString();
                }
            }

            conn.Close();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            conn.Open();

            string courseName = DropDownList1.SelectedValue;
            SqlCommand getId = new SqlCommand("select id From Course WHERE name = '" + courseName+"'", conn);
            SqlDataReader drr = getId.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


            while (drr.Read())
            {
                Session["SelectedCourse"] = Int32.Parse(drr[0].ToString());
            }

            DropDownList2.DataBind();
            DropDownList2_SelectedIndexChanged(DropDownList2, e);

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
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