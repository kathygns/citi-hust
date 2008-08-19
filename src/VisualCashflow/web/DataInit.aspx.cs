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


    protected void Init_Click(object sender, EventArgs e)
    {
        
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        //dbo.User中默认有Admin的
        //add Doner
        for (int ii = 0; ii < 10; ii++)
        {
            uta.AddDonor("Doner" + ii, "passwd", "SecureQuestion", "SecureAnswer", "Photo", "Doner" + ii, true, 30, "tel", "email", "addr", "comment");
        }
        //add Manager
        for (int ii = 0; ii < 10; ii++)
            uta.AddManager("Manager" + ii, "passwd", "SecureQuestion", "SecureAnswer", "Photo", "Manager" + ii, true, 30, "tel", "email", "addr", "comment", "bankAccount" + ii, "IdentiryCard" + ii, "position", 0);

        //add project
        BLL.VCFDataSetTableAdapters.ProjectTableAdapter pta = new BLL.VCFDataSetTableAdapters.ProjectTableAdapter();
        for (int ii = 0; ii < 10; ii++)
            pta.AddProject("Project" + Convert.ToString(ii), Convert.ToString(ii),uta.GetUserByUserName("Manager"+ii)[0].UserID);



    }
}
