using QuanLyCuaHangDienThoai.DAO;
using QuanLyCuaHangDienThoai.DTO;
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
    public partial class fEditInformation : Form
    {
        private Account loginAccount;
        public string TenHienThi { get => tenHienThi; set => tenHienThi = value; }
        public Account LoginAccount { get => loginAccount; set => loginAccount = value; }

        private string tenHienThi;
        public fEditInformation(Account acc)
        {
            InitializeComponent();
            this.LoginAccount = acc;
            this.TenHienThi = this.LoginAccount.TenHienThi;
            ChangeAccount(LoginAccount);

        }
        void ChangeAccount(Account acc)
        {
            txbUser.Text = LoginAccount.TenDangNhap;
            textBox1.Text = LoginAccount.TenHienThi;
        }
        void UpdateAccount()
        {
            string TenDangNhap = txbUser.Text;
            string TenHienThi = textBox1.Text;
            string MatKhau = textBox2.Text;
            string MatKhauMoi = textBox3.Text;
            string NhapLai = textBox4.Text;
            if (!MatKhauMoi.Equals(NhapLai))
            {
                MessageBox.Show("Vui lòng nhập lại mật khẩu đúng với mật khẩu mới!");

            }
            else
            {
                if (AccountDAO.Instance.UpdateAccount(TenDangNhap, TenHienThi, MatKhau, MatKhauMoi))
                {
                    this.TenHienThi = TenHienThi;
                    MessageBox.Show("Cập nhật thành công");
                }
                else
                {
                    MessageBox.Show("Vui lòng điền lại đúng mật khẩu");
                }

            }    
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateAccount();
        }
    }
}
