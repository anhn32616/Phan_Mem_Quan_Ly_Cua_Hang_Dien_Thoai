using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;

namespace QuanLyCuaHangDienThoai.DTO
{
    public class PhuKien
    {
        private int maPhuKien;

        public int MaPhuKien { get => maPhuKien; set => maPhuKien = value; }
        public string TenPhuKien { get => tenPhuKien; set => tenPhuKien = value; }
        public float GiaBanPK { get => giaBanPK; set => giaBanPK = value; }
        public int SlDaBan { get => slDaBan; set => slDaBan = value; }
        public float PtGiamGia { get => ptGiamGia; set => ptGiamGia = value; }

        private string tenPhuKien;
        private float giaBanPK;
        private float ptGiamGia;
        private int slDaBan;
        public PhuKien(int maphukien, string tenphukien, float giabanpk, float ptgiamgia, int sldaban)
        {
            this.maPhuKien = maphukien;
            this.tenPhuKien = tenphukien;
            this.giaBanPK = giabanpk;
            this.ptGiamGia = ptgiamgia;
            this.slDaBan = sldaban;
        }
        public PhuKien(DataRow row)
        {
            this.maPhuKien = (int)row["MaPhuKien"] ;
            this.tenPhuKien = row["TenPhuKien"].ToString();
            this.giaBanPK = (float)Convert.ToDouble(row["GiaBanPK"].ToString());
            this.ptGiamGia = (float)Convert.ToDouble(row["PtGiamGia"].ToString());
            this.slDaBan = (int)row["SLDaBan"];
        }
    }
}
