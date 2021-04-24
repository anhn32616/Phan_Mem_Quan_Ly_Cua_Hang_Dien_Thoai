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
    public partial class fPhuKienTuongThich : Form
    {
        private List<PhoneSelect> listPhoneSelect;
        private List<PhuKien> listPhuKienSelect;

        internal List<PhoneSelect> ListPhoneSelect { get => listPhoneSelect; set => listPhoneSelect = value; }
        public List<PhuKien> ListPhuKien { get => listPhuKien; set => listPhuKien = value; }
        public List<PhuKien> ListPhuKienSelect { get => listPhuKienSelect; set => listPhuKienSelect = value; }
        public float TongGiamMax { get => tongGiamMax; set => tongGiamMax = value; }
        public float ThanhTien { get => thanhTien; set => thanhTien = value; }
        public float TamTinhMax { get => tamTinhMax; set => tamTinhMax = value; }
        public float GiamThem { get => giamThem; set => giamThem = value; }
        public float TamTinh { get => tamTinh; set => tamTinh = value; }
        public float TamTinhMua { get => tamTinhMua; set => tamTinhMua = value; }
        public float GiamThemMua { get => giamThemMua; set => giamThemMua = value; }

        private int kMax;

        private List<PhuKien> listPhuKien;
        private float thanhTien;
        private float tongGiamMax;
        private float tamTinh;
        private float tongGiam;
        private float giamThem;
        private float tongTien;
        private float tamTinhMax;
        private float tamTinhMua;
        private float giamThemMua;
        private int n;
        private int k;
        private float tinhTamQuayLui;
        int[] a = new int[50];
        private int dem;
        private float thanhTienQuayLui;
        CultureInfo culture = new CultureInfo("vi-VN");
        public fPhuKienTuongThich(List<PhoneSelect> listphoneselect, float tonggiammax)
        {
            this.listPhoneSelect = listphoneselect;
            this.listPhuKien = new List<PhuKien>();
            this.listPhuKienSelect = new List<PhuKien>();
            this.thanhTien = 0;
            this.tongGiamMax = tonggiammax;
            this.tamTinhMax = tonggiammax * 5;
            InitializeComponent();
            textBox1.Text = tongGiamMax.ToString("c", culture);
            label8.Text += "Tối đa " + tongGiamMax.ToString("c",culture);
            LoadListPK();
            ShowList();
            ListTuongThich();
            this.giamThem = 0;
            this.n = this.listPhuKien.Count;
            this.k = (int)numericUpDown1.Value;
            if (this.n < 20) this.kMax = this.n; else this.kMax = 20;
            label10.Text = "(<=" + this.kMax.ToString() + ") và Tiền Giảm Thêm <= Số Tiền Giảm Tối Đa ]";
            this.dem = 0;
            this.thanhTien = 0;
            this.TamTinh = 0;
            this.tinhTamQuayLui = 0;
            this.thanhTienQuayLui = 0;
            tri(1);
        }
        void LoadListPK()
        {
            foreach (PhoneSelect item in this.listPhoneSelect)
            {
                List<PhuKien> ListPhuKienTungDT = PhuKienDAO.Instance.LoadPhuKienList(item.Phone.MaDT);
                if (ListPhuKienTungDT.Count != 0)
                    if (this.listPhuKien.Count == 0) this.listPhuKien = ListPhuKienTungDT;
                    else
                    {
                        foreach (PhuKien phukien1 in ListPhuKienTungDT)
                        {
                            bool ktra = true;
                            foreach (PhuKien phukien2 in this.listPhuKien)
                            {
                                if (phukien1.MaPhuKien == phukien2.MaPhuKien)
                                {
                                    ktra = false;
                                    break;
                                }
                            }
                            if (ktra) this.listPhuKien.Add(phukien1);
                        }
                    }
            }
        }
        void ShowList()
        {
            this.label2.Hide();
            this.listView2.Hide();
            this.label1.Show();
            this.listView1.Show();
            this.numericUpDown1.Hide();
            this.label10.Hide();
        }
        void ShowListGoiY()
        {
            this.label1.Hide();
            this.listView1.Hide();
            this.label2.Show();
            this.listView2.Show();
            this.numericUpDown1.Show();
            this.label10.Show();
        }
        void ListTuongThich()
        {
            foreach (PhuKien item in this.listPhuKien)
            {
                ListViewItem lsvItem = new ListViewItem(item.TenPhuKien);
                lsvItem.Tag = item;
                lsvItem.SubItems.Add(item.MaPhuKien.ToString());
                lsvItem.SubItems.Add(item.GiaBanPK.ToString("c", culture));
                lsvItem.SubItems.Add((item.GiaBanPK * item.PtGiamGia / 100).ToString("c", culture));
                listView1.Items.Add(lsvItem);
            }
        }
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ckb = sender as CheckBox;
            if (ckb.Checked == true)
            {
                ShowListGoiY();
                XuLyThongSo(listView2);
                HienThi();
            }
            else
            {
                ShowList();
                XuLyThongSo(listView1);
                HienThi();

            }
        }
        void XuLyThongSo(ListView lsv)
        {
            this.tongTien = 0;
            this.thanhTien = 0;
            this.TamTinh = 0;
            this.tongGiam = 0;
            this.GiamThem = 0;
            foreach (ListViewItem item in lsv.Items)
            {
                if (item.Checked)
                {
                    PhuKien phukien = item.Tag as PhuKien;
                    tongTien += phukien.GiaBanPK;
                    tongGiam += phukien.GiaBanPK * phukien.PtGiamGia / 100;
                    TamTinh = tongTien - tongGiam;
                    if ((TamTinh * 20 / 100) > tongGiamMax) GiamThem = tongGiamMax; else GiamThem = (TamTinh * 20 / 100);
                    thanhTien = TamTinh - GiamThem;
                }
            }
        }
        void HienThi()
        {
            textBox2.Text = tongTien.ToString("c", culture);
            textBox3.Text = tongGiam.ToString("c", culture);
            textBox4.Text = TamTinh.ToString("c", culture);
            textBox5.Text = GiamThem.ToString("c", culture);
            textBox6.Text = thanhTien.ToString("c", culture);
        }
        void GetListPhuKienSelect(ListView lsv)
        {
            foreach (ListViewItem item in lsv.Items)
                if (item.Checked)
                {
                    PhuKien phukien = item.Tag as PhuKien;
                    this.listPhuKienSelect.Add(phukien);
                }
        }
        void xuat(int m)
        {
            dem++;
            this.thanhTienQuayLui = this.tinhTamQuayLui * 80 / 100;
            string name = "Nhóm gợi ý " + dem.ToString() + ": Thành tiền = " + this.thanhTienQuayLui.ToString();

            ListViewGroup lsvg = new ListViewGroup();
            lsvg.Header = name;
            listView2.Groups.Add(lsvg);
            for (int i = 1; i <= m; i++)
            {
                PhuKien pk = listPhuKien[a[i] - 1];
                ListViewItem lsvItem = new ListViewItem(pk.TenPhuKien);
                lsvItem.Tag = pk;
                lsvItem.SubItems.Add(pk.MaPhuKien.ToString());
                lsvItem.SubItems.Add(pk.GiaBanPK.ToString("c", culture));
                lsvItem.SubItems.Add((pk.GiaBanPK * pk.PtGiamGia / 100).ToString("c", culture));
                lsvItem.Group = lsvg;
                listView2.Items.Add(lsvItem);
            }
        }
        void tri(int i)
        {
            int j;
            for (j = (a[i - 1] + 1); j <= (n - k + i); j++)
            {
                a[i] = j;
                this.tinhTamQuayLui = this.tinhTamQuayLui + listPhuKien[a[i] - 1].GiaBanPK * (100 - listPhuKien[a[i] - 1].PtGiamGia) / 100;
                if (this.tinhTamQuayLui > this.tamTinhMax) return;
                else if (i == k) xuat(k);
                else tri(i + 1);
                this.tinhTamQuayLui = this.tinhTamQuayLui - listPhuKien[a[i] - 1].GiaBanPK * (100 - listPhuKien[a[i] - 1].PtGiamGia) / 100;
            }
        }
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btMua_Click(object sender, EventArgs e)
        {
            this.tamTinhMua = this.tamTinh;
            this.giamThemMua = this.giamThem;
            if (!checkBox1.Checked) GetListPhuKienSelect(listView1);
            else GetListPhuKienSelect(listView2);
            this.Close();
        }

        private void listView1_ItemChecked(object sender, ItemCheckedEventArgs e)
        {
            XuLyThongSo(listView1);
            HienThi();
        }

        private void listView2_ItemChecked(object sender, ItemCheckedEventArgs e)
        {
            XuLyThongSo(listView2);
            HienThi();
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            if ((numericUpDown1.Value >= 1)  && (numericUpDown1.Value <= this.kMax))
            {
                listView2.Items.Clear();
                this.k = (int)numericUpDown1.Value;
                dem = 0;
                this.tinhTamQuayLui = 0;
                this.thanhTienQuayLui = 0;
                tri(1);
                XuLyThongSo(listView2);
                HienThi();
            }
            else
            {
                MessageBox.Show("Giá trị không phù hợp");
                numericUpDown1.Value = 1;
            }
        }
    }
}
