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
        using (SqlConnection sc = connect())
        {
            sc.Open();
            System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
            findPass.Connection = sc;

            findPass.CommandText = "select username from organizationuser where username = @username";
            findPass.Parameters.Add(new SqlParameter("@username", txtUserName.Text));

            SqlDataReader reader = findPass.ExecuteReader(); //Create reader to find password

            if (reader.HasRows) 
            {
                txtDuplicate.Text = "Username already exists";     
            }
            else
            {
                if (chooseExisting.Checked)
                {
                    findPass.CommandText = "INSERT INTO organizationuser VALUES(@username2, @password, @emailaddress,@lastUpdated, @lastUpdatedBy, @passcode, @organizationID)";
                    findPass.Parameters.AddWithValue("@username2", txtUserName.Text);
                    findPass.Parameters.AddWithValue("@password", PasswordHash.HashPassword(txtPassword.Text));
                    findPass.Parameters.AddWithValue("@emailaddress", txtEmail.Text);
                    findPass.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
                    findPass.Parameters.AddWithValue("@lastUpdatedBy", "Acme Group");
                    findPass.Parameters.AddWithValue("@passcode", 12345);
                    findPass.Parameters.AddWithValue("@organizationID", ddlOrg.SelectedItem.Value);
                    //sc.Open();

                    reader.Close();
                    findPass.ExecuteNonQuery();
                    Response.Redirect("~/Welcome.aspx");
                }
                else
                {
                    Session["organizationUser"] = new OrganizationUser(txtUserName.Text, PasswordHash.HashPassword(txtPassword.Text), txtEmail.Text);
                    Response.Redirect("~/CreateBusiness.aspx");
                }

                

            }






        }

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }



    protected void chooseExisting_CheckedChanged(object sender, EventArgs e)
    {
        if(chooseExisting.Checked)
        {
            ddlOrg.Visible = true;
        }
       
    }

    protected void ChooseNew_CheckedChanged(object sender, EventArgs e)
    {
        if (ChooseNew.Checked)
        {
            ddlOrg.Visible = false;
        }
    }
}