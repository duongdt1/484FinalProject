using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Job : System.Web.UI.Page
{
    OrganizationUser signedInUser;
    protected void Page_Load(object sender, EventArgs e)
    {

        signedInUser = (OrganizationUser)Session["organizationUser"];
        using (SqlConnection connection = connect())
        {
            int orgID = 0;
            connection.Open();
            SqlCommand findID = new SqlCommand();
            findID.Connection = connection;
            findID.CommandText = "Select OrganizationID FROM Organization WHERE OrganizationName = @organizationName ";
            findID.Parameters.AddWithValue("@organizationName", signedInUser.getUserName()); //needs to be changed when cookie information is done
            SqlDataReader read = findID.ExecuteReader();
            while (read.Read())
            {
                orgID = Int32.Parse(read[0].ToString());
            }
            read.Close();

            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT JobID as 'Job Number', JobTitle as 'Title', Pay, PayType, MinimumAge as 'Minimum Age', " +
                "JobType as 'Job Type', JobDescription as 'Description', Deadline, careercluster as 'Career Cluster' FROM Job WHERE OrganizationID = @BusinessID";
            select.Parameters.AddWithValue("@BusinessID", orgID);
            SqlDataReader cursor = select.ExecuteReader();
            
            
            grdJobs.DataSource = cursor;
            grdJobs.DataBind();

        }
        
    }
    protected void grdJobs_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
        Session["sAppID"] = Int32.Parse(grdJobs.Rows[e.NewSelectedIndex].Cells[1].Text); ;
        Response.Redirect("~/Applications.aspx");
    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}
