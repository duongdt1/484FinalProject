using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.Configuration;

public partial class Dashboard : Page
{

    OrganizationUser signedInUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            signedInUser = (OrganizationUser)Session["User"];
            string orgID = signedInUser.getOrgID() + "";
            string uname = signedInUser.getUserName();

            companyName.Text = accessSQL("SELECT OrganizationName from Organization WHERE OrganizationID = @input", orgID);
            jobPostingCount.Text = accessSQL("SELECT COUNT(OrganizationID) from Job WHERE OrganizationID = @input", orgID);

            applicationReceivedCount.Text = accessSQL("SELECT COUNT(Job.JobID) FROM Application INNER JOIN Job ON Application.JobID = Job.JobID WHERE Job.OrganizationID = @input", orgID);

            studentClusterCount.Text = accessSQL("SELECT COUNT(CareerCluster.CareerCluster) FROM CareerCluster INNER JOIN Organization ON CareerCluster.CareerCluster = Organization.CareerCluster INNER JOIN OrganizationUser ON Organization.OrganizationID = OrganizationUser.OrganizationID WHERE CareerCluster.CareerCluster = (SELECT CareerCluster FROM Organization WHERE OrganizationID = @input)", orgID);
            unreadNotifs.Text = accessSQL("SELECT COUNT(NotificationID) from Notification where (Username = @input AND IsReceived = 'N');", uname);
        }
        catch(Exception)
        {

        }

    }

    protected String accessSQL(string query, string input)
    {
        String result = "Error";

        try
        {
            using (SqlConnection connection = connect())
            {
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                connection.Open();
                select.CommandText = query;
                select.Parameters.AddWithValue("@input", input);
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    result = cursor[0].ToString();
                }
            }
        }
        catch { }

        return result;
    }

  

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}
