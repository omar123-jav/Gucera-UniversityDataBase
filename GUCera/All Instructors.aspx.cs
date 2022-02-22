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
    public partial class All_Instructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["GUCera"].ToString());
            SqlCommand com = new SqlCommand("dbo.AdminListInstr", conn);
            com.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = com.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string inst = rdr.GetString(rdr.GetOrdinal("firstName"));
                string instn = rdr.GetString(rdr.GetOrdinal("lastName"));
                Label instname = new Label();
                instname.Text =inst+" "+inst;
                form1.Controls.Add(instname);
              
            }
            conn.Close();

        }
    }
}