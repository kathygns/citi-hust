using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using BLL;

/// <summary>
/// UserNameSuggestionService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class UserNameSuggestionService : System.Web.Services.WebService
{

    public UserNameSuggestionService()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    //[WebMethod]
    //public string HelloWorld()
    //{
    //    return "Hello World";
    //}
    [WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        if (count == 0)
        {
            count = 10;
        }

        if (prefixText.Equals("xyz"))
        {
            return new string[0];
        }

        //Random random = new Random();
        List<string> items = new List<string>();
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();

        BLL.VCFDataSet.UserDataTable udt=uta.GetTopNSystemUserWhereRealNameStartWith(prefixText, count);

        for (int i = 0; i < udt.Count; i++)
        {
            items.Add(VCFDataSet.UserDataTable.FormatUserName_RealName(udt[i]));
        }
        return items.ToArray();

    }

}

