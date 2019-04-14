using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class JobListing : System.Web.UI.Page
{
    OrganizationUser signedInUser;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        signedInUser = (OrganizationUser)Session["User"];
        List<String> careerClusterList = new List<string>();
        List<String> studentAttributeList = new List<string>();

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
            //populate the student attribute dropdown from the database
            using (SqlConnection connection = connect())
            {
                connection.Open();
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                select.CommandText = "SELECT * FROM StudentAttributes";
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    studentAttributeList.Add(cursor[0].ToString());
                }
                connection.Close();
            }
            for (int i = 0; studentAttributeList.Count > i; i++)
                lstStudentFields.Items.Add(studentAttributeList[i]);
        }
    }

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }



    protected void chkUnpaid_CheckedChanged(object sender, EventArgs e)
    {
        if (chkUnpaid.Checked == true)
        {
            txtPay.Enabled = false;
            ddlPayType.Enabled = false;
        }
        else
        {
            txtPay.Enabled = true;
            ddlPayType.Enabled = true;
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            Label11.Visible = true;
            lstStudentFields.Visible = true;
            Label12.Visible = false;
            txtURL.Visible = false;
        }
        else
        {
            Label11.Visible = false;
            lstStudentFields.Visible = false;
            Label12.Visible = true;
            txtURL.Visible = true;
        }
    }

    protected void chkDeadline_CheckedChanged(object sender, EventArgs e)
    {
        if (chkDeadline.Checked == true)
        {
            Label5.Visible = true;
            cldrDueDate.Visible = true;
        }
        else
        {
            Label5.Visible = false;
            cldrDueDate.Visible = false;
        }
    }

    protected void chkAge_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAge.Checked)
            txtMinimumAge.Visible = true;
        else
            txtMinimumAge.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int currentJobID = 0; //keeps track of the latest job added by the company
        string appType;
        if (RadioButtonList1.SelectedIndex == 0)
            appType = "Quick Apply";
        else
            appType = txtURL.Text;
        using (SqlConnection connection = connect())
        {

            connection.Open();
            //insert into the job table
            SqlCommand insert = new SqlCommand();
            insert.CommandText = "INSERT INTO Job VALUES(@OrganizationID, @JobTitle, @Pay, @PayType, @MinimumAge, @JobType, @JobDescription, @Deadline, @ApplicationType, @LastUpdated, @LastUpdatedBy, @CareerCluster)";
            insert.Connection = connection;
            insert.Parameters.AddWithValue("@OrganizationID", signedInUser.getOrgID());//Set to 0 by default until login works
            insert.Parameters.AddWithValue("@JobTitle", txtJobTitle.Text);
            if (chkUnpaid.Checked)
                insert.Parameters.AddWithValue("@Pay", 0);
            else
                insert.Parameters.AddWithValue("@Pay", Int32.Parse(txtPay.Text));
            insert.Parameters.AddWithValue("@PayType", ddlPayType.SelectedValue);
            if (chkAge.Checked)
                insert.Parameters.AddWithValue("@MinimumAge", Int32.Parse(txtMinimumAge.Text));
            else
                insert.Parameters.AddWithValue("@MinimumAge", 0);
            insert.Parameters.AddWithValue("@JobType", radJobType.SelectedValue);
            insert.Parameters.AddWithValue("@JobDescription", txtDescription.Text);
            if (chkDeadline.Checked)
                insert.Parameters.AddWithValue("@Deadline", cldrDueDate.SelectedDate.Year + "-" + cldrDueDate.SelectedDate.Month + "-" + cldrDueDate.SelectedDate.Day);
            else
                insert.Parameters.AddWithValue("@Deadline", DBNull.Value);
            insert.Parameters.AddWithValue("@ApplicationType", appType);
            insert.Parameters.AddWithValue("@LastUpdated", getDate());
            insert.Parameters.AddWithValue("@LastUpdatedBy", signedInUser.getUserName());
            insert.Parameters.AddWithValue("@CareerCluster", lstCareerCluster.SelectedValue);
            insert.ExecuteNonQuery();


            //Read the max ID from the table
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT MAX(JobID) FROM Job WHERE OrganizationID = @OrgID";
            select.Parameters.AddWithValue("@OrgID", signedInUser.getOrgID()); //need to change the 0 to whoever is signed in
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                currentJobID = Int32.Parse(cursor[0].ToString());
            }

            connection.Close();


            //if the job is a quick apply job, insert into the QuickApplyJobAttributes table the selected attributes
            if (RadioButtonList1.SelectedIndex == 0)
            {
                connection.Open();
                SqlCommand insertSdntAttribute = new SqlCommand();
                insertSdntAttribute.CommandText = "INSERT INTO QuickApplyJobAttributes VALUES(@StudentAttribute, @JobID, @LastUpdated, @LastUpdatedBy)";
                insertSdntAttribute.Connection = connection;
                for (int i = 0; i < lstStudentFields.Items.Count; i++)
                {
                    if (lstStudentFields.Items[i].Selected)
                    {
                        insertSdntAttribute.Parameters.Clear();
                        insertSdntAttribute.Parameters.AddWithValue("@StudentAttribute", lstStudentFields.Items[i].ToString());
                        insertSdntAttribute.Parameters.AddWithValue("@JobID", currentJobID);
                        insertSdntAttribute.Parameters.AddWithValue("@LastUpdated", getDate());
                        insertSdntAttribute.Parameters.AddWithValue("@LastUpdatedBy", "ACME GROUP");
                        insertSdntAttribute.ExecuteNonQuery();
                    }
                }
                connection.Close();
            }
        }
        clearFields();
    }
    public string getDate()
    {
        //Returns the current date in sql format
        string returnString = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;
        return returnString;
    }
    public void clearFields()
    {
        //clears the fields after a successful submit
        txtJobTitle.Text = "";
        txtDescription.Text = "";
        radJobType.ClearSelection();
        chkAge.Checked = false;
        txtMinimumAge.Text = "";
        txtMinimumAge.Visible = false;
        chkDeadline.Checked = false;
        Label5.Visible = false;
        cldrDueDate.Visible = false;
        txtPay.Text = "";
        ddlPayType.SelectedIndex = 0;
        chkUnpaid.Checked = false;
        txtPay.Enabled = true;
        ddlPayType.Enabled = true;
        lstCareerCluster.ClearSelection();
        RadioButtonList1.ClearSelection();
        lstStudentFields.ClearSelection();
        txtURL.Text = "";
        Label11.Visible = false;
        lstStudentFields.Visible = false;
        Label12.Visible = false;
        txtURL.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Remove("User");
        Response.Redirect("../Login.aspx");


    }
}
