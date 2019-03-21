using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString =
@"Server=LOCALHOST;Database=LoginDB;Trusted_Connection=Yes;";
        sc.Open();

        System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
        createUser.Connection = sc;

        //Generate Username
        string ssLastName = txtLastName.Text;
        string ssFirstName = txtFirstName.Text;
        //string ssMiddleName = txtMiddleName.Text;
        //string middleInitial = ssMiddleName.Substring(0, 1);
        string lastName;

        if (ssLastName.Length < 6)
        {
            lastName = ssLastName.Substring(0, 3);
        }


        else
        {
            lastName = ssLastName.Substring(0, 6);
        }

        string firstInitial = ssFirstName.Substring(0, 1);
        string userName = lastName + firstInitial;


        //Insert User
        createUser.CommandText = "insert into[dbo].[Organization] values(@ContactFirstName, @ContactLastName, @UserName)";
        createUser.Parameters.Add(new SqlParameter("@ContactFirstName", txtContactFirstName.Text));
        createUser.Parameters.Add(new SqlParameter("@ContactLastName", txtContactLastName.Text));
        createUser.Parameters.Add(new SqlParameter("@UserName", userName));
        createUser.ExecuteNonQuery();


        //Insert password
        System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
        setPass.Connection = sc;

        setPass.CommandText = "insert into[dbo].[Password] values((select max(//ID) from person), @OrganizationEmail, @Password)";
        setPass.Parameters.Add(new SqlParameter("@UserName", userName));

        //Hash password entered
        setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text)));
        setPass.ExecuteNonQuery();

        sc.Close();

        lblMessage.Text = "User created. Your username is: " + userName;
        txtFirstName.Enabled = false;
        txtLastName.Enabled = false;
        txtPassword.Enabled = false;
        btnSubmit.Enabled = false;
        //lnkAnother.Visible = true;


    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx", false);
    }

    /*protected void lnkAnother_Click(object sender, EventArgs e)
    {
        txtFirstName.Enabled = true;
        txtLastName.Enabled = true;
        txtPassword.Enabled = true;
        btnSubmit.Enabled = true;
        lnkAnother.Visible = false;
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPassword.Text = "";*/
}

    /*protected void txtPassword_TextChanged(object sender, EventArgs e)
    {

    }*/
}
