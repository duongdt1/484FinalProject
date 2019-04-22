using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Scholarship : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
     

    }

    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        OrganizationUser newUser = (OrganizationUser)Session["User"];

        using (SqlConnection connection = connect())
        {

            SqlCommand createUser = new SqlCommand();
            createUser.Connection = connection;
            createUser.CommandText = "insert into[dbo].[scholarship] values(@OrganizationID, @Amount,@lastUpdated, @lastUpdatedBy, @Title, @Sponsor, @Email, @Description, @Deadline)";
            createUser.Parameters.AddWithValue("@OrganizationID", newUser.getOrgID());
            createUser.Parameters.AddWithValue("@Amount", HttpUtility.HtmlEncode(txtAmount.Text));
            createUser.Parameters.AddWithValue("@lastUpdated", DateTime.Now);
            createUser.Parameters.AddWithValue("@lastUpdatedBy", "Peaches");
            createUser.Parameters.AddWithValue("@Title", HttpUtility.HtmlEncode(txtTitle.Text));
            createUser.Parameters.AddWithValue("@Sponsor", HttpUtility.HtmlEncode(txtSponsor.Text));
            createUser.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));
            createUser.Parameters.AddWithValue("@Description", HttpUtility.HtmlEncode(txtDescription.Text));
            createUser.Parameters.AddWithValue("@Deadline", HttpUtility.HtmlEncode(txtDeadline.Text));
            connection.Open();
            createUser.ExecuteNonQuery();
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