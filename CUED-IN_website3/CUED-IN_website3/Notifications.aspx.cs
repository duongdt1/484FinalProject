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
            if (chkShowOpened.Checked)
                select.CommandText = "SELECT NotificationID as 'Number',Header, IsReceived as Opened, SendDate as 'Date Sent' FROM Notification WHERE UserName = @Username";
            else
                select.CommandText = "SELECT NotificationID as 'Number',Header, IsReceived as Opened, SendDate as 'Date Sent' FROM Notification WHERE UserName = @Username AND IsReceived = 'N'";
            select.Connection = connection;
            select.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            connection.Open();
            select.ExecuteNonQuery();
            SqlDataReader cursor = select.ExecuteReader();

            grdNotifications.DataSource = cursor;
            grdNotifications.DataBind();
        }

    }
    protected void grdNotifications_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
        string messageContent = "";
        using (SqlConnection connection = connect()) // finds the title for the selected job using jobID
        {
            SqlCommand update = new SqlCommand();
            update.CommandText = "UPDATE Notification SET IsReceived = 'Y' WHERE UserName = @Username AND NotificationID = @NID";
            update.Connection = connection;
            update.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            update.Parameters.AddWithValue("@NID", grdNotifications.Rows[e.NewSelectedIndex].Cells[1].Text);
            connection.Open();
            update.ExecuteNonQuery();

            

            SqlCommand select = new SqlCommand();
            select.CommandText = "SELECT Content From Notification WHERE Username = @Username";
            select.Connection = connection;
            select.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            select.ExecuteNonQuery();
            SqlDataReader cursor = select.ExecuteReader();
            while(cursor.Read())
            {
                messageContent = cursor[0].ToString();
            }

        }
        //ClientScript.RegisterStartupScript(this.GetType(), grdNotifications.Rows[e.NewSelectedIndex].Cells[2].Text, "alert('" + grdNotifications.Rows[e.NewSelectedIndex].Cells[1].Text + "');", true);
        Page.Controls.Add(new LiteralControl(
   "<script language='javascript'> window.alert('" + messageContent + "')</script>"));

        populateGrdNotification();
    }

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    protected void chkShowOpened_CheckedChanged(object sender, EventArgs e)
    {
        populateGrdNotification();
    }
}