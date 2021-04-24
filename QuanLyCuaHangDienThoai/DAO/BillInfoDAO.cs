using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DAO
{
    public class BillInfoDAO
    {
        private static BillInfoDAO instance;
        public static BillInfoDAO Instance
        {
            get { if (instance == null) instance = new BillInfoDAO(); return BillInfoDAO.instance; }
            private set { BillInfoDAO.instance = value; }
        }
        private BillInfoDAO() { BillInfoDAO.instance = null; }
        public bool ThemBillInfo(int mahoadon, int masanpham, int soluong)
        {
            string query = "EXEC USP_ThemBillInfo @MaHoaDon , @MaSanPham , @SoLuong";
            int result = (int)DataProvider.Instance.ExecuteNonQuery(query, new object[] { mahoadon, masanpham, soluong });
            return result > 0;
        }
    }
}
