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

            public static string FormatUserName_RealName(UserRow u)
            {
                return u.RealName + "[" + u.UserName + "]";
            }
        }
    }
}
