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

using System.Collections.Generic;
using BLL;

public partial class DistributionFeedback : System.Web.UI.Page
{        
    protected void InitForm()
    {
        //BLL.VCFDataSet.UserRow U = new App_Code.SessionManager(this).Admin;
        BLL.VCFDataSet.UserRow U = new App_Code.SessionManager(this).Beneficiary;
        BLL.VCFDataSet.V_Distribution_ProjectDataTable VV = new BLL.VCFDataSetTableAdapters.V_Distribution_ProjectTableAdapter().GetDataByToUserID(U.UserID);

        DropDownList tddl = FormView1.FindControl("DropDownListProjectName") as DropDownList;
        tddl.Items.Clear();
        foreach (BLL.VCFDataSet.V_Distribution_ProjectRow VVR in VV)
        {
            tddl.Items.Add(new ListItem(VVR.Name, Convert.ToString(VVR.ProjectID)));
        }

        TextBox TB = FormView1.FindControl("FromUserIDTextBox") as TextBox;
        TB.Text = Convert.ToString(U.UserID);
        TextBox TB2 = FormView1.FindControl("DistributionDateTextBox") as TextBox;
        TB2.Text = DateTime.Now.ToString();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }

 
    protected void DropDownListProjectName_Init(object sender, EventArgs e)
    {
        InitForm();
    }
}
