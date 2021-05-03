using QuanLyCuaHangDienThoai.DAO;
using QuanLyCuaHangDienThoai.DTO;
using System;
using System.Collections;
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
    public partial class fTableManager : Form
    {
        static int SoLuong = 0;
        private Account loginAccount;
        private float tongTien;
        //private float tongGiam;
        private List<PhoneSelect> listPhoneSelect;
        private int maKhachHang;
        private KhachHang khachHang;
        private float giamGiaUuDai;
        private float tongTienDienThoai;
        private List<PhuKien> listPhuKienSelect;

        public float TongTien { get => tongTien; set => tongTien = value; }
        internal List<PhoneSelect> ListPhoneSelect { get => listPhoneSelect; set => listPhoneSelect = value; }
        //public float TongGiam { get => tongGiam; set => tongGiam = value; }
        public Account LoginAccount { get => loginAccount; set => loginAccount = value; }


        CultureInfo culture = new CultureInfo("vi-VN");


        public fTableManager(Account acc)
        {
            this.tongTien = 0;
            this.tongTienDienThoai = 0;
            this.khachHang = null;
            this.giamGiaUuDai = 0;
            this.ListPhoneSelect = new List<PhoneSelect>();
            this.loginAccount = acc;
            InitializeComponent();
            LoadInfo();
        }
        #region Method
        void LoadInfo()
        {
            cbPhanKhuc.SelectedItem = "Tất cả";
            cbSapXep.SelectedItem = "Giá Tăng Dần";
            cbView.SelectedItem = "List";
            LoadPhone(0, 999999999);
            textBox5.Text = Convert.ToDouble(textBox5.Text).ToString("c", culture);
            thôngTinTàiKhoảnToolStripMenuItem.Text += " [ " + this.LoginAccount.TenHienThi + " ]";
        }
        void SapXepTang(List<Phone> phoneList)
        {
            phoneList.Sort(
            (p1, p2) =>
            {
                if (p1.GiaBanDT > p2.GiaBanDT) return 1;
                else if (p1.GiaBanDT == p2.GiaBanDT) return 0;
                return -1;
            }
            );
        }
        void SapXepGiam(List<Phone> phoneList)
        {
            phoneList.Sort(
            (p1, p2) =>
            {
                if (p1.GiaBanDT < p2.GiaBanDT) return 1;
                else if (p1.GiaBanDT == p2.GiaBanDT) return 0;
                return -1;
            }
            );
        }
        void SapXepDanhGia(List<Phone> phoneList)
        {
            phoneList.Sort(
            (p1, p2) =>
            {
                if (p1.DiemDanhGia < p2.DiemDanhGia) return 1;
                else if (p1.DiemDanhGia == p2.DiemDanhGia) return 0;
                return -1;
            }
            );
        }
        void SapXepBanChay(List<Phone> phoneList)
        {
            phoneList.Sort(
            (p1, p2) =>
            {
                if (p1.SlBanRaTrongNam < p2.SlBanRaTrongNam) return 1;
                else if (p1.SlBanRaTrongNam == p2.SlBanRaTrongNam) return 0;
                return -1;
            }
            );
        }
        void LoadPhone(float Min, float Max)
        {
            IconList.Images.Clear();
            lvPhone.Items.Clear();
            SoLuong = 0;
            List<Phone> phoneList = PhoneDAO.Instance.SearchPhoneList(textBox1.Text);
            switch (cbSapXep.SelectedItem)
            {
                case "Giá Tăng Dần":
                    SapXepTang(phoneList);
                    break;
                case "Giá Giảm Dần":
                    SapXepGiam(phoneList);
                    break;
                case "Đánh Giá Cao Nhất":
                    SapXepDanhGia(phoneList);
                    break;
                case "Bán Chạy Nhất":
                    SapXepBanChay(phoneList);
                    break;
            }
            foreach (Phone item in phoneList)
            {
                if (item.GiaBanDT >= Min && item.GiaBanDT < Max)
                {
                    IconList.Images.Add(new Bitmap(item.Anh));
                    ListViewItem lsvItem = new ListViewItem(item.TenDienThoai.ToString());
                    lsvItem.SubItems.Add(item.MaDT.ToString());
                    lsvItem.SubItems.Add(item.GiaBanDT.ToString("c", culture));
                    lsvItem.SubItems.Add((item.PtGiamGia * item.GiaBanDT / 100).ToString("c", culture));
                    lsvItem.SubItems.Add(item.DiemDanhGia.ToString() + " / 5\n\n" + item.LuotDanhGia.ToString() + " đánh giá");
                    lsvItem.SubItems.Add(item.SlBanRaTrongNam.ToString());
                    lsvItem.ImageIndex = SoLuong;
                    SoLuong++;
                    lvPhone.Items.Add(lsvItem);
                }
                

            }
            lvPhone.LargeImageList = IconList;
            label4.Text = "Có " + SoLuong.ToString() + " kết quả được tìm thấy.";

        }
        void ThongTinSanPham(string s, Account acc)
        {
            fThongTinDienThoai f = new fThongTinDienThoai(s, acc);
            f.ShowDialog();
            if (f.Phone != null) InsertListPhoneSelect(f.Phone, f.SoLuong);
        }
        //them dien thoai dc chon vao danh sach listPhoneSelect
        void InsertListPhoneSelect(Phone phone, int soluong)
        {
            if (listPhoneSelect.Count != 0)
            {
                int i = 0;
                {
                    foreach (PhoneSelect item in listPhoneSelect)
                    {
                        if (item.Phone.MaDT == phone.MaDT)
                        {
                            listPhoneSelect[i].SoLuong += soluong;
                            return;
                        }
                        i++;
                    }
                    listPhoneSelect.Add(new PhoneSelect(phone, soluong));
                }
            }
            else listPhoneSelect.Add(new PhoneSelect(phone, soluong));
        }
        void UpdateHoaDon()
        {
            listView1.Items.Clear();
            this.tongTienDienThoai = 0;
            foreach(PhoneSelect item in this.listPhoneSelect)
            {
                ListViewItem lsvItem = new ListViewItem(item.Phone.TenDienThoai.ToString());
                lsvItem.SubItems.Add(item.SoLuong.ToString());
                lsvItem.SubItems.Add(item.Phone.GiaBanDT.ToString("c",culture));
                lsvItem.SubItems.Add((item.Phone.PtGiamGia * item.Phone.GiaBanDT / 100).ToString("c", culture));
                listView1.Items.Add(lsvItem);
                this.tongTienDienThoai += (item.Phone.GiaBanDT - item.Phone.GiaBanDT * item.Phone.PtGiamGia / 100) *item.SoLuong;
                this.tongTien = this.tongTienDienThoai;
                textBox5.Text = this.tongTien.ToString("c", culture);
            }
        }
        #endregion
        #region Event
        // Xử lý với người mua là khách hàng cũ
        private void cbOldCustomers_CheckedChanged(object sender, EventArgs e)
        {
            if (cbOldCustomers.Checked)
            {
                tbCustomerCode.Enabled = true;
                btnCheckOldCustomer.Enabled = true;
                textBox2.ReadOnly = true;
                textBox3.ReadOnly = true;
                textBox4.ReadOnly = true;
                textBox6.Enabled = true;
                XoaRongThongTinKhachHang();
            }
            else
            {
                tbCustomerCode.Enabled = false;
                btnCheckOldCustomer.Enabled = false;
                tbCustomerCode.Text = "";
                textBox2.ReadOnly = false;
                textBox3.ReadOnly = false;
                textBox4.ReadOnly = false;
                btMuaPhuKien.Enabled = false;
                textBox6.Enabled = false;
                textBox6.Text = "";
                this.giamGiaUuDai = 0;
                XoaRongThongTinKhachHang();
            }
        }
        // Đăng xuất
        private void ExitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        // Chỉnh sửa thông tin Account
        private void EditInformationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fEditInformation f = new fEditInformation(this.LoginAccount);
            f.ShowDialog();
            thôngTinTàiKhoảnToolStripMenuItem.Text = "Tài Khoản [ " + f.TenHienThi + " ] ";
        }
        // Xử lý chức năng Admin
        private void adminToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (LoginAccount.Admin)
            {
                this.Hide();
                fAdmin f = new fAdmin();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Tài Khoản của bạn không có quyền truy cập chức năng này!");
            }
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBox cb = sender as ComboBox;
            if (cb.SelectedItem.ToString() == "List")
            {
                lvPhone.View = View.Details;
            }
            else
            {
                lvPhone.View = View.LargeIcon;
            }
        }

        private void cbPhanKhuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            float Min = 0, Max = 0;
            ComboBox cb = sender as ComboBox;
            switch (cb.SelectedItem)
            {
                case "Tất cả":
                    Min = 0;
                    Max = 999999999;
                    break;
                case "Dưới 2 triệu":
                    Min = 0;
                    Max = 2000000;
                    break;
                case "Tử 2 - 4 triệu":
                    Min = 2000000;
                    Max = 4000000;
                    break;
                case "Tử 4 - 7 triệu":
                    Min = 4000000;
                    Max = 7000000;
                    break;
                case "Tử 7 - 13 triệu":
                    Min = 7000000;
                    Max = 13000000;
                    break;
                case "Trên 13 triệu":
                    Min = 13000000;
                    Max = 999000000;
                    break;
            }
            LoadPhone(Min, Max);
        }
        void XoaRongThongTinKhachHang()
        {
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
        }

        #endregion

        private void cbSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbPhanKhuc_SelectedIndexChanged(cbPhanKhuc, EventArgs.Empty);
        }



        private void thôngTinSảnPhẩmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            foreach ( ListViewItem item in lvPhone.Items)
            {

                if (item.Checked == true) ThongTinSanPham(item.Text, this.loginAccount);
            }
            this.Show();
            UpdateHoaDon();
        }

        private void btMuaPhuKien_Click(object sender, EventArgs e)
        {
            fPhuKienTuongThich f = new fPhuKienTuongThich(this.listPhoneSelect, this.tongTienDienThoai*10/100);
            f.ShowDialog();
            //Cap Nhap Hoa Don Nhung Phu Kien Da Chon
            if (f.ListPhuKienSelect.Count != 0)
            {
                this.listPhuKienSelect = f.ListPhuKienSelect;
                foreach (PhuKien item in f.ListPhuKienSelect)
                {
                    ListViewItem lsvItem = new ListViewItem(item.TenPhuKien);
                    lsvItem.Tag = item;
                    lsvItem.SubItems.Add("1");
                    lsvItem.SubItems.Add(item.GiaBanPK.ToString("c", culture));
                    lsvItem.SubItems.Add((item.GiaBanPK * item.PtGiamGia / 100).ToString("c", culture));
                    listView1.Items.Add(lsvItem);
                }
            }
            if (this.giamGiaUuDai + f.GiamThemMua <= this.tongTienDienThoai * 10 / 100)
            {
                this.giamGiaUuDai += f.GiamThemMua;
                this.tongTien = this.tongTien + f.TamTinhMua - f.GiamThemMua;
            }                
            else
            {
                this.tongTien = this.tongTien + f.TamTinhMua - (this.tongTienDienThoai * 10 / 100 - this.giamGiaUuDai);
                this.giamGiaUuDai = this.tongTienDienThoai * 10 / 100;
            }                
            textBox5.Text = this.tongTien.ToString("c", culture);
            textBox6.Text = this.giamGiaUuDai.ToString("c", culture);
        }

        private void lvPhone_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            this.Hide();
            foreach (ListViewItem item in lvPhone.Items)
            {
                
                if (item.Selected == true) ThongTinSanPham(item.Text, this.loginAccount);
                
            }
            this.Show();
            UpdateHoaDon();
        }

        private void hủyChọnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach(ListViewItem item in lvPhone.Items)
            {
                lvPhone.CheckBoxes = true;
                item.Checked = false;
            }    
        }

        private void tùyChọnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            lvPhone.CheckBoxes = !lvPhone.CheckBoxes;
        }

        private void chọnTấtCảToolStripMenuItem_Click(object sender, EventArgs e)
        {
            lvPhone.CheckBoxes = true;
            foreach (ListViewItem item in lvPhone.Items)
            {
                item.Checked = true;
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            cbPhanKhuc_SelectedIndexChanged(cbPhanKhuc, EventArgs.Empty);
        }

        private void hủyTìmKiếmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            cbPhanKhuc_SelectedIndexChanged(cbPhanKhuc, EventArgs.Empty);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if(this.listPhoneSelect != null) this.ListPhoneSelect.Clear();
            listView1.Items.Clear();
            this.tongTien = 0;
            this.tongTienDienThoai = 0;
            textBox5.Text = this.tongTien.ToString("c", culture);
            this.khachHang = null;
            cbOldCustomers_CheckedChanged(cbOldCustomers, EventArgs.Empty);
            this.giamGiaUuDai = 0;
            textBox6.Text = "";
            tbCustomerCode.Text = "";
            btMuaPhuKien.Enabled = false;
        }

        private void btnCheckOldCustomer_Click(object sender, EventArgs e)
        {
            this.khachHang = KhachHangDAO.Instance.GetKhachHangByID(tbCustomerCode.Text);
            if (this.khachHang != null)
            {
                textBox2.Text = this.khachHang.TenKhachHang;
                textBox3.Text = this.khachHang.SoDienThoai;
                textBox4.Text = this.khachHang.DiaChi;
                btMuaPhuKien.Enabled = true;
            }
            else
            {
                XoaRongThongTinKhachHang();
                MessageBox.Show("Mã Khách Hàng Sai");
            }    
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (listView1.Items.Count == 0) MessageBox.Show("Không có sản phẩm nào được chọn");
            else if (textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "") MessageBox.Show("Chưa Nhập Thông Tin Khách Hàng");
            else
            {
                if (MessageBox.Show("Xác nhận thanh toán!", "Xác nhận", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    if (cbOldCustomers.Checked == false)
                    {
                        KhachHangDAO.Instance.ThemKhachHang(textBox2.Text, textBox3.Text, textBox4.Text);
                        this.maKhachHang = KhachHangDAO.Instance.GetMaKhachHangMoi();
                        MessageBox.Show("Mã khách hàng của bạn là: " + this.maKhachHang.ToString());
                    }
                    else this.maKhachHang = Int32.Parse(tbCustomerCode.Text);
                    BillDAO.Instance.ThemBill(this.loginAccount.MaNhanVien, this.maKhachHang, this.giamGiaUuDai);
                    foreach (PhoneSelect phone in this.listPhoneSelect)
                    {
                        BillInfoDAO.Instance.ThemBillInfo(BillDAO.Instance.GetMaBillMoi(), phone.Phone.MaDT, phone.SoLuong);
                    }
		    // Nếu không chọn phụ kiện nào
                    if (this.listPhuKienSelect != null)
                    {
                        foreach (PhuKien phukien in this.listPhuKienSelect)
                        {
                            BillInfoDAO.Instance.ThemBillInfo(BillDAO.Instance.GetMaBillMoi(), phukien.MaPhuKien, 1);
                        }
                        BillDAO.Instance.UpdateHDBH(BillDAO.Instance.GetMaBillMoi());
                        button3_Click(button3, EventArgs.Empty);
                    }
                    
                }
            }                

        }
    }
}
