using QuanLyCuaHangDienThoai.DAO;
using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyCuaHangDienThoai
{
    public partial class fLogin : Form
    {
        private Account loginAccout;

        public Account LoginAccout { get => loginAccout; set => loginAccout = value; }

        public fLogin()
        {
            InitializeComponent();

        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            string userName = txbUser.Text;
            string passWord = txbPassWord.Text;
            this.loginAccout = AccountDAO.Instance.GetAccountLogin(userName, passWord);
            if (Login(userName, passWord))
            {
                this.Hide();
                fTableManager f = new fTableManager(this.loginAccout); 
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!");
            }
        }
        bool Login(string userName, string passWord)
        {
            return AccountDAO.Instance.Login(userName, passWord);
        }

        private void fLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát khỏi chương trình ?", "Thông báo!", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.Yes)
            {
                e.Cancel = true;
            }   
        }

        private void checkShowPass_CheckedChanged(object sender, EventArgs e)
        {
            txbPassWord.UseSystemPasswordChar = !txbPassWord.UseSystemPasswordChar;
        }
    }
}
