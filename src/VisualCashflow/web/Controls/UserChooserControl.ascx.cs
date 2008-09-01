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
using System.Text.RegularExpressions;
public partial class Controls_UserChooserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    #region Attributes
    public int UserID
    {
        get
        {
            Regex r = new Regex(@".+\[(.+)\]");
            string tmp=r.Match(this.UserTextBox.Text).Groups[1].Value;//得到UserName

            
            BLL.VCFDataSet.UserDataTable udt= new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetUserByUserName(tmp);
            if(udt.Count==1)
                return udt[0].UserID;
            else
                return -1;
        }
        set
        {
            BLL.VCFDataSet.UserDataTable udt = new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetUserByUserID(value);
            if(udt.Count==1)
            {
                this.UserTextBox.Text = VCFDataSet.UserDataTable.FormatUserName_RealName(udt[0]);
            }
        }
    }
    #endregion
    
}
