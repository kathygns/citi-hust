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
public partial class Project : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int x = new App_Code.SessionManager(this).Admin.Age;//check if it's admin

    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            Label l = e.Row.FindControl("StateLabel") as Label;
            if (l != null)
            {
                if (l.Text == "True")
                    l.Text = "正常";
                else
                    l.Text = "停止";
            }
               
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="DeActive")
        {
            int id = Convert.ToInt32  (  this.GridView2.DataKeys[Convert.ToInt32(e.CommandArgument)].Value);
            new BLL.VCFDataSetTableAdapters.ProjectTableAdapter().DeActive(id);
            GridView2.DataBind();
        }
    }
}
