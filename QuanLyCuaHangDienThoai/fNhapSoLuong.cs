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
    public partial class fNhapSoLuong : Form
    {
        private int soLuong;
        public fNhapSoLuong()
        {
            InitializeComponent();
            this.soLuong = 1;
        }

        public int SoLuong { get => soLuong; set => soLuong = value; }

        private void button1_Click(object sender, EventArgs e)
        {
            this.soLuong = (int)numericUpDown1.Value;
            this.Close();
        }
    }
}
