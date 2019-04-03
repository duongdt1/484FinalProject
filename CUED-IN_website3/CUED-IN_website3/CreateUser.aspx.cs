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
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
       // ddlOrg.Items.Insert(0, "Select Organization");

    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        if (!txtPassword.Text.Equals(txtReenter.Text))
        {
            lblError.Visible = true;
            lblError.Text = "Your password does not match";
        }

        else
        {

            lblError.Visible = false;
            using (SqlConnection sc = connect())
            {
                sc.Open();
                SqlCommand findPass = new SqlCommand();
                findPass.Connection = sc;

                findPass.CommandText = "select username from organizationuser where username = @username";
                findPass.Parameters.Add(new SqlParameter("@username", txtUserName.Text));

                SqlDataReader reader = findPass.ExecuteReader(); //Create reader to find password

                if (reader.HasRows)
                {
                    lblDuplicate.Visible = true;

                    lblDuplicate.Text = "Username already exists";

                }
                else
                {
                    lblDuplicate.Visible = true;
                    if (rbExisting.Checked)
                    {
                        reader.Close();
                        findPass.CommandText = "INSERT INTO organizationuser VALUES(@username2, @password, @emailaddress,@lastUpdated, @lastUpdatedBy, @passcode, @organizationID)";
                        findPass.Parameters.Add(new SqlParameter("@username2", txtUserName.Text));
                        findPass.Parameters.Add(new SqlParameter("@password", PasswordHash.HashPassword(txtPassword.Text)));
                        findPass.Parameters.Add(new SqlParameter("@emailaddress", txtEmail.Text));
                        findPass.Parameters.Add(new SqlParameter("@lastUpdated", DateTime.Now));
                        findPass.Parameters.Add(new SqlParameter("@lastUpdatedBy", "ACME_GROUP"));
                        findPass.Parameters.Add(new SqlParameter("@passcode", 12345));
                        findPass.Parameters.Add(new SqlParameter("@organizationID", ddlOrg.SelectedItem.Value));


                        findPass.ExecuteNonQuery();
                        Response.Redirect("~/Login.aspx");
                    }
                    else
                    {
                        Session["organizationUser"] = new OrganizationUser(txtUserName.Text, PasswordHash.HashPassword(txtPassword.Text), txtEmail.Text);
                        Response.Redirect("~/CreateBusiness.aspx");
                    }




                }






            }

        }

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    protected void rbNew_CheckedChanged(object sender, EventArgs e)
    {
        ddlOrg.Visible = false;
    }

    protected void rbExisting_CheckedChanged(object sender, EventArgs e)
    {
        ddlOrg.Visible = true;
        
    }
}