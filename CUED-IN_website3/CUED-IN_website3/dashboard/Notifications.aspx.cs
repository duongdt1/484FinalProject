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
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["User"]== null)
        {
            Response.Redirect("../Login.aspx");
        }
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Remove("User");
        Response.Redirect("../Login.aspx");


    }
}
