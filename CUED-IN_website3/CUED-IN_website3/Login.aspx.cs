using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click1(object sender, EventArgs e)
    {
        using (SqlConnection sc = connect())
        {
            sc.Open();
            System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
            findPass.Connection = sc;

            // Find password for username entered
            findPass.CommandText = "select password, organizationID from organizationuser where username = @username";
            findPass.Parameters.Add(new SqlParameter("@username", txtUsername.Text));

            SqlDataReader reader = findPass.ExecuteReader(); //Create reader to find password

            if (reader.HasRows) // If the username exists, it will continue
            {
                while (reader.Read()) // Read the record the has the matching password
                {
                    string storedHash = reader["Password"].ToString(); // store the database password into this variable

                    if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // If the password is correct for the username
                    {


                        Session["User"] = new OrganizationUser(txtUsername.Text, reader.GetInt32(1));
                       // Session.Timeout = 20;

                        HttpCookie userCookie = new HttpCookie("loginCookie");
                        userCookie.Value = txtUsername.Text;
                        Response.Cookies.Add(userCookie);
                        userCookie.Expires = DateTime.Now.AddDays(30);


                        Response.Redirect("~/Dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Your password is incorrect";
                    }

                }
            }
            else
            {
                lblError.Text = "Username does not exist";
            }




        }

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}
