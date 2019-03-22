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
    DateTime currentDate = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        currentDate = DateTime.Now;
        List<String> careerClusterList = new List<string>();
       
        if(!IsPostBack)
        {
            //populate the career cluster dropdown from the database
            using (SqlConnection connection = connect())
            {
                connection.Open();
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                select.CommandText = "SELECT * FROM CareerCluster";
                SqlDataReader cursor = select.ExecuteReader();
                while(cursor.Read())
                {
                    careerClusterList.Add(cursor[0].ToString());
                }
                connection.Close();
            }
        for (int i = 0; careerClusterList.Count > i; i++)
            lstCareerCluster.Items.Add(careerClusterList[i]);
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
        string appType;
        if (RadioButtonList1.SelectedIndex == 0)
            appType = "Quick Apply";
        else
            appType = txtURL.Text;
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand insert = new SqlCommand();
            insert.CommandText = "INSERT INTO Job VALUES(@OrganizationID, @JobTitle, @Pay, @PayType, @MinimumAge, @JobType, @JobDescription, @Deadline, @ApplicationType, @LastUpdated, @LastUpdatedBy)";
            insert.Connection = connection;
            insert.Parameters.AddWithValue("@OrganizationID", 0);//Set to 1 by default until login works
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
            insert.Parameters.AddWithValue("@LastUpdated", currentDate.Year + "-" + currentDate.Month + "-" + currentDate.Day);
            insert.Parameters.AddWithValue("@LastUpdatedBy", "ACME GROUP");
            insert.ExecuteNonQuery();
            connection.Close();
        }
    }
}
