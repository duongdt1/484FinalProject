using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using OfficeOpenXml;
using System.IO;

public partial class Applications : System.Web.UI.Page
{
    int selectedJobID;
    OrganizationUser signedInUser;
    public static int appID;
    static bool isResume = false; // boolean to trip when 
    static bool isTranscript = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        signedInUser = (OrganizationUser)Session["User"];
        populateGrdApplication();

        selectedJobID = (int)Session["sJobID"];
        if (selectedJobID != -1)
        {
            try
            {
                populateGrdApplication(selectedJobID);
                string jobTitle = "";
                using (SqlConnection connection = connect()) // finds the title for the selected job using jobID
                {
                    SqlCommand select = new SqlCommand();
                    select.Connection = connection;
                    connection.Open();
                    select.CommandText = "SELECT JobTitle from Job WHERE JobID = @JobID";
                    select.Parameters.AddWithValue("@JobID", selectedJobID);
                    SqlDataReader cursor = select.ExecuteReader();
                    while (cursor.Read())
                    {
                        jobTitle = cursor[0].ToString();
                    }
                }
            }
            catch { }
        }
        
       
        
    }
    protected void grdApplicants_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
        Files.resume = new Files();
        Files.transcript = new Files();
        pnlGridView.Visible = false;
        pnlResults.Visible = true;
        selectedJobID = Int32.Parse(grdApplicants.Rows[e.NewSelectedIndex].Cells[2].Text);

            List<string> attributes = new List<string>();

        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT StudentAttribute from QuickApplyJobAttributes WHERE JobID = @jobID";
            appID = Int32.Parse(grdApplicants.Rows[e.NewSelectedIndex].Cells[1].Text);
            select.Parameters.AddWithValue("@jobID", selectedJobID);
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                attributes.Add(cursor[0].ToString());
            }
            //populate the table
            for (int i = 0; i < attributes.Count(); i++)
            {
                TableCell t1 = new TableCell();
                TableCell t2 = new TableCell();
                t1.Text = attributes[i];
                t1.Width = 150;
                t2 = matchAttribute(attributes[i], appID);
                TableRow tr = new TableRow();
                tr.Cells.Add(t1);
                tr.Cells.Add(t2);
                tblInfo.Rows.Add(tr);
            }
            if (isResume)
            {
                lblRelevantFiles.Text = "Relevant Files:";
                lblResume.Visible = true;
                btnDownloadResume.Visible = true;
                btnViewResume.Visible = true;
                lblResume.Text = "Resume: " + Files.resume.getFileName();
            }
            else
            {
                lblResume.Visible = false;
                btnDownloadResume.Visible = false;
                btnViewResume.Visible = false;
            }
            if (isTranscript)
            {
                lblRelevantFiles.Text = "Relevant Files:";
                lblTranscript.Visible = true;
                btnViewTranscript.Visible = true;
                btnDownloadTranscript.Visible = true;
                lblTranscript.Text = "Transcript: " + Files.transcript.getFileName();
            }
            else
            {
                lblTranscript.Visible = false;
                btnViewTranscript.Visible = false;
                btnDownloadTranscript.Visible = false;
            }
            if (!isResume && !isTranscript)
            {
                lblRelevantFiles.Text = "No Files Available at this time";
            }
            cursor.Close();

            //Select the correct dropdown option from the list based on the current database value, if the applicant has been approved or denied you cant change the value
            SqlCommand selectStatus = new SqlCommand();
            selectStatus.Connection = connection;
            selectStatus.CommandText = "SELECT Status From Application WHERE ApplicationID = @ApplicationID";
            selectStatus.Parameters.AddWithValue("@ApplicationID", appID);
            SqlDataReader cursor2 = selectStatus.ExecuteReader();
            while (cursor2.Read())
            {
                if (cursor2[0].ToString() != "Pending")
                {
                    ddlStatus.SelectedValue = cursor2[0].ToString();
                    if (cursor2[0].ToString() == "Approved" || cursor2[0].ToString() == "Declined")
                    {
                        ddlStatus.Enabled = false;
                    }
                }
                else
                {
                    ddlStatus.SelectedValue = "Reviewed";
                    ddlStatus.Enabled = true;
                }
            }
        }
    }
    public TableCell matchAttribute(string attribute, int applicationID)
    {
        //finds the attribute value from the student table to match the selected attribute
        string returnString = "";
        TableCell returnCell = new TableCell();
        SqlCommand select = new SqlCommand();
        select.CommandText = "SELECT * FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
        select.Parameters.Clear();
        select.Parameters.AddWithValue("@ApplicationID", applicationID);
        
        switch (attribute)
        {
            case "Age":
                select.CommandText = "SELECT Age FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
            case "Counselor Email":
                select.CommandText = "SELECT CounselorEmail FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
            case "Email":
                select.CommandText = "SELECT Email FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
            case "Grade Level":
                select.CommandText = "SELECT GradeLevel FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
            case "Name":
                select.CommandText = "SELECT FirstName + ' ' + MiddleName + ' ' + LastName FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
            case "Resume":
                isResume = true;
                break;
            case "Transcript":
                isTranscript = true;
                break;
            case "US Work Eligibility":
                select.CommandText = "SELECT AbleToWork FROM Student WHERE StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                break;
        }
        
            using (SqlConnection connection = connect())
            {
                select.Connection = connection;
                connection.Open();
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    returnString = cursor[0].ToString();
                }
            }
            returnCell.Text = returnString;
        
        if (isResume)//create a resume object 
        {
            using (SqlConnection connection = connect())
            {
                select.Connection = connection;
                connection.Open();
                select.CommandText = "SELECT FileID, FileName, FileType, UploadType, Data FROM Files WHERE UploadType = 'Resume' AND StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    Files.resume = new Files(Int32.Parse(cursor[0].ToString()), cursor[1].ToString(), cursor[2].ToString(), cursor[3].ToString(), (byte[])cursor[4]);
                }
            }
        }
        if (isTranscript)//create a transcript object 
        {
            using (SqlConnection connection = connect())
            {
                select.Connection = connection;
                connection.Open();
                select.CommandText = "SELECT FileID, FileName, FileType, UploadType, Data FROM Files WHERE UploadType = 'Transcript' AND StudentID = (SELECT StudentID FROM Application WHERE ApplicationID = @ApplicationID)";
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    Files.transcript = new Files(Int32.Parse(cursor[0].ToString()), cursor[1].ToString(), cursor[2].ToString(), cursor[3].ToString(), (byte[])cursor[4]);
                }
            }
        }
        return returnCell;
    }
    
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        pnlGridView.Visible = true;
        pnlResults.Visible = false;
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand update = new SqlCommand();
            update.Connection = connection;
            update.CommandText = "UPDATE Application SET Status = @Status WHERE ApplicationID = @AppID";
            update.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            update.Parameters.AddWithValue("@appID", appID);

            update.ExecuteNonQuery();
            populateGrdApplication();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
    public void populateGrdApplication()//populates grdApplication
    {
        using (SqlConnection connection = connect())
        {
            int orgID = signedInUser.getOrgID();
            connection.Open();

            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT Application.ApplicationID AS 'Application Number', Job.JobID as 'Job Number', Job.JobTitle AS 'Job Title', Student.FirstName + ' ' + Student.LastName AS Name, " +
                "Application.Status AS 'Application Status' FROM Application INNER JOIN Student ON Application.StudentID = Student.StudentID INNER JOIN Job ON Application.JobID = Job.JobID";
            SqlDataReader cursor = select.ExecuteReader();
            grdApplicants.DataSource = cursor;
            grdApplicants.DataBind();
        }
    }
    public void populateGrdApplication(int jobID)//populates grdApplication
    {
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT Application.ApplicationID AS 'Application Number', Job.JobID as 'Job Number', Job.JobTitle AS 'Job Title', Student.FirstName + ' ' + Student.LastName AS Name, " +
                "Application.Status AS 'Application Status' FROM Application INNER JOIN Student ON Application.StudentID = Student.StudentID INNER JOIN Job ON Application.JobID = Job.JobID WHERE Job.JobID = @JobID";
            select.Parameters.AddWithValue("@JobID", jobID);
            SqlDataReader cursor = select.ExecuteReader();
            grdApplicants.DataSource = cursor;
            grdApplicants.DataBind();
        }
    }


    protected void btnViewResume_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("Content-Length", Files.resume.getData().Length.ToString());
        Response.AddHeader("Content-Disposition", "inline; filename=" + Files.resume.getFileName());
        Response.AddHeader("Expires", "0");
        Response.AddHeader("Pragma", "cache");
        Response.AddHeader("Cache - Control", "private");
        Response.AddHeader("Accept-Ranges", "bytes");

        Response.ContentType = Files.resume.getFileType();
        Response.BinaryWrite(Files.resume.getData());
        Response.Flush();
        try { Response.End(); }
        catch { }
    }

    protected void btnViewTranscript_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;

        Response.AddHeader("Content-Length", Files.transcript.getData().Length.ToString());
        Response.AddHeader("Content-Disposition", "inline; filename=" + Files.transcript.getFileName());
        Response.AddHeader("Expires", "0");
        Response.AddHeader("Pragma", "cache");
        Response.AddHeader("Cache - Control", "private");
        Response.AddHeader("Accept-Ranges", "bytes");

        Response.ContentType = Files.transcript.getFileType();
        Response.BinaryWrite(Files.transcript.getData());
        Response.Flush();
        try { Response.End(); }
        catch { }
    }

    protected void btnDownloadResume_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = Files.resume.getFileType();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Files.resume.getFileName());
        Response.BinaryWrite(Files.resume.getData());
        Response.Flush();
        Response.End();
    }

    protected void btnDownloadTranscript_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = Files.transcript.getFileType();
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Files.transcript.getFileName());
        Response.BinaryWrite(Files.transcript.getData());
        Response.Flush();
        Response.End();
    }

    protected void linkTest_Click(object sender, EventArgs e)
    {
        ExcelPackage excel = new ExcelPackage();
        var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
        var totalCols = grdApplicants.Rows[0].Cells.Count;
        var totalRows = grdApplicants.Rows.Count;
        var headerRow = grdApplicants.HeaderRow;
        for (var i = 2; i <= totalCols; i++)
        {
            workSheet.Cells[1, i].Value = headerRow.Cells[i - 1].Text;
        }

        for (var j = 1; j <= totalRows; j++)
        {
            for (var i = 1; i <= totalCols; i++)
            {
                String value = grdApplicants.Rows[j - 1].Cells[i - 1].Text;
                workSheet.Cells[j + 1, i].Value = value;
            }
        }

        using (var memoryStream = new MemoryStream())
        {
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=export.xlsx");
            excel.SaveAs(memoryStream);
            memoryStream.WriteTo(Response.OutputStream);
            Response.Flush();
            Response.End();
        }
    }




    protected void btnReturnToJob_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Job.aspx");
    }
}

