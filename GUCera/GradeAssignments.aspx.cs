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
    public partial class GradeAssignments : System.Web.UI.Page
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
                }
            }
            DropDownList2.Visible = false;
            DropDownList3.Visible = false;
            DropDownList4.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Button1.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            TextBox6.Visible = false;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string conStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
                SqlConnection conn = new SqlConnection(conStr);
                SqlCommand gradeAssign = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
                gradeAssign.CommandType = System.Data.CommandType.StoredProcedure;
                gradeAssign.Parameters.Add(new SqlParameter("@instrId", Convert.ToInt16(Session["User_ID"])));
                gradeAssign.Parameters.Add(new SqlParameter("@sid", DropDownList4.SelectedValue));
                gradeAssign.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                gradeAssign.Parameters.Add(new SqlParameter("@type", DropDownList2.SelectedValue));
                gradeAssign.Parameters.Add(new SqlParameter("@assignmentNumber", DropDownList3.SelectedValue));
                gradeAssign.Parameters.Add(new SqlParameter("@grade", Convert.ToDecimal(TextBox6.Text)));
                conn.Open();
                try
                {
                    gradeAssign.ExecuteNonQuery();
                    conn.Close();
                    MessageLabel.Text = ("Graded Sucessfully!");
                    
                }
                catch (Exception)
                {
                    MessageLabel.Text = ("An error happened ! please try again");
                }
                SqlCommand calcgrade = new SqlCommand("calculateFinalGrade", conn);
                calcgrade.CommandType = System.Data.CommandType.StoredProcedure;
                calcgrade.Parameters.Add(new SqlParameter("@cid", DropDownList1.SelectedValue));
                calcgrade.Parameters.Add(new SqlParameter("@sid", DropDownList4.SelectedValue));
                calcgrade.Parameters.Add(new SqlParameter("@insId", Session["User_ID"].ToString()));
                conn.Open();
                calcgrade.ExecuteNonQuery();
                conn.Close();
            }
            else
                MessageLabel.Text = ("Try again!");
        }






        protected void Button2_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cVerify = new SqlCommand("select assignmenttype from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + "  and instructorId = " + Session["User_ID"], conn);
            cVerify.CommandType = System.Data.CommandType.Text;
            try
            {
                conn.Open();
                DropDownList2.DataSource = cVerify.ExecuteReader();
                DropDownList2.DataTextField = "assignmenttype";
                DropDownList2.DataValueField = "assignmenttype";
                DropDownList2.DataBind();
                conn.Close();
                Label5.Visible = true;
                Button3.Visible = true;
                DropDownList2.Visible = true;
            }
            catch (Exception)
            {
                MessageLabel.Text = ("An error happened! Please Try Again!");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cVerifyone;
            if (DropDownList2.SelectedValue.ToLower().Equals("project"))
                cVerifyone = new SqlCommand("select assignmentNumber from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + " and instructorId =" + Session["User_ID"] + " and assignmenttype =" + "'project'", conn);
            else if (DropDownList2.SelectedValue.ToLower().Equals("quiz"))
                cVerifyone = new SqlCommand("select assignmentNumber from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + " and instructorId =" + Session["User_ID"] + " and assignmenttype =" + "'quiz'", conn);
            else
                cVerifyone = new SqlCommand("select assignmentNumber from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + " and instructorId =" + Session["User_ID"] + " and assignmenttype =" + "'exam'", conn);
            cVerifyone.CommandType = System.Data.CommandType.Text;
            try
            {
                conn.Open();
                DropDownList3.DataSource = cVerifyone.ExecuteReader();
                DropDownList3.DataTextField = "assignmentNumber";
                DropDownList3.DataValueField = "assignmentNumber";
                DropDownList3.DataBind();
                conn.Close();
                Label6.Visible = true;
                Button4.Visible = true;
                DropDownList3.Visible = true;
            }
            catch (Exception)
            {
                MessageLabel.Text = ("An error happened! Please Try Again!");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string constr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cVerify;
            if (DropDownList2.SelectedValue.ToLower().Equals("project"))
                cVerify = new SqlCommand("select sid from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + "and assignmentNumber =" + DropDownList3.SelectedValue + " and instructorId =" + Session["User_ID"] + "and assignmenttype = " + "'project'", conn);
            else if (DropDownList2.SelectedValue.ToLower().Equals("quiz"))
                cVerify = new SqlCommand("select sid from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + "and assignmentNumber =" + DropDownList3.SelectedValue + " and instructorId =" + Session["User_ID"] + "and assignmenttype = " + "'quiz'", conn);
            else
                cVerify = new SqlCommand("select sid from StudentTakeAssignment S inner join Course C on C.id = S.cid where cid =" + DropDownList1.SelectedValue + "and assignmentNumber =" + DropDownList3.SelectedValue + " and instructorId =" + Session["User_ID"] + "and assignmenttype = " + "'exam'", conn);
            cVerify.CommandType = System.Data.CommandType.Text;
            try
            {
                conn.Open();
                DropDownList4.DataSource = cVerify.ExecuteReader();
                DropDownList4.DataTextField = "sid";
                DropDownList4.DataValueField = "sid";
                DropDownList4.DataBind();
                conn.Close();
                Label4.Visible = true;
                Label7.Visible = true;
                DropDownList4.Visible = true;
                TextBox6.Visible = true;
                Button1.Visible = true;
            }
            catch (Exception)
            {
                MessageLabel.Text = ("An error happened! Please Try Again!");
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