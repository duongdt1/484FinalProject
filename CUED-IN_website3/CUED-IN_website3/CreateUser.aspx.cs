using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        //using (SqlConnection connection = connect())
        //{

            //OrganizationUser newUser = new OrganizationUser(txtUserName.Text, PasswordHash.HashPassword(txtPassword.Text), txtEmail.Text);


            Session["organizationUser"] = new OrganizationUser(txtUserName.Text, PasswordHash.HashPassword(txtPassword.Text), txtEmail.Text);
            Response.Redirect("~/CreateBusiness.aspx");

            //SqlCommand insert = new SqlCommand();
            //insert.Connection = connection;
            //insert.CommandText = "INSERT INTO organizationuser VALUES(@username, @password, @emailaddress,@lastUpdated, @lastUpdatedBy)";
            //insert.Parameters.AddWithValue("@username", txtUserName.Text);
            //insert.Parameters.AddWithValue("@password", txtPassword.Text);
            //insert.Parameters.AddWithValue("@emailaddress", txtEmail.Text);
            //insert.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
            //insert.Parameters.AddWithValue("@lastUpdatedBy", "Peaches");



            //connection.Open();
            //insert.ExecuteNonQuery();

        //}

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}