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
public partial class Controls_InferiorUserChooserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        BLL.VCFDataSet.UserDataTable udt = new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetInferiorBySuperiorUserAndProject(uid, pid);
        DropDownList1.Items.Clear();
        foreach (BLL.VCFDataSet.UserRow r in udt )
        {
            DropDownList1.Items.Add(new ListItem(r.UserName, r.UserID.ToString()));
        }
    }



    #region Attributes

    private int uid;
    private int pid;

    public int SuperiorUserID
    {
        set
        {
            this.uid = value;
        }
    }


    public int ProjectID
    {
        set
        {
            this.pid = value;
        }
    }

    public int InferiorUserID
    {
        get{
            return Convert.ToInt32(DropDownList1.SelectedValue);
        }
    }
    #endregion


}
