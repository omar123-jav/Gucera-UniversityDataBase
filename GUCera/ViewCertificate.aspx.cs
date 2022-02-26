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
    public partial class ViewCertificate : System.Web.UI.Page
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

            conn.Open();

            int cid = Int32.Parse(Session["SelectedCourse"] + "");
            int sid = Int32.Parse(Session["User_ID"] + "");

            SqlCommand viewCertificateProc = new SqlCommand("viewCertificate", conn);

            viewCertificateProc.CommandType = System.Data.CommandType.StoredProcedure;

            viewCertificateProc.Parameters.Add(new SqlParameter("@cid", cid));
            viewCertificateProc.Parameters.Add(new SqlParameter("@sid", sid));

            SqlDataReader drr2 = viewCertificateProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            while (drr2.Read())
            {
                issueDate.Text = drr2[2].ToString();
            }

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