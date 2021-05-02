using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DAO
{
    public class PhoneDAO
    {
        private static PhoneDAO instance;
        public static PhoneDAO Instance
        {
            get { if (instance == null) instance = new PhoneDAO(); return PhoneDAO.instance; }
            private set { PhoneDAO.instance = value; }
        }
        private PhoneDAO() { PhoneDAO.instance = null; }
        public List<Phone> SearchPhoneList(string name)
        {
            List<Phone> phoneList = new List<Phone>();
            DataTable data;
            if (name == "") data = DataProvider.Instance.ExecuteQuery("EXEC USP_GetPhoneList");
            else data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.DienThoai WHERE TenDienThoai LIKE N'%" + name + "%'");
            foreach (DataRow item in data.Rows)
            {
                Phone phone = new Phone(item);
                phoneList.Add(phone);
            }
            return phoneList;
        }
        public bool NhapThem(int madt, int manhanvien, int soluong)
        {
            string query = "EXEC USP_NhapThem @MaDT , @MaNhanVien , @SoLuong";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { madt, manhanvien, soluong });
            return result > 0;
        }
        public bool XoaDienThoai(int madt)
        {
            string query = "EXEC USP_XoaDienThoai @MaDT";
            int result = (int)DataProvider.Instance.ExecuteScalar(query, new object[] { madt });
            return result > 0;
        }
    }
}
