using QuanLyCuaHangDienThoai.DAO;
using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangDienThoai
{
    public partial class fThongTinDienThoai : Form
    {
        private string tenDienThoai;
        private Phone phone;
        private int soLuong;
        private int soLuongMuaMax;
        private Account loginAccount;

        CultureInfo culture = new CultureInfo("vi-VN");

        public fThongTinDienThoai(string TenDienThoai, Account acc)
        {
            InitializeComponent();
            this.tenDienThoai = TenDienThoai;
            this.loginAccount = acc;
            this.Phone = null;
            this.soLuong = 1;
            this.soLuongMuaMax = 0;
            if (TenDienThoai != "")
            {
                Phone phone = GetPhone(TenDienThoai);
                textBox1.Text = phone.TenDienThoai;
                textBox2.Text = phone.MaDT.ToString();
                textBox3.Text = phone.GiaBanDT.ToString("c", culture);
                textBox4.Text = phone.SlHienTai.ToString();
                textBox5.Text = phone.PtGiamGia.ToString();
                textBox6.Text = phone.SlBanRaTrongNam.ToString();
                textBox7.Text = phone.DiemDanhGia.ToString();
                textBox8.Text = phone.Anh.ToString();
                textBox9.Text = phone.LuotDanhGia.ToString();
                pictureBox1.Image = new Bitmap(phone.Anh);
                richTextBox1.Text = phone.ThongSoKyThuat;
                this.soLuongMuaMax = phone.SlHienTai;
            }    
        }

        public string TenDienThoai { get => tenDienThoai; set => tenDienThoai = value; }
        internal Phone Phone { get => phone; set => phone = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }

        Phone GetPhone(string TenDienThoai)
        {
            string query = "EXEC USP_GetPhone @TenDienThoai ";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[]{ TenDienThoai});
            foreach (DataRow item in data.Rows)
            {
                return new Phone(item);
            }
            return null;
        }
        private void button6_Click(object sender, EventArgs e)
        {
            fNhapSoLuong f = new fNhapSoLuong();
            f.ShowDialog();
            this.soLuong = f.SoLuong;
	    // neu
            if (f.SoLuong <= 0 || f.SoLuong > this.soLuongMuaMax)
            {
                MessageBox.Show("Số Lượng Không Hợp Lệ!");
            }
            else
            {
                this.Phone = GetPhone(this.tenDienThoai);
                this.Close();
                //this.Dispose();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
            //this.Dispose();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            fNhapSoLuong f = new fNhapSoLuong();
            f.ShowDialog();
            if (MessageBox.Show("Xác nhận nhập thêm!", "Xác nhận", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Phone phone = GetPhone(this.tenDienThoai);
                PhoneDAO.Instance.NhapThem(phone.MaDT, this.loginAccount.MaNhanVien, f.SoLuong);
            }    
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Phone phone = GetPhone(this.tenDienThoai);
            if (PhoneDAO.Instance.XoaDienThoai(phone.MaDT))
            {
                MessageBox.Show("Xóa thành công!");
            }
            else
            {
                MessageBox.Show("Xóa thất bại!");
            }    
        }
    }
}

