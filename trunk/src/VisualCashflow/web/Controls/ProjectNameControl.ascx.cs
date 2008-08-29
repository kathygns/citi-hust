using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using BLL;
public partial class Controls_ProjectNameControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public int ProjectID
    {
        set
        {
            Label1.Text = new BLL.VCFDataSetTableAdapters.ProjectTableAdapter().GetProjectByProjectID(value)[0].Name;
        }
    }

}
