using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class dashboard_Transportation__Distribution__and_Logistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        String search = "select count(jobid)AS 'Nbr of jobs in CareerCluster',job.careercluster from job " +
            "inner join organization on job.[OrganizationID] = Organization.[OrganizationID] group by job.careercluster having job.careercluster = 'Transportation, Distribution, and Logistics'";
        SqlCommand query = new SqlCommand(search, sc);
        sc.Open();
        SqlDataReader reader = query.ExecuteReader();
        if (reader.Read())
        {
            TextBox1.Text = reader["Nbr of jobs in CareerCluster"].ToString();
        }
        sc.Close();

        String search2 = "select count(student.StudentID) AS 'Nbr of Students with this CareerCluster', CareerInterests.CareerCluster from student inner join CareerInterests on student.StudentID = CareerInterests.StudentID group by CareerInterests.CareerCluster having CareerInterests.CareerCluster = 'Transportation, Distribution, and Logistics'";
        SqlCommand query2 = new SqlCommand(search2, sc);
        sc.Open();
        SqlDataReader reader2 = query2.ExecuteReader();

        if (reader2.Read())
        {
            TextBox2.Text = reader2["Nbr of Students with this CareerCluster"].ToString();
        }
        sc.Close();
    }
}