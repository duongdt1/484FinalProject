using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

public partial class Student : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        populatelstCareerCluster();
        List<string> schoolList = new List<string>();
        if (!IsPostBack)
        {
            using (SqlConnection connection = connect())
            {
                connection.Open();
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                select.CommandText = "SELECT * FROM School";
                SqlDataReader cursor = select.ExecuteReader();
                while (cursor.Read())
                {
                    schoolList.Add(cursor[1].ToString());
                }
                connection.Close();
            }
            for (int i = 0; schoolList.Count > i; i++)
                ddlSchool.Items.Add(schoolList[i]);
        }
    }
    public SqlConnection connect()
    {
        SqlConnection dbConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        return dbConnect;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        using (SqlConnection connection = connect())
        {
            int selectedSchool = 0;
            int currentStudent = 0;

            //Get the selected school from the db
            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT SchoolID FROM School WHERE SchoolName = @SchoolName";
            select.Parameters.AddWithValue("@SchoolName", ddlSchool.SelectedValue); 
            connection.Open();
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                selectedSchool = Int32.Parse(cursor[0].ToString());
            }
            connection.Close();

            //Insert into the student Table
            SqlCommand insertStudent = new SqlCommand();
            insertStudent.Connection = connection;
            insertStudent.CommandText = "INSERT INTO Student VALUES(@SchoolID, @FirstName, @LastName, @MiddleName, @Age, " +
                "@GradeLevel, @Email, @AbleToWork, @OneTimePass, @CounselorEmail, @LastUpdated, @LastUpdatedBy)";
            insertStudent.Parameters.AddWithValue("@SchoolID", selectedSchool);
            insertStudent.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            insertStudent.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            insertStudent.Parameters.AddWithValue("@MiddleName", HttpUtility.HtmlEncode(txtMiddleName.Text));
            insertStudent.Parameters.AddWithValue("@Age", HttpUtility.HtmlEncode(txtAge.Text));
            insertStudent.Parameters.AddWithValue("@GradeLevel", ddlGradeLevel.SelectedValue);
            insertStudent.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));
            insertStudent.Parameters.AddWithValue("@AbleToWork", radEligibility.SelectedValue);
            insertStudent.Parameters.AddWithValue("@OneTimePass", DBNull.Value);
            insertStudent.Parameters.AddWithValue("@CounselorEmail", HttpUtility.HtmlEncode(txtCounselorEmail.Text));
            insertStudent.Parameters.AddWithValue("@LastUpdated", getDate());
            insertStudent.Parameters.AddWithValue("@LastUpdatedBy", "ACME GROUP");
            connection.Open();
            insertStudent.ExecuteNonQuery();
            connection.Close();

            SqlCommand selectLastStudent = new SqlCommand();
            selectLastStudent.Connection = connection;
            selectLastStudent.CommandText = "SELECT MAX(StudentID) FROM Student";
            connection.Open();
            SqlDataReader cursor2 = selectLastStudent.ExecuteReader();
            while (cursor2.Read())
            {
                currentStudent = Int32.Parse(cursor2[0].ToString());
            }
            connection.Close();

            if (fuResume.HasFile)
            {
                //Insert into the files table
                string filename = Path.GetFileName(fuResume.PostedFile.FileName);
                string contentType = fuResume.PostedFile.ContentType;
                using (Stream fs = fuResume.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);

                        string query = "INSERT INTO Files VALUES(@FileName, @FileType, @Data, @UploadType, @LastUpdated, @LastUpdatedBy, @StudentID)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@FileName", filename);
                            cmd.Parameters.AddWithValue("@FileType", contentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@UploadType", "Resume");
                            cmd.Parameters.AddWithValue("@LastUpdated", getDate());
                            cmd.Parameters.AddWithValue("@LastUpdatedBy", "ACME GROUP");
                            cmd.Parameters.AddWithValue("@StudentID", currentStudent);

                            connection.Open();
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }
            }

            if (fuTranscript.HasFile)
            {
                //Insert into the files table
                string filename = Path.GetFileName(fuTranscript.PostedFile.FileName);
                string contentType = fuTranscript.PostedFile.ContentType;
                using (Stream fs = fuTranscript.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);

                        string query = "INSERT INTO Files VALUES(@FileName, @FileType, @Data, @UploadType, @LastUpdated, @LastUpdatedBy, @StudentID)";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = connection;
                            cmd.Parameters.AddWithValue("@FileName", filename);
                            cmd.Parameters.AddWithValue("@FileType", contentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@UploadType", "Transcript");
                            cmd.Parameters.AddWithValue("@LastUpdated", getDate());
                            cmd.Parameters.AddWithValue("@LastUpdatedBy", "ACME GROUP");
                            cmd.Parameters.AddWithValue("@StudentID", currentStudent);

                            connection.Open();
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }
            }
            connection.Open();
            for (int i = 0; i < lstCareerCluster.Items.Count; i++)
            {
                if (lstCareerCluster.Items[i].Selected)
                {
                    
                    SqlCommand insert = new SqlCommand();
                    insert.CommandText = "INSERT INTO CareerInterests VALUES(@CareerCluster, @StudentID, GETDATE(), 'Acme Group')";
                    insert.Connection = connection;
                    insert.Parameters.AddWithValue("@CareerCluster", lstCareerCluster.Items[i].Text);
                    insert.Parameters.AddWithValue("@StudentID", currentStudent);
                    insert.ExecuteNonQuery();
                }
            }
        }


        Response.Redirect("~/StudentViewJobs.aspx");
        
    }
    public string getDate()
    {
        //Returns the current date in sql format
        string returnString = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;
        return returnString;
    }

    public void populatelstCareerCluster()
    {
        using (SqlConnection connection = connect())
        {
            connection.Open();
            SqlCommand select = new SqlCommand();
            select.CommandText = "Select * FROM CareerCluster";
            select.Connection = connection;
            SqlDataReader cursor = select.ExecuteReader();
            while (cursor.Read())
            {
                lstCareerCluster.Items.Add(cursor[0].ToString());

            }

        }
    }
    
}
