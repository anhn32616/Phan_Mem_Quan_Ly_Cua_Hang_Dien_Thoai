using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyCuaHangDienThoai.DTO;


namespace QuanLyCuaHangDienThoai.DAO
{
    public class KhachHangDAO
    {
        private static KhachHangDAO instance;

        public static KhachHangDAO Instance
        {
            get { if (instance == null) instance = new KhachHangDAO(); return KhachHangDAO.instance; }
            private set { KhachHangDAO.instance = value; }
        }
        private KhachHangDAO() { KhachHangDAO.instance = null; }
        public List<KhachHang> GetKhachHangList(string name)
        {
            List<KhachHang> khachHangList = new List<KhachHang>();
            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC USP_GetPhoneList");
            foreach (DataRow item in data.Rows)
            {
                KhachHang kh = new KhachHang(item);
                khachHangList.Add(kh);
            }
            return khachHangList;
        }
        public KhachHang GetKhachHangByID(string ID)
        {
            string query = "EXEC USP_GetKhachHangByID @MaKhachHang ";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { ID });
            foreach (DataRow item in data.Rows)
            {
                return new KhachHang(item);
            }
            return null;
        }
        public bool ThemKhachHang(string tenkhachhang, string dienthoai, string diachi)
        {
            string query = "EXEC USP_ThemKhachHang @TenKhachHang , @DienThoai , @DiaChi";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { tenkhachhang, dienthoai, diachi });
            return result > 0;
        }
        public int GetMaKhachHangMoi()
        {
            string query = "EXEC USP_GetMaKhachHangMoi";
            return (int)DataProvider.Instance.ExecuteScalar(query);
        }
    }
}
