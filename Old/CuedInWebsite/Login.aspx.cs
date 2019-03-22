using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server=LOCALHOST;Database=LoginDB;Trusted_Connection=Yes;";

        sc.Open();
        System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
        findPass.Connection = sc;

        // Find password for username entered
        findPass.CommandText = "select PasswordHash from Pass where UserName = @UserName";
        findPass.Parameters.Add(new SqlParameter("@UserName", userName));

        SqlDataReader reader = findPass.ExecuteReader(); //Create reader to find password

        if (reader.HasRows) // If the email exists, it will continue
        {
            while (reader.Read()) // Read the record the has the matching password
            {
                string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // If the password is correct for the username
                {
                    lblStatus.Text = "Login success! User " + userName + " is logged in.";
                    btnLogin.Enabled = false;
                    txtUsername.Enabled = false;
                    txtPassword.Enabled = false;
                }
                else
                    lblStatus.Text = "Incorrect password"; // If the password doesn't match the email
            }
        }
        else // Display message if email doesn't exist
            lblStatus.Text = "No user matches that email";

        sc.Close();
    }

    protected void lnkCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("createUser.aspx", false);
    }

}
