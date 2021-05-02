using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangDienThoai.DAO
{
    public class AccountDAO
    {
        private static AccountDAO instance;
        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return AccountDAO.instance; }
            private set { AccountDAO.instance = value; }
        }
        private AccountDAO() { AccountDAO.instance = null; }
        public bool Login(string userName, string passWord)
        {
            string query = "EXEC USP_Login @userName , @passWord";
            int result = (int)DataProvider.Instance.ExecuteScalar(query, new object[] { userName, passWord });
            return result > 0;
        }
        public Account GetAccountLogin(string userName, string passWord)
        {
            string query = "EXEC USP_GetAccLogin @userName , @passWord ";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { userName, passWord });
            foreach (DataRow item in data.Rows)
            {
                return new Account(item);
            }
            return null;
        }
        public bool UpdateAccount(string tendangnhap, string tenhienthi, string matkhau, string matkhaumoi)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("EXEC USP_UpdateAccount @TenDangNhap , @TenHienThi , @MatKhau , @NhapLai", new object[] { tendangnhap, tenhienthi, matkhau, matkhaumoi });
            return result > 0;
        }
    }
}
