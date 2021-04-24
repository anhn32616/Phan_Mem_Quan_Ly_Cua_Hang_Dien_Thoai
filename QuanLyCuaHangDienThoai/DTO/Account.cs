using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DTO
{
    public class Account
    {
        private int iD;

        public int ID { get => iD; set => iD = value; }
        public string TenDangNhap { get => tenDangNhap; set => tenDangNhap = value; }
        public string MatKhau { get => matKhau; set => matKhau = value; }
        public string TenHienThi { get => tenHienThi; set => tenHienThi = value; }
        public bool Admin { get => admin; set => admin = value; }
        public int MaNhanVien { get => maNhanVien; set => maNhanVien = value; }

        private string tenDangNhap;
        private string matKhau;
        private string tenHienThi;
        private bool admin;
        private int maNhanVien;
        public Account(int ID, string tendangnhap, string matkhau, string tenhienthi, bool admin, int manhanvien)
        {
            this.ID = ID;
            this.TenDangNhap = tendangnhap;
            this.MatKhau = matkhau;
            this.TenHienThi = tenhienthi;
            this.Admin = admin;
            this.MaNhanVien = manhanvien;
        }
        public Account(DataRow row)
        {
            this.ID = (int)row["iD"];
            this.TenDangNhap = row["tenDangNhap"].ToString();
            this.MatKhau = row["matKhau"].ToString();
            this.TenHienThi = row["tenHienThi"].ToString();
            this.Admin = (bool)row["admin"];
            this.MaNhanVien = (int)row["maNhanVien"];
        }

    }
}
