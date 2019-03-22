using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AddListing : System.Web.UI.Page
{
    
    DateTime currentDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        currentDate = DateTime.Now;
    }

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        using (SqlConnection connection = connect())
        {
            
            SqlCommand insert = new SqlCommand();
            insert.Connection = connection;
            insert.CommandText = "INSERT INTO JOB VALUES(@OrganizationID, @Title, @Pay, @JobType, @OrganizationType, @JobDescription, @Deadline, @LastUpdated, @LastUpdatedBy, @CareerCluster)";
            insert.Parameters.AddWithValue("@OrganizationID",0);
            insert.Parameters.AddWithValue("@Title", txtJobTitle.Text);
            insert.Parameters.AddWithValue("@Pay", Int32.Parse(txtJobPay.Text));
            insert.Parameters.AddWithValue("@JobType", radJobType.SelectedItem.Text);
            insert.Parameters.AddWithValue("@OrganizationType", txtOrgType.Text);
            insert.Parameters.AddWithValue("@JobDescription", txtJobDescription.Text);
            insert.Parameters.AddWithValue("@Deadline", txtDueDate.Text);
            insert.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
            insert.Parameters.AddWithValue("@LastUpdatedBy", "Jim");
            insert.Parameters.AddWithValue("@CareerCluster", txtCluster.Text);



            connection.Open();
            insert.ExecuteNonQuery();
            
        }
    }

   
}