using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class RegistrationSelect : System.Web.UI.Page
    {
        public int select = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void studentButton(object sender, EventArgs e)
        {
            select = 2;
            Response.Redirect("~/Register.aspx?select=" + select.ToString());
        }

        protected void instructorButton(object sender, EventArgs e)
        {
            select = 0;
            Response.Redirect("~/Register.aspx?select=" + select.ToString());
        }
    }
}