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

public partial class DataInit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ProjectButton_Click(object sender, EventArgs e)
    {
        vcfTableAdapters.ProjectTableAdapter pta = new vcfTableAdapters.ProjectTableAdapter();
        for (int ii = 0; ii < 10;ii++ )
            pta.AddProject(Convert.ToString(ii), Convert.ToString(ii)  , 1);
    }
}
