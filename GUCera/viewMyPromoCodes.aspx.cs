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
    public partial class viewMyPromoCodes : System.Web.UI.Page
    {
        protected int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            id = Int32.Parse(Session["User_ID"].ToString());
            UserLabel.Text = Session["Username"].ToString();
            string connString = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();

            SqlConnection conn = new SqlConnection(connString);

            SqlCommand viewPromoProc = new SqlCommand("dbo.viewPromocode", conn);
            viewPromoProc.CommandType = System.Data.CommandType.StoredProcedure;

            viewPromoProc.Parameters.Add(new SqlParameter("@sid", id));

            using(conn)
            {
                using(viewPromoProc)
                {
                    conn.Open();
                    SqlDataReader dr = viewPromoProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    DataTable promostable = new DataTable();
                    promostable.Load(dr);
                    promoTable.DataSource = promostable;
                    promoTable.DataBind();  
                    conn.Close();
                }
            }
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