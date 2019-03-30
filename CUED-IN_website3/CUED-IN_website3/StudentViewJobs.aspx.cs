using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;

public partial class StudentViewJobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            populateGrdJobs();
    }
    public void populateGrdJobs()
    {
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT Job.JobID as 'Job Number', Job.JobTitle as 'Job Title', Organization.OrganizationName as 'Organization', Job.MinimumAge As 'Minimum Age', " +
                "Job.careercluster as 'Career Cluster', Job.ApplicationType, Job.Deadline FROM Job INNER JOIN Organization ON Job.OrganizationID = Organization.OrganizationID";
            SqlDataReader cursor = select.ExecuteReader();


            grdJobList.DataSource = cursor;
            grdJobList.DataBind();
        }

    }
    
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }



    protected void grdJobList_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        int index = gvRow.RowIndex;
        int jobID = Int32.Parse(grdJobList.Rows[index].Cells[1].Text);
        using (SqlConnection connection = connect())
        {
            int studentID = 0;
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "Select MAX(StudentID) from Student";
            connection.Open();
            SqlDataReader cursor = select.ExecuteReader();
            while(cursor.Read())
            {
                studentID = Int32.Parse(cursor[0].ToString());
            }
            cursor.Close();
            SqlCommand insert = new SqlCommand();
            insert.Connection = connection;
            insert.CommandText = "INSERT INTO Application VALUES(@StudentID, @JobID, @Status, GETDATE(), 'ACME GROUP')";
            insert.Parameters.AddWithValue("@StudentID", studentID);
            insert.Parameters.AddWithValue("@JobID", jobID);
            insert.Parameters.AddWithValue("@Status", "Pending");
            insert.ExecuteNonQuery();
        }

    }
    protected void sendMail()
    {
        SmtpClient smtpClient = new SmtpClient();
        smtpClient.UseDefaultCredentials = false;
        smtpClient.Credentials = new NetworkCredential("cuedInDev.acmeGroup@gmail.com", "acme_group7254");
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.EnableSsl = true;
        smtpClient.Port = 587;
        smtpClient.Host = "smtp.gmail.com";
        MailMessage mail = new MailMessage();

        mail.From = new MailAddress("cuedInDev.acmeGroup@gmail.com", "ACME GROUP DEV TEAM");
        mail.Subject = "New Application for ";
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.To.Add(new MailAddress("kangcs@dukes.jmu.edu"));
        mail.Body = "";
        mail.BodyEncoding = System.Text.Encoding.UTF8;

        smtpClient.Send(mail);
    }
}
