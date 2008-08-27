namespace BLL {


    public partial class VCFDataSet
    {
        public partial class UserDataTable
        {
            public enum UserRoles
            {
                Admin=0,
                Manager,
                Beneficiary,
                Donor,
            }
            /// <summary>
            /// 注意同时要修改 Regex r = new Regex(@".+[(.+)]");
            /// </summary>
            /// <param name="u"></param>
            /// <returns></returns>
            public static string FormatUserName_RealName(UserRow u)
            {
                return u.RealName + "[" + u.UserName + "]";

            }
        }
    }
}
