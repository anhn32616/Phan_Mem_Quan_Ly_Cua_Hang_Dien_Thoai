using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DTO
{
    public class KhachHang
    {
        private int maKhachHang;
        private string tenKhachHang;
        private string soDienThoai;
        private string diaChi;

        public int MaKhachHang { get => maKhachHang; set => maKhachHang = value; }
        public string TenKhachHang { get => tenKhachHang; set => tenKhachHang = value; }
        public string SoDienThoai { get => soDienThoai; set => soDienThoai = value; }
        public string DiaChi { get => diaChi; set => diaChi = value; }

        public KhachHang(int makhachhang, string tenkhachhang, string sodienthoai, string diachi)
        {
            this.maKhachHang = makhachhang;
            this.tenKhachHang = tenkhachhang;
            this.soDienThoai = sodienthoai;
            this.diaChi = diachi;
        }
        public KhachHang(DataRow row)
        {
            this.maKhachHang = (int)row["MaKhachHang"];
            this.tenKhachHang = row["TenKhachHang"].ToString();
            this.soDienThoai = row["DienThoai"].ToString();
            this.diaChi = row["DiaChi"].ToString();
        }
    }
}
