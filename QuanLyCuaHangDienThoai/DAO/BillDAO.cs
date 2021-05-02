using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;

namespace QuanLyCuaHangDienThoai.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;
        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }
        private BillDAO() { BillDAO.instance = null; }
        public bool ThemBill(int manhanvien, int makhachhang, float khuyenmai)
        {
            string query = "EXEC USP_ThemBill @MaNhanVien , @MaKhachHang , @KhuyenMai";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { manhanvien, makhachhang, khuyenmai });
            return result > 0;
        }
        public int GetMaBillMoi()
        {
            string query = "EXEC USP_GetMaBillMoi";
            int result = (int)DataProvider.Instance.ExecuteScalar(query);
            return result;
        }
        public bool UpdateHDBH(int mahoadon)
        {
            string query = "EXEC USP_UpdateHDBH @MaHoaDon";
            int result = DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahoadon });
            return result > 0;
        }
        public DataTable ShowListHDBH()
        {
            string query = "SELECT * FROM dbo.HoaDonBanHang";
            DataTable data = new DataTable();
            data = DataProvider.Instance.ExecuteQuery(query);
            return data;
        }
        public DataTable ShowListHDNhap()
        {
            string query = "SELECT * FROM dbo.HoaDonNhap";
            DataTable data = new DataTable();
            data = DataProvider.Instance.ExecuteQuery(query);
            return data;
        }
    }

}
