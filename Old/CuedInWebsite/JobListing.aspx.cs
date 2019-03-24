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
    protected void Page_Load(object sender, EventArgs e)
    {
        List<String> careerClusterList = new List<string>();
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
        if(!IsPostBack)
        {
            for (int i = 0; careerClusterList.Count > i; i++)
                lstCareerCluster.Items.Add(careerClusterList[i]);
        }
    }

    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

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
}