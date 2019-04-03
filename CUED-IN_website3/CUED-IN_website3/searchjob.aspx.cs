using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class searchjob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if(Session["User"]== null)
        {
            Response.Redirect("../Login.aspx");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        String search = "SELECT [JobID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [ApplicationType], [LastUpdated], [LastUpdatedBy], [careercluster] FROM [Job] where jobtitle Like '%" + HttpUtility.HtmlEncode(txtSearch.Text) + "%'";
        SqlCommand query = new SqlCommand(search, sc);
        sc.Open();
        query.ExecuteNonQuery();
        SqlDataAdapter adp = new SqlDataAdapter();
        adp.SelectCommand = query;
        DataSet ds = new DataSet();
        adp.Fill(ds, "jobtitle");
        GridViewSearch.DataSource = ds;
        GridViewSearch.DataBind();
    }
    protected void searchEdit(object sender, GridViewEditEventArgs e)
    {
        GridViewSearch.EditIndex = e.NewEditIndex;
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        String search = "SELECT [JobID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [ApplicationType], [careercluster] FROM [Job] where jobtitle Like '%" + HttpUtility.HtmlEncode(txtSearch.Text) + "%'";
        SqlCommand query = new SqlCommand(search, sc);
        sc.Open();
        query.ExecuteNonQuery();
        SqlDataAdapter apt = new SqlDataAdapter();
        apt.SelectCommand = query;
        DataSet ds = new DataSet();
        apt.Fill(ds, "jobtitle");
        GridViewSearch.DataSource = ds;
        GridViewSearch.DataBind();
        sc.Close();

    }
    protected void cancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewSearch.EditIndex = -1;
        GridViewSearch.DataBind();
        txtSearch.Text = String.Empty;
    }
    protected void searchUpdate(object sender, GridViewUpdateEventArgs e)
    {
        //SELECT [JobID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [careercluster] FROM [Job]   
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        int id = Convert.ToInt32(GridViewSearch.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow rw = (GridViewRow)GridViewSearch.Rows[e.RowIndex];
        String jobID = GridViewSearch.DataKeys[e.RowIndex].Values["JobID"].ToString();
        TextBox txtjobtitle = ((TextBox)rw.Cells[1].FindControl("txtjobtitle"));
        String jt = txtjobtitle.Text + "";
        TextBox txtpay = ((TextBox)rw.Cells[2].FindControl("txtpay"));
        double pay = Double.Parse(txtpay.Text);
        DropDownList ddpaytype = ((DropDownList)rw.Cells[3].FindControl("DropDownList" + 1));
        String pt = ddpaytype.SelectedValue.ToString();
        TextBox txtage = ((TextBox)rw.Cells[4].FindControl("txtage"));
        int age = Int32.Parse(txtage.Text);
        DropDownList ddjobtype = ((DropDownList)rw.Cells[5].FindControl("DropDownList2"));
        String jtpe = ddjobtype.SelectedValue.ToString();
        TextBox txtjobdesc = ((TextBox)rw.Cells[6].FindControl("txtdesc"));
        String jd = txtjobdesc.Text + "";
        TextBox deadline = ((TextBox)rw.Cells[7].FindControl("dead"));
        String dead = deadline.Text + "";
        DropDownList carclus = ((DropDownList)rw.Cells[8].FindControl("DropDownList3"));
        String cc = carclus.SelectedValue.ToString();
        GridViewSearch.EditIndex = -1;
        sc.Open(); //update the date and lastupdatedby!
        SqlCommand query = new SqlCommand("UPDATE job set jobtitle = '" + HttpUtility.HtmlEncode(jt) + "' , pay ='"
         + HttpUtility.HtmlEncode(pay) + "', paytype ='" + HttpUtility.HtmlEncode(pt) + "', minimumage = '" + HttpUtility.HtmlEncode(age) +
                 "', jobtype = '" + HttpUtility.HtmlEncode(jtpe) + "', jobdescription = '" + HttpUtility.HtmlEncode(jd) + "', deadline = '" + HttpUtility.HtmlEncode(dead)
                  + "', careercluster = '" + HttpUtility.HtmlEncode(cc) + "' where jobID= '" + jobID + "'", sc);
        query.ExecuteNonQuery();
        GridViewSearch.DataBind();
        sc.Close();
        txtSearch.Text = String.Empty;

    }
    protected void deleteRow(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        int id = Convert.ToInt32(GridViewSearch.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow rw = (GridViewRow)GridViewSearch.Rows[e.RowIndex];
        String jobID = GridViewSearch.DataKeys[e.RowIndex].Values["JobID"].ToString();
        var label = ((Label)rw.Cells[0].FindControl("Label9"));
        sc.Open();
        SqlCommand cmd = new SqlCommand("Delete From application where jobid = @id", sc);
        cmd.Parameters.AddWithValue("@id", Int32.Parse(label.Text));
        SqlCommand cmd2 = new SqlCommand("Delete From job where jobid = @id", sc);
        cmd2.Parameters.AddWithValue("@id", Int32.Parse(label.Text));
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        GridViewSearch.DataBind();
        sc.Close();
    }

    /*protected void DropDownList2(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow
           && e.Row.RowIndex == GridViewSearch.EditIndex)
        { 
            DropDownList ddl = (DropDownList)e.Row.Cells[5].FindControl("DropDownList2");
            ddl. = ddl
            TextBox txtpay = ((TextBox)e.Row.FindControl("txtpay"));
            if (jtpe == "Volunteer")
            {
                txtpay.ReadOnly = true;
            }
        } 
        //TextBox txtpay = ((TextBox)e.Row.FindControl("txtpay"));
       
         //   {
              //  txtpay.ReadOnly = true;
           // }
        
    }*/

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl2 = sender as DropDownList;
        GridViewRow row = (GridViewRow)ddl2.Parent.Parent;
        int index = row.RowIndex;
        DropDownList ddl = (DropDownList)row.Cells[5].FindControl("DropDownList2");
        String x = ddl.SelectedValue.ToString();
        TextBox textpay = (TextBox)row.Cells[2].FindControl("txtpay");
        /*foreach (GridViewRow row in GridViewSearch.Rows)
        {
            DropDownList ddl = ddl2.NamingContainer.FindControl("DropDownList4") as DropDownList;
           // TextBox pay = row.FindControl("txtpay2") as TextBox;
            TextBox txtpay = ddl2.NamingContainer.FindControl("txtpay") as TextBox;
            //int pt = ddl.SelectedIndex;*/
        if (ddl.SelectedValue == "Volunteer")
        {
            textpay.ReadOnly = true;
            textpay.BackColor = System.Drawing.Color.Gray;
            textpay.Text = "0.0";
        }
        else
        {
            textpay.ReadOnly = false;
            textpay.BackColor = System.Drawing.Color.Transparent;
        }
    }
}
