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

public partial class Controls_ProjectChooserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
            return;
        DropDownList1.Items.Clear();

        BLL.VCFDataSet.ProjectDataTable pdt=new BLL.VCFDataSetTableAdapters.ProjectTableAdapter ().GetAllProject();
        
        foreach (BLL.VCFDataSet.ProjectRow r in pdt)
        {
            DropDownList1.Items.Add(new ListItem (r.Name,Convert.ToString (r.ProjectID)));
        }
    }


    public int ProjectID
    {
        get{
            return Convert.ToInt32(DropDownList1.SelectedValue);
        }
        set {
            DropDownList1.SelectedValue = Convert.ToString(value);
        }
    }
}
