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
public partial class Controls_UserDetailControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    #region Attributes
    public int UserID
    {
        set
        {
            BLL.VCFDataSet.V_FormatedUserDataTable udt = new BLL.VCFDataSetTableAdapters.V_FormatedUserTableAdapter().GetUserByUserID(value);
            if (udt.Count == 1)
            {
                this.FormView1.DataSource = udt;
                this.FormView1.DataBind();
            }
        }
    }
    #endregion
    
}
