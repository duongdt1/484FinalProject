﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {


        Session.Remove("User");
        Response.Redirect("../Login.aspx");


    }
}
