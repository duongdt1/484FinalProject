using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class CreateBusiness : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        List<String> careerClusterList = new List<string>();

        if (!IsPostBack)
        {
            //populate the career cluster dropdown from the database
            using (SqlConnection connection = connect())
            {
                connection.Open();
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                select.CommandText = "SELECT * FROM CareerCluster";
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    careerClusterList.Add(cursor[0].ToString());
                }
                connection.Close();
            }
            for (int i = 0; careerClusterList.Count > i; i++)
                lstCareerCluster.Items.Add(careerClusterList[i]);
        }
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        using (SqlConnection connection = connect())
        {

            SqlCommand createUser = new SqlCommand();
            createUser.Connection = connection;
            createUser.CommandText = "insert into[dbo].[Organization] values(@OrganizationName, @OrgType, @Cluster, @Phone,@lastUpdated, @lastUpdatedBy)";
            createUser.Parameters.Add(new SqlParameter("@OrganizationName", HttpUtility.HtmlEncode(txtOrgName.Text)));
            createUser.Parameters.Add(new SqlParameter("@OrgType", radOrgType.SelectedItem.Text));
            createUser.Parameters.Add(new SqlParameter("@Cluster", lstCareerCluster.SelectedItem.Text));
            createUser.Parameters.Add(new SqlParameter("@Phone", HttpUtility.HtmlEncode(txtPhone.Text)));
            createUser.Parameters.Add(new SqlParameter("@lastUpdated", DateTime.Today));
            createUser.Parameters.Add(new SqlParameter("@lastUpdatedBy", "TestUser"));
            connection.Open();
            createUser.ExecuteNonQuery();
        }

        using (SqlConnection connection2 = connect())
        {

            SqlCommand createUser = new SqlCommand();
            createUser.Connection = connection2;

            OrganizationUser newUser = (OrganizationUser)Session["organizationUser"];

            String test1 = newUser.getUserName();
            createUser.CommandText = "INSERT INTO organizationuser VALUES(@username, @password, @emailaddress,@lastUpdated, @lastUpdatedBy, @passcode, (select max(organizationID) from organization))";
            createUser.Parameters.AddWithValue("@username", newUser.getUserName());
            createUser.Parameters.AddWithValue("@password", newUser.getPassword());
            createUser.Parameters.AddWithValue("@emailaddress", newUser.getEmail());
            createUser.Parameters.AddWithValue("@lastUpdated", newUser.getLastUpdated());
            createUser.Parameters.AddWithValue("@lastUpdatedBy", newUser.getLastUpdatedBy());
            createUser.Parameters.AddWithValue("@passcode", 12345);
            connection2.Open();
            createUser.ExecuteNonQuery();
        }

        Response.Redirect("~/Login.aspx");
        //Insert password
        //System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
        //setPass.Connection = sc;

        //setPass.CommandText = "insert into[dbo].[Password] values((select max(//ID) from person), @OrganizationEmail, @Password)";
        //setPass.Parameters.Add(new SqlParameter("@UserName", userName));

        ////Hash password entered
        //setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text)));
        //setPass.ExecuteNonQuery();



        //lblMessage.Text = "User created. Your username is: " + userName;
        //txtFirstName.Enabled = false;
        //txtLastName.Enabled = false;
        //txtPassword.Enabled = false;
        //btnSubmit.Enabled = false;
        //lnkAnother.Visible = true;

    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
}

    /*protected void txtPassword_TextChanged(object sender, EventArgs e)
    {

    }*/

