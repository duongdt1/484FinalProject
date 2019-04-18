using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CUEDINMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //checking to see which user is logged in
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["User"] == null || Request.Cookies["loginCookie"] == null) //prevent user from going back and forth 
        {
            Response.Redirect("../Login.aspx");
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Remove("User");
        Response.Redirect("../Login.aspx");
        Request.Cookies["loginCookie"].Expires = DateTime.Now.AddSeconds(1);
    }
}
