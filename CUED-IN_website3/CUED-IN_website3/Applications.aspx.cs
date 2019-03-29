using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Applications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection connection = connect())
        {
            int orgID = 0;
            connection.Open();
            SqlCommand findID = new SqlCommand();
            findID.Connection = connection;
            findID.CommandText = "Select OrganizationID FROM Organization WHERE OrganizationName = @organizationName ";
            findID.Parameters.AddWithValue("@organizationName", "Acme Group"); //needs to be changed when cookie information is done
            SqlDataReader read = findID.ExecuteReader();
            while (read.Read())
            {
                orgID = Int32.Parse(read[0].ToString());
            }
            read.Close();

            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT ApplicationID, Status from Application";
            
            SqlDataReader cursor = select.ExecuteReader();


            grdApplicants.DataSource = cursor;
            grdApplicants.DataBind();

        }
    }
    protected void grdApplicants_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
        pnlGridView.Visible = false;
        pnlResults.Visible = true;
        //List<string>[] applicantTable = new List<string>[2];
        List<string> attributes = new List<string>();

        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT StudentAttribute from QuickApplyJobAttributes WHERE JobID = (Select JobID from Application Where ApplicationID = @ApplicationID)";
            select.Parameters.AddWithValue("@ApplicationID", grdApplicants.Rows[e.NewSelectedIndex].Cells[1].Text);
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                attributes.Add(cursor[0].ToString());
            }
            for(int i = 0; i < attributes.Count(); i++)
            {
                TableCell t1 = new TableCell();
                t1.Text = attributes[i];
                TableRow tr = new TableRow();
                tr.Cells.Add(t1);
                tblInfo.Rows.Add(tr);
            }
        }
    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

}
