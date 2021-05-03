using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyCuaHangDienThoai.DTO
{
    public class PhoneSelect
    {
        private Phone phone;
        private int soLuong;

        public Phone Phone { get => phone; set => phone = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public PhoneSelect(Phone phone, int soluong)
        {
            this.phone = phone;
            this.soLuong = soluong;
        }
    }
}
