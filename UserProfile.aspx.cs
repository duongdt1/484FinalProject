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
    OrganizationUser signedInUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        signedInUser = (OrganizationUser)Session["User"];
        setOrgValues();
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
        }
    }

    protected void btnEditPassword_Click(object sender, EventArgs e)
    {

    }
    public void checkRadbuttons()
    {
        /*using (SqlConnection connection = connect())
        {
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "Select ";
        }*/
    }
    public void editMode(bool edit)
    {
        if (edit)
        {
            lblOrgName.Visible = false;
            lblOrgEmailAddress.Visible = false;
            lblCareerCluster.Visible = false;
            lblOrgType.Visible = false;
            txtOrgEmailAddress.Visible = true;
            txtOrgName.Visible = true;
            radOrgType.Visible = true;
            lstCareerCluster.Visible = true;
        }
        else
        {
            lblOrgName.Visible = true;
            lblOrgEmailAddress.Visible = true;
            lblCareerCluster.Visible = true;
            lblOrgType.Visible = true;
            txtOrgEmailAddress.Visible = false;
            txtOrgName.Visible = false;
            radOrgType.Visible = false;
            lstCareerCluster.Visible = false;
        }
    }
    public void setOrgValues()
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
                radOrgType.SelectedValue = cursor[0].ToString();
                lblOrgName.Text = cursor[1].ToString();
                lblCareerCluster.Text = cursor[2].ToString();
                lblOrgPhoneNumber.Text = cursor[3].ToString();
            }
        }
    }
}
