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
public partial class DataInit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ProjectButton_Click(object sender, EventArgs e)
    {

        BLL.VCFDataSetTableAdapters.ProjectTableAdapter pta = new BLL.VCFDataSetTableAdapters.ProjectTableAdapter();
        for (int ii = 0; ii < 10;ii++ )
            pta.AddProject("Project"+Convert.ToString(ii), Convert.ToString(ii)  , 1);
    }

    protected void UserButton_Click(object sender, EventArgs e)
    {
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        for (int ii = 0; ii < 10; ii++)
            uta.AddDoner("Doner" + ii, "1", "1", "1", "1", "Doner" + ii, true, ii,"tel", "email", "addr", "comment");

    }

    protected void AddManager_Click(object sender, EventArgs e)
    {
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        for (int ii = 0; ii < 10; ii++)
            uta.AddManager("Manager" + ii, "1", "1", "1", "1", "Manager" + ii, true, ii, "tel", "email", "addr", "comment");
    }

    protected void AddBeneficiary_Click(object sender, EventArgs e)
    {

        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        for (int ii = 0; ii < 10; ii++)
            uta.AddBeneficiary("Beneficiary" + ii, "1", "1", "1", "1", "Beneficiary" + ii, true, ii, "tel", "email", "addr", "comment");
    }
    protected void DelAllUser_Click(object sender, EventArgs e)
    {
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        uta.DeleteAllUser();
    }
}
