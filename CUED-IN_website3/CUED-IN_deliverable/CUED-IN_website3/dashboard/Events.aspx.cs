using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  

    }
 
    //inserting and creating new events made by user
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime x;
        DateTime y = new DateTime();
        x = Calendar1.SelectedDate;
        if (x == y)
        {
            cvCaltest.IsValid = false;
            return;
        }
        using (SqlConnection connection = connect())
        {

            SqlCommand createUser = new SqlCommand();
            createUser.Connection = connection;
            createUser.CommandText = "insert into[dbo].[Event] values(@schoolID, @Date, @eventType, @lastUpdated, @lastUpdatedBy)";
            createUser.Parameters.AddWithValue("@schoolID", ddlSchool.SelectedItem.Value);
            createUser.Parameters.AddWithValue("@Date", Calendar1.SelectedDate);
            createUser.Parameters.AddWithValue("@eventType", ddlType.SelectedItem.Text);
            createUser.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
            createUser.Parameters.AddWithValue("@lastUpdatedBy", "CUED-IN");
            connection.Open();
            createUser.ExecuteNonQuery();
        }

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}
