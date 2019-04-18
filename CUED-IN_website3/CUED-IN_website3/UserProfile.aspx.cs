using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class UserProfile : System.Web.UI.Page
{
    public static bool chgPass; //handles the controls for when a user is changing passwords
    OrganizationUser signedInUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        signedInUser = (OrganizationUser)Session["User"];
        populateLstCareerCluster();
        if (!IsPostBack)
        {
            setOrgValues();
            chgPass = true;
        }
    }

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    protected void btnEditOrg_Click(object sender, EventArgs e)
    {
        if (btnEditOrg.Text == "Edit")
        {
            btnEditOrg.Text = "Save";
            editMode(true);
        }
        else
        {
            btnEditOrg.Text = "Edit";
            editMode(false);
            //if the save button is pressed, update the database
            using (SqlConnection connection = connect())
            {
                connection.Open();
                SqlCommand update = new SqlCommand();
                update.Connection = connection;
                update.CommandText = "UPDATE Organization SET OrganizationName = @OrgName, OrganizationType = @OrgType, CareerCluster = @CareerCluster, PhoneNumber = @PhoneNumber, LastUpdated = GETDATE() WHERE OrganizationID = @OrgID";
                update.Parameters.AddWithValue("@OrgName", txtOrgName.Text);
                update.Parameters.AddWithValue("@OrgType", radOrgType.SelectedValue);
                update.Parameters.AddWithValue("@CareerCluster", lstCareerCluster.SelectedValue);
                update.Parameters.AddWithValue("@PhoneNumber", txtOrgPhone.Text);
                update.Parameters.AddWithValue("@OrgID", signedInUser.getOrgID());
                update.ExecuteNonQuery();
            }
            setOrgValues();
        }
    }

    protected void btnEditPassword_Click(object sender, EventArgs e)
    {
        editPassword(chgPass);
    }

    public void editMode(bool edit)//toggles the page controls for an organization based on the mode
    {
        if (edit)
        {
            lblOrgName.Visible = false;
            lblCareerCluster.Visible = false;
            lblOrgType.Visible = false;
            txtOrgName.Visible = true;
            radOrgType.Visible = true;
            lstCareerCluster.Visible = true;
            txtOrgPhone.Visible = true;
        }
        else
        {
            lblOrgName.Visible = true;
            lblCareerCluster.Visible = true;
            lblOrgType.Visible = true;
            txtOrgName.Visible = false;
            radOrgType.Visible = false;
            lstCareerCluster.Visible = false;
            txtOrgPhone.Visible = false;
        }
    }

    public void editPassword(bool edit)
    {
        if (edit)
        {
            btnEditPassword.Visible = false;
            lblPass.Visible = true;
            lblPassConfirm.Visible = true;
            txtPass.Visible = true;
            txtPassConfirm.Visible = true;
            btnCancel.Visible = true;
            btnSave.Visible = true;
            chgPass = false;
        }
        else
        {
            btnEditPassword.Visible = true;
            lblPass.Visible = false;
            lblPassConfirm.Visible = false;
            txtPass.Visible = false;
            txtPassConfirm.Visible = false;
            btnCancel.Visible = false;
            btnSave.Visible = false;
            txtPassConfirm.Text = "";
            txtPass.Text = "";
            chgPass = true;
        }
    }
    public void setOrgValues()//sets the values of the controls in the form with values from the database
    {
        using (SqlConnection connection = connect())
        {
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT OrganizationType, OrganizationName, CareerCluster, PhoneNumber FROM Organization WHERE OrganizationID = @OrgID";
            select.Parameters.AddWithValue("@OrgID", signedInUser.getOrgID());
            connection.Open();
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                lblOrgType.Text = cursor[0].ToString();
                radOrgType.SelectedValue = cursor[0].ToString();
                lblOrgName.Text = cursor[1].ToString();
                txtOrgName.Text = cursor[1].ToString();
                lblCareerCluster.Text = cursor[2].ToString();
                lstCareerCluster.SelectedValue = cursor[2].ToString();
                lblOrgPhoneNumber.Text = cursor[3].ToString();
                txtOrgPhone.Text = cursor[3].ToString();
            }
        }
        using (SqlConnection connection = connect())
        {
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            connection.Open();
            select.CommandText = "SELECT Username, Notifications FROM OrganizationUser WHERE Username = @Username";
            select.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                lblUsername.Text = cursor[0].ToString();
                radNotifications.SelectedValue = cursor[1].ToString();
            }
        }
    }
    public void populateLstCareerCluster()
    {
        //populates the list box of career cluster items
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT * FROM CareerCluster";
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                lstCareerCluster.Items.Add(cursor[0].ToString());
            }
        }
    }

    protected void radNotifications_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection connection = connect())
        {
            SqlCommand update = new SqlCommand();
            update.Connection = connection;
            connection.Open();
            update.CommandText = "UPDATE OrganizationUser SET Notifications = @Notifications WHERE Username = @Username";
            update.Parameters.AddWithValue("@Notifications", radNotifications.SelectedValue);
            update.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            update.ExecuteNonQuery();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)//change the password
    {
        using (SqlConnection connection = connect())
        {
            SqlCommand update = new SqlCommand();
            update.Connection = connection;
            connection.Open();
            update.CommandText = "UPDATE OrganizationUser SET Password = @Password WHERE Username = @Username";
            update.Parameters.AddWithValue("@Password", PasswordHash.HashPassword(txtPass.Text));
            update.Parameters.AddWithValue("@Username", signedInUser.getUserName());
            update.ExecuteNonQuery();
        }
        editPassword(chgPass);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        editPassword(chgPass);
    }
}
