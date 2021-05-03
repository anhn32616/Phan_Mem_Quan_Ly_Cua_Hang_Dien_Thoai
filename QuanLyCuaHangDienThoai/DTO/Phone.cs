using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DTO
{
    public class Phone
    {
        public Phone(int madt, string tendt, float gianhapdt, float giabandt, int slhientai, int slbanratrongnam, float ptgiamgia, string thongsokythuat, float diemdanhgia, int luotdanhgia, string anh)
        {
            this.MaDT = madt;
            this.TenDienThoai = tendt;
            this.giaNhapDT = gianhapdt;
            this.GiaBanDT = giabandt;
            this.SlHienTai = slhientai;
            this.SlBanRaTrongNam = slbanratrongnam;
            this.PtGiamGia = ptgiamgia;
            this.ThongSoKyThuat = thongsokythuat;
            this.DiemDanhGia = diemdanhgia;
            this.LuotDanhGia = luotdanhgia;
            this.Anh = anh;
        }
        public Phone(DataRow row)
        {
            this.MaDT = (int)row["maDT"];
            this.TenDienThoai = (string)row["TenDienThoai"];
            this.GiaNhapDT = (float)Convert.ToDouble(row["giaNhapDT"].ToString());
            this.GiaBanDT = (float)Convert.ToDouble(row["giaBanDT"].ToString());
            this.SlHienTai = (int)row["slHienTai"];
            this.SlBanRaTrongNam = (int)row["slBanRaTrongNam"];
            this.PtGiamGia = (float)Convert.ToDouble(row["%GiamGia"].ToString());
            this.ThongSoKyThuat = (string)row["thongSoKyThuat"];
            this.DiemDanhGia = (float)Convert.ToDouble(row["diemDanhGia"].ToString());
            this.LuotDanhGia = (int)row["luotDanhGia"];
            this.Anh = (string)row["anh"];
        }
        private int maDT;

        public int MaDT { get => maDT; set => maDT = value; }
        private string tenDienThoai;

        private float giaNhapDT;
        public float GiaNhapDT { get => giaNhapDT; set => giaNhapDT = value; }

        private float giaBanDT;
        public float GiaBanDT { get => giaBanDT; set => giaBanDT = value; }

        private int slHienTai;
        public int SlHienTai { get => slHienTai; set => slHienTai = value; }

        private int slBanRaTrongNam;
        public int SlBanRaTrongNam { get => slBanRaTrongNam; set => slBanRaTrongNam = value; }

        private float ptGiamGia;
        public float PtGiamGia { get => ptGiamGia; set => ptGiamGia = value; }
        private string thongSoKyThuat;
        public string ThongSoKyThuat { get => thongSoKyThuat; set => thongSoKyThuat = value; }
        private float diemDanhGia;
        public float DiemDanhGia { get => diemDanhGia; set => diemDanhGia = value; }
        private int luotDanhGia;

        public int LuotDanhGia { get => luotDanhGia; set => luotDanhGia = value; }
        public string Anh { get => anh; set => anh = value; }
        public string TenDienThoai { get => tenDienThoai; set => tenDienThoai = value; }

        private string anh;

    }
}