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
    public partial class View_All_Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["GUCera"].ToString());
            SqlCommand com = new SqlCommand("dbo.AdminViewAllCourses", conn);
            com.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = com.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string name = rdr.GetString(rdr.GetOrdinal("name"));
                decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                int cr = rdr.GetInt32(rdr.GetOrdinal("credithours"));
                int content = rdr.GetOrdinal("content");
                string cont= rdr.IsDBNull(content) ? null : rdr.GetString(content);

                int acc = rdr.GetOrdinal("accepted");
                int accepted = rdr.IsDBNull(acc) ? 0 : rdr.GetInt32(acc);

                Label instname = new Label();
                instname.Text = name+" "+cr+" "+price+" "+cont+" "+accepted;
                form1.Controls.Add(instname);

            }
            conn.Close();

        }
    }
}