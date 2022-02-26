using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class Admin_Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserLabel.Text = Session["Username"].ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View All Courses.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View non-accepted Courses.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Accept Courses.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreatePromoCode.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/IssuePromoCode.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addTelephoneNumber.aspx");
        }
    }
}