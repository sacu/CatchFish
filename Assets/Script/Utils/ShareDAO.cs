namespace Utils
{
    public class ShareDAO
    {
        public string userName;
        public string passWord;

        public static ShareDAO getShareDAO(string userName, string passWord)
        {
            return new ShareDAO(userName, passWord);
        }

        private ShareDAO(string userName, string passWord)
        {

        }
    }
}
