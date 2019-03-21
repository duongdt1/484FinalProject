using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Testpage : System.Web.UI.Page
{
    protected void Submit(object sender, EventArgs e)
    {
        string message = "";
        foreach (ListItem item in lstStudents.Items)
        {
            if (item.Selected)
            {
                message += "Student Name : " + item.Text + ", Enrollment No : " + item.Value + "\\n";
            }
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }
}