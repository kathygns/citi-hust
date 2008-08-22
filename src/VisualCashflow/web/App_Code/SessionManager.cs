using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using BLL;


namespace App_Code
{
    /// <summary>
    /// 对Session进行包装，简化对Session的操作。
    /// 使用方法： BLL.VCFDataSet.UserRow u =new App_Code.SessionManager(this).Admin;//判断当前用户是不是Admin；
    /// 
    ///     或“    int x = new App_Code.SessionManager(this).Admin.Age;//check if it's admin”
    ///     
    /// </summary>
    public class SessionManager
    {
        System.Web.UI.Page page = null;
        public SessionManager(System.Web.UI.Page page)
        {
            this.page = page;
            //for debug :设置默认值。
            
            if (page.Session["User"] == null)
            {
                page.Session["User"] = new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetUserByUserID(0)[0];
            }
        }

        /// <summary>
        /// Session["User"]
        /// </summary>
        public BLL.VCFDataSet.UserRow User
        {
            get
            {
             
                if (null == page.Session["User"])
                {
                    Message = "对不起，您还没有登陆！请登陆：";
                    page.Response.Redirect("Login.aspx");
                    return null;
                }
                try
                {
                    return page.Session["User"] as BLL.VCFDataSet.UserRow;
                }catch{
                    //page.Session["Message"] = "对不起，您还没登陆或页面已过期！请登陆：";
                    Message = "对不起，您还没登陆或页面已过期！请登陆：";
                    page.Response.Redirect("Login.aspx");
                    return null;
                }
            }
            set
            {
                page.Session["User"] = value;
            }
        }


        public string Message
        {
            get
            {
                return page.Session["Message"] as string;
            }
            set
            {
                page.Session["Message"] = value;
            }
        }


        #region assert


        /// <summary>
        /// assert User is Admin
        /// </summary>
        public BLL.VCFDataSet.UserRow Admin
        {
            get
            {
                if (User.Role == Convert.ToInt32(BLL.VCFDataSet.UserDataTable.UserRoles.Admin))
                    return User;
                Message = "对不起，您不是系统管理员";
                page.Response.Redirect("Error.aspx");
                return null;
            }
        }

        /// <summary>
        /// assert User is Manager
        /// </summary>
        public BLL.VCFDataSet.UserRow Manager
        {
            get
            {
                if (User.Role == Convert.ToInt32(BLL.VCFDataSet.UserDataTable.UserRoles.Manager))
                    return User;
                Message = "对不起，您不是管理员";
                page.Response.Redirect("Error.aspx");
                return null;
            }
        }
        /// <summary>
        /// assert User is Beneficiary
        /// </summary>
        public BLL.VCFDataSet.UserRow Beneficiary
        {
            get
            {
                if (User.Role == Convert.ToInt32(BLL.VCFDataSet.UserDataTable.UserRoles.Beneficiary))
                    return User;
                Message = "对不起，您不是接收者";
                page.Response.Redirect("Error.aspx");
                return null;
            }
        }
        /// <summary>
        /// assert User is Donor
        /// </summary>
        public BLL.VCFDataSet.UserRow Donor
        {
            get
            {
                if (User.Role == Convert.ToInt32(BLL.VCFDataSet.UserDataTable.UserRoles.Donor))
                    return User;
                Message = "对不起，您不是捐款人";
                page.Response.Redirect("Error.aspx");
                return null;
            }
        }


    }

        #endregion
}

