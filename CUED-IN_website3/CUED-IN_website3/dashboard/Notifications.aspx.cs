using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Notifications : System.Web.UI.Page
{
    OrganizationUser signedInUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        signedInUser = (OrganizationUser)Session["User"];
        populateGrdNotification();
    }

    public void populateGrdNotification()
    {
        using (SqlConnection connection = connect()) // finds the title for the selected job using jobID
        {
            SqlCommand select = new SqlCommand();
            select.CommandText = "SELECT * FROM Notification WHERE UserName = @Username";
            select.Connection = connection;
            select.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            connection.Open();
            select.ExecuteNonQuery();
            SqlDataReader cursor = select.ExecuteReader();

            grdNotifications.DataSource = cursor;
            grdNotifications.DataBind();
        }

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}