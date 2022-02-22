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
    public partial class CourseList : System.Web.UI.Page
    {
        protected int id=1;
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["GUCera"].ToString());

        protected string[,] n;

        protected void Page_Load(object sender, EventArgs e)
        {
            //id = Int32.Parse(Session["regSelect"].ToString()); 

            SqlCommand getCourseProc = new SqlCommand("dbo.availableCourses", conn);
            getCourseProc.CommandType = System.Data.CommandType.StoredProcedure;

            SqlCommand listCoursesProc = new SqlCommand("dbo.courseInformation", conn);
            listCoursesProc.CommandType = System.Data.CommandType.StoredProcedure;

            enrollList.AutoPostBack = false;



            using (conn)
            {
                using (getCourseProc)
                {
                    conn.Open();
                    //reader
                    SqlDataReader dr = getCourseProc.ExecuteReader(System.Data.CommandBehavior.Default);
                    //course list
                    DataTable cList = new DataTable();
                    //load table
                    cList.Load(dr);
                    //dropmenu
                    if (!IsPostBack)
                    {
                        enrollList.DataSource = cList;
                        enrollList.DataTextField = "Name";
                        enrollList.DataValueField = "Id";
                        enrollList.DataBind();
                        enrollList.Items.Insert(0, new ListItem("--Select--", "0"));
                        enrollList.SelectedIndex = enrollList.Items.IndexOf(enrollList.Items.FindByText("--Select--"));
                    }

                    //course list
                    //cList.Columns.RemoveAt(0);
                    DataTable completeTable = new DataTable();



                    completeTable.Columns.Add("Id", typeof(String));
                    completeTable.Columns.Add("Credit Hours", typeof(String));
                    completeTable.Columns.Add("Name", typeof(String));
                    completeTable.Columns.Add("Course Description", typeof(String));
                    completeTable.Columns.Add("Price", typeof(String));
                    completeTable.Columns.Add("Content", typeof(String));
                    completeTable.Columns.Add("Inst First Name", typeof(String));
                    completeTable.Columns.Add("Inst Last Name", typeof(String));

                    n = new string[enrollList.Items.Count, 3];

                    for (int i = 0; i<cList.Rows.Count;i++)
                    {
                        DataRow r = cList.Rows[i];
                        SqlParameter param = new SqlParameter("@id", r[1].ToString());
                        listCoursesProc.Parameters.Add(param);
                        dr = listCoursesProc.ExecuteReader(CommandBehavior.Default);
                        using (dr)
                        {
                            dr.Read();
                            DataRow newRow = completeTable.NewRow();

                            n[i, 0] = dr["id"].ToString();
                            n[i, 1] = dr["firstName"].ToString() + " "+ dr["lastName"].ToString();
                            n[i, 2] = dr["instructorId"].ToString();

                            newRow["Id"] = dr["id"].ToString();
                            newRow["Credit Hours"] = dr["creditHours"].ToString();
                            newRow["Name"] = dr["name"].ToString();
                            newRow["Course Description"] = dr["courseDescription"].ToString();
                            newRow["Price"] = dr["price"].ToString();
                            newRow["Content"] = dr["content"].ToString();
                            newRow["Inst First Name"] = dr["firstName"].ToString();
                            newRow["Inst Last Name"] = dr["lastName"].ToString();

                            completeTable.Rows.Add(newRow);
                        }
                        listCoursesProc.Parameters.Remove(param);
                    }
                    coursesList.DataSource = completeTable;
                    coursesList.DataBind();
                    conn.Close();
                }
            }

        }

        protected void enrollButton_Click(object sender, EventArgs e)
        {
            int l = Int32.Parse(enrollList.SelectedItem.Value.ToString());
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["GUCera"].ToString());
            SqlCommand enrollProc = new SqlCommand("dbo.enrollInCourse", conn);
            enrollProc.CommandType = System.Data.CommandType.StoredProcedure;

            enrollProc.Parameters.Add(new SqlParameter("@sid",id));
            enrollProc.Parameters.Add(new SqlParameter("@cid", l));
                     
            try
            {

                int target = -1;

                for (int i = 0; i < n.GetLength(0); i++)
                {
                    if (l.ToString().Equals(n[i, 0]))
                    {
                        target = i;
                    }
                }

                Response.Write(target);
                enrollProc.Parameters.Add(new SqlParameter("@instr",n[target,2]));


                conn.Open();
                enrollProc.ExecuteNonQuery();
                //Response.Write("You are now Enrolled in " + enrollList.SelectedItem.Text);
                //Response.redirect("~/StudentHome.aspx");
                conn.Close();
            }
            catch(IndexOutOfRangeException)
            {
                Response.Write("You just enrolled in this course");
            }
            catch(SqlException)
            {
                //Response.Write(exp.ToString());
                Response.Write("You are already enrolled in " + enrollList.SelectedItem.Text);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewStudentProfile.aspx");
        }
    }
}