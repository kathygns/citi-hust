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

public partial class Controls_HeaderControl : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        App_Code.SessionManager sm = new App_Code.SessionManager(this.Page);

        DonationListLink.Visible = true;

        if (!_RequireLogin)
        {
            
        }

        if( sm.IsLogin)
        {
            BLL.VCFDataSet.UserRow u =sm.User;
            UserNameLabel.Text = BLL.VCFDataSet.UserDataTable.FormatUserName_RealName(u);
            UserNameLabel.Visible = true;
            EditProfileLink.Visible = true;
            LogOutLink.Visible = true;


            if (u.Role == Convert.ToInt16(BLL.VCFDataSet.UserDataTable.UserRoles.Donor))
            {
                DonationLink.Visible = true;
            }
/*
 *这里用<=是因为0123分别表示admin/manager/bene/donor
 */

            if (u.Role <= Convert.ToInt16(BLL.VCFDataSet.UserDataTable.UserRoles.Beneficiary))
            {
                DistributionLink.Visible = true;
            }
            if (u.Role <= Convert.ToInt16(BLL.VCFDataSet.UserDataTable.UserRoles.Manager))
            {
                UserManagementLink.Visible = true;
                CreateUserLink.Visible = true;
            }
            if (u.Role <= Convert.ToInt16(BLL.VCFDataSet.UserDataTable.UserRoles.Admin))
            {
                ProjectLink.Visible = true;
                AddProjectLink.Visible = true;
                
            }
            

        }
        else{
            LoginLink.Visible = true;
            RegisterLink.Visible = true;


        }
    }


    
    private bool _RequireLogin=true;

    public bool RequireLogin
    {
        set
        {
            this._RequireLogin = value;
        }
    }
     
}
