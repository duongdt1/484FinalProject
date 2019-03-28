using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            if (Request.Cookies["loginCookie"] != null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        else
        {
            try
            {


                Label1.Text = "Hello " + Session["User"].ToString();
                Label2.Text = "Taking the value from the cookie, your username is " + Request.Cookies["loginCookie"].Value;
            }
            catch(Exception)
            {
                Label2.Text = "Taking the value from the cookie, your username is none because the cookie has expired";
            }

        }

    }


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Cookies["loginCookie"].Expires = DateTime.Now.AddDays(-31);
        Response.Redirect("Login.aspx");
    }
}