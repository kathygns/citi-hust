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

public partial class Donation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox tb = FormView1.FindControl("DonationUserIDTextBox") as TextBox;
        tb.Text = Convert.ToString (new App_Code.SessionManager(this).Donor.UserID);

    }
}
