using QuanLyCuaHangDienThoai.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangDienThoai
{
    public partial class fBillInfo : Form
    {
        void LoadBillInfoList(int MaHD)
        {

            string query = "EXEC USP_GetBillInfoList @MaHD";
            dtgvBillInfo.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { MaHD });
        }
        public string MaHD;
        public fBillInfo(int MaHD)
        {
            InitializeComponent();
            LoadBillInfoList(MaHD);
        }

    }
}
