﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Project : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int x = new App_Code.SessionManager(this).Admin.Age;//check if it's admin

    }
}