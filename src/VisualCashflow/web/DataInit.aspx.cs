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
public partial class DataInit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Init_Click(object sender, EventArgs e)
    {
        
        BLL.VCFDataSetTableAdapters.UserTableAdapter uta = new BLL.VCFDataSetTableAdapters.UserTableAdapter();
        //dbo.User中默认有Admin的
        //add Doner
        for (int ii = 0; ii < 10; ii++)
        {
            uta.AddDonor("Donor" + ii, "passwd", "SecureQuestion", "SecureAnswer", "Photo", randomChineseName(3)+ii, true, 30, "tel", "email", "addr", "comment");
        }
        //add Manager
        for (int ii = 0; ii < 10; ii++)
            uta.AddManager("Manager" + ii, "passwd", "SecureQuestion", "SecureAnswer", "Photo", randomChineseName(3) + ii, true, 30, "tel", "email", "addr", "comment", "bankAccount" + ii, "IdentiryCard" + ii, "position", 0);

        //add project
        BLL.VCFDataSetTableAdapters.ProjectTableAdapter pta = new BLL.VCFDataSetTableAdapters.ProjectTableAdapter();
        for (int ii = 0; ii < 10; ii++)
            pta.AddProject("Project" + Convert.ToString(ii), randomChineseName(120),uta.GetUserByUserName("Manager"+ii/2)[0].UserID);
    }


    string s = "方鸿渐把信还给唐小姐时痴钝并无感觉过些时他才像从昏厥里醒过来开始不住的心痛就像因蜷曲而麻木的四肢到伸直了血脉流通就觉得剌痛昨天囫囵吞地忍受的整块痛苦当时没工夫辨别滋味现在牛反刍似的零星断续细嚼出深深没底的回味卧室里的沙发书桌卧室窗外的树木和草地天天碰见的人都跟往常一样丝毫没变对自己伤心丢脸这种大事全不理会似的奇怪的是他同时又觉得天地惨淡至少自己的天地变了相他个人的天地忽然从世人公共生活的天地里分出来宛如与活人幽明隔绝的孤鬼瞧着阳世的乐事自己插不进瞧着阳世的太阳自己晒不到人家的天地里他进不去而他的天地里谁都可以进来第一个拦不住的就是周太太一切做长辈的都不愿意小辈瞒着自己有秘密把这秘密哄出来逼出来是长辈应尽的责任唐家车夫走后方鸿渐上楼洗脸周太太半楼梯劈面碰见便想把昨夜女用人告诉的话问他好容易忍住了这证明刀不但负责任并且有涵养她先进餐室等他下来效成平日吃东西极快今天也慢条斯理地延宕着要听母亲问鸿渐话直到效成等不及上学校去了她还没风鸿渐来吃早点叫用人去催才知道他早偷偷出门了周太太因为枉费了克己工夫脾气发得加倍的大骂鸿渐混账说：就是住旅馆出门也得分付茶房一声现在他吃我周家的饭住周家的房子赚我周家的钱瞒了我外面去胡闹一早出门也不来请安目无尊长成什么规矩他还算是念书人家的儿子书上说的清早起对父母行个他没念过？他给女人迷错了头全没良心他不想想不靠我们周家的栽培什么酥小姐糖小姐会看中他周太太并不知道鸿渐认识唐小姐她因为芝麻酥糖那现成名词说酥顺口带说了糖信口胡扯而偏能一语道破天下未卜先知的预言家都是这样的";
    Random r = new Random();
    protected string  randomChineseName(int len )
    {
        
        string rst="";
        for (int ii=0;ii<len;ii++)
            rst+=s[r.Next(s.Length)];
        return rst;
    }
}
