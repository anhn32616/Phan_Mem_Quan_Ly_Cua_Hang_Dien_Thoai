using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DAO
{
    public class PhuKienDAO
    {
        private static PhuKienDAO instance;
        public static PhuKienDAO Instance
        {
            get { if (instance == null) instance = new PhuKienDAO(); return PhuKienDAO.instance; }
            private set { PhuKienDAO.instance = value; }
        }
        private PhuKienDAO() { PhuKienDAO.instance = null; }
        public List<PhuKien> LoadPhuKienList(int MaDT)
        {
            List<PhuKien> phuKienList = new List<PhuKien>();
            DataTable data = DataProvider.Instance.ExecuteQuery("EXEC USP_GetPhuKienList @TenDienThoai", new object[]{ MaDT});

            foreach (DataRow item in data.Rows)
            {
                PhuKien phuKien = new PhuKien(item);
                phuKienList.Add(phuKien);
            }
            return phuKienList;
        }
    }
}
