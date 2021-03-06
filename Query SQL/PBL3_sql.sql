USE [PBL3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[TenHienThi] [nvarchar](50) NULL,
	[Admin] [bit] NOT NULL,
	[MaNhanVien] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDT] [int] NOT NULL,
	[TenDienThoai] [nvarchar](50) NULL,
	[GiaNhapDT] [float] NULL,
	[GiaBanDT] [float] NULL,
	[SLHienTai] [int] NULL,
	[SLBanRaTrongNam] [int] NULL CONSTRAINT [DF_DienThoai_SLBanRaTrongNam]  DEFAULT ((0)),
	[%GiamGia] [float] NULL CONSTRAINT [DF_DienThoai_%GiamGia]  DEFAULT ((0)),
	[ThongSoKyThuat] [nvarchar](max) NULL,
	[DiemDanhGia] [float] NULL,
	[LuotDanhGia] [int] NULL,
	[Anh] [text] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonBanHang]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBanHang](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NOT NULL,
	[MaKhachHang] [int] NOT NULL,
	[NgayBan] [datetime] NULL CONSTRAINT [DF_HoaDonBanHang_NgayBan]  DEFAULT (getdate()),
	[KhuyenMai] [float] NULL CONSTRAINT [DF_HoaDonBanHang_KhuyenMai]  DEFAULT ((0)),
	[TongTien] [float] NULL CONSTRAINT [DF_HoaDonBanHang_TongTien]  DEFAULT ((0)),
	[TongLoiNhuan] [float] NULL CONSTRAINT [DF_HoaDonBanHang_TongLoiNhuan]  DEFAULT ((0)),
 CONSTRAINT [PK_HoaDonBan_1] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[MaHDCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL CONSTRAINT [DF_HoaDonChiTiet_SoLuong]  DEFAULT ((1)),
	[DonGia] [float] NULL,
	[GiamGia] [float] NULL CONSTRAINT [DF_HoaDonChiTiet_GiamGia]  DEFAULT ((0)),
	[LoiNhuan] [float] NULL CONSTRAINT [DF_HoaDonChiTiet_LoiNhuan]  DEFAULT ((0)),
	[ThanhTien] [float] NULL CONSTRAINT [DF_HoaDonChiTiet_ThanhTien]  DEFAULT ((0)),
 CONSTRAINT [PK_HoaDonChiTiet_1] PRIMARY KEY CLUSTERED 
(
	[MaHDCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanVien] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[NgayNhap] [datetime] NULL CONSTRAINT [DF_HoaDonNhap_NgayNhap]  DEFAULT (getdate()),
	[TienNhap] [float] NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[Nam] [bit] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhuKien]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuKien](
	[MaPhuKien] [int] NOT NULL,
	[TenPhuKien] [nvarchar](50) NULL,
	[GiaBanPK] [float] NULL,
	[PtGiamGia] [float] NULL,
	[SLDaBan] [int] NULL,
 CONSTRAINT [PK_PhuKien] PRIMARY KEY CLUSTERED 
(
	[MaPhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[LoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuongThich]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuongThich](
	[MaDT] [int] NOT NULL,
	[MaPhuKien] [int] NOT NULL,
 CONSTRAINT [PK_TuongThich] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC,
	[MaPhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Admin], [MaNhanVien]) VALUES (2, N'anh       ', N'123                                               ', N'nguyen anh', 1, 1)
INSERT [dbo].[Account] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Admin], [MaNhanVien]) VALUES (7, N'vu        ', N'111                                               ', N'trong vu', 0, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (13, N'iPhone 7 32GB', 6250000, 7500000, 98, 502, 10, N'Màn hình:   LED-backlit IPS LCD, 4.7&quot;, Retina HD
Hệ điều hành:   iOS 14
Camera sau: 12 MP
Camera trước:   7 MP
CPU:    Apple A10 Fusion 4 nhân
RAM:    2 GB
Bộ nhớ trong:   32 GB
Thẻ SIM: 1
Nano SIM, Hỗ trợ 4G
Dung lượng pin: 1960 mAh', 3.5, 350000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iPhone 7 32GB.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (14, N'iPhone X 64GB', 16600000, 20000000, 98, 112, 10, N'Màn hình:   OLED, 5.8&quot;, Super Retina
Hệ điều hành:   iOS 12
Camera sau: 2 camera 12 MP
Camera trước:   7 MP
CPU:    Apple A11 Bionic 6 nhân
RAM:    3 GB
Bộ nhớ trong:   64 GB
Thẻ SIM:    1 Nano SIM, Hỗ trợ 4G
Dung lượng pin: 2716 mAh, có sạc nhanh', 4.8, 450000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iPhone X 64GB.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (16, N'iphone 7 plus', 8250000, 9900000, 199, 101, 15, N'Màn hình:   LED-backlit IPS LCD, 5.5", Retina HD
Hệ điều hành:   iOS 14
Camera sau: 2 camera 12 MP
Camera trước:   7 MP
CPU:    Apple A10 Fusion 4 nhân
RAM:    3 GB
Bộ nhớ trong:   32 GB
Thẻ SIM:
1 Nano SIM, Hỗ trợ 4G
Dung lượng pin: 2900 mAh
', 4.3, 380000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iPhone 7 32GB.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (17, N'iphone 8', 10000000, 12000000, 50, 20, 5, N'Màn hình:   LED-backlit IPS LCD, 4.7", Retina HD
Hệ điều hành:   iOS 14
Camera sau: 12 MP
Camera trước:   7 MP
CPU:    Apple A11 Bionic 6 nhân
RAM:    2 GB
Bộ nhớ trong:   64 GB
Thẻ SIM:    1 Nano SIM, Hỗ trợ 4G
Dung lượng pin: 1821 mAh, có sạc nhanh
', 4.2, 450000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iphone 8.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (18, N'iphone 8 plus', 13250000, 15900000, 300, 81, 15, N'Màn hình:   LED-backlit IPS LCD, 5.5", Retina HD
Hệ điều hành:   iOS 13
Camera sau: 2 camera 12 MP
Camera trước:   7 MP
CPU:    Apple A11 Bionic 6 nhân
RAM:    3 GB
Bộ nhớ trong:   64 GB
Thẻ SIM:
1 Nano SIM, Hỗ trợ 4G
Dung lượng pin: 2691 mAh, có sạc nhanh
', 4.8, 300000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iphone 8 plus.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (19, N'iphone xs', 15000000, 18000000, 249, 101, 20, N'Màn hình:   OLED, 5.8", Super Retina
Hệ điều hành:   iOS 14
Camera sau: 2 camera 12 MP
Camera trước:   7 MP
CPU:    Apple A12 Bionic 6 nhân
RAM:    4 GB
Bộ nhớ trong:   64 GB
Thẻ SIM:
1 Nano SIM & 1 eSIM, Hỗ trợ 4G
Dung lượng pin: 2658 mAh, có sạc nhanh
', 4.7, 350000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iphone xs.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (20, N'iphone xs max', 17500000, 21000000, 200, 130, 10, N'Màn hình:   OLED, 6.5", Super Retina
Hệ điều hành:   iOS 13
Camera sau: 2 camera 12 MP
Camera trước:   7 MP
CPU:    Apple A12 Bionic 6 nhân
RAM:    4 GB
Bộ nhớ trong:   64 GB
Thẻ SIM:
1 Nano SIM & 1 eSIM, Hỗ trợ 4G
Dung lượng pin: 3174 mAh, có sạc nhanh
', 4.8, 500000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\iphone xs max.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (21, N'samsung note 20 ultra', 21600000, 26000000, 100, 50, 5, N'Màn hình:   Dynamic AMOLED 2X, 6.9", Quad HD+ (2K+)
Hệ điều hành:   Android 10
Camera sau: Chính 108 MP & Phụ 12 MP, 12 MP, cảm biến Laser AF
Camera trước:   10 MP
CPU:    Exynos 990 8 nhân
RAM:    8 GB
Bộ nhớ trong:   256 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 1 TB
Thẻ SIM:
2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 4G
Dung lượng pin: 4500 mAh, có sạc nhanh
', 4.9, 250000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\samsung note 20 ultra.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (22, N'XIAOMI D3', 3500000, 4200000, 299, 201, 15, N'
Màn hình:   AMOLED, 6.43", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   Chính 16 MP & Phụ 2 MP
CPU:    MediaTek Helio P95 8 nhân
RAM:    8 GB
Bộ nhớ trong:   128 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
HOTSIM VNMB Siêu sim (5GB/ngày)
Dung lượng pin: 4000 mAh, có sạc nhanh
', 4.7, 320000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\XIAOMI D3.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (23, N'Xiaomi Redmi AS', 6700000, 8000000, 250, 100, 20, N'Màn hình:   TFT LCD, 6.5", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   16 MP
CPU:    Snapdragon 665 8 nhân
RAM:    8 GB
Bộ nhớ trong:   128 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
HOTSIM VNMB Siêu sim (5GB/ngày)
Dung lượng pin: 5000 mAh, có sạc nhanh
', 4.5, 400000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\Xiaomi Redmi AS.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (24, N'OOPO S4', 10000000, 12000000, 300, 50, 15, N'Màn hình:   AMOLED, 6.43", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   Chính 16 MP & Phụ 2 MP
CPU:    MediaTek Helio P95 8 nhân
RAM:    8 GB
Bộ nhớ trong:   128 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
HOTSIM VNMB Siêu sim (5GB/ngày)
Dung lượng pin: 4000 mAh, có sạc nhanh
', 4.2, 350000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\OOPO S4.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (25, N'Realme S14', 4250000, 5100000, 250, 135, 10, N'Màn hình:   AMOLED, 6.43", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   Chính 16 MP & Phụ 2 MP
CPU:    MediaTek Helio P95 8 nhân
RAM:    8 GB
Bộ nhớ trong:   128 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
HOTSIM VNMB Siêu sim (5GB/ngày)
Dung lượng pin: 4000 mAh, có sạc nhanh
', 4.3, 400000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\Realme S14.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (26, N'OOPO A37', 3500000, 4300000, 99, 32, 15, N'Màn hình:   AMOLED, 6.5", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   32 MP
CPU:    Snapdragon 720G 8 nhân
RAM:    8 GB
Bộ nhớ trong:   256 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
HOTSIM VNMB Siêu sim (5GB/ngày)
Dung lượng pin: 4000 mAh, có sạc nhanh
', 4.4, 200000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\OOPO A37.jpg')
INSERT [dbo].[DienThoai] ([MaDT], [TenDienThoai], [GiaNhapDT], [GiaBanDT], [SLHienTai], [SLBanRaTrongNam], [%GiamGia], [ThongSoKyThuat], [DiemDanhGia], [LuotDanhGia], [Anh]) VALUES (27, N'OPPO A3s', 5800000, 7000000, 149, 101, 20, N'Màn hình:   TFT LCD, 6.5", Full HD+
Hệ điều hành:   Android 10
Camera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP
Camera trước:   16 MP
CPU:    Snapdragon 665 8 nhân
RAM:    8 GB
Bộ nhớ trong:   128 GB
Thẻ nhớ:    MicroSD, hỗ trợ tối đa 256 GB
Thẻ SIM:
2 Nano SIM, Hỗ trợ 4G
Dung lượng pin: 5000 mAh, có sạc nhanh
', 4.6, 350000, N'D:\Visual 2019\C#_Winform\QuanLyCuaHangDienThoai\bin\Debug\Resources\OPPO A3s.jpg')
SET IDENTITY_INSERT [dbo].[HoaDonBanHang] ON 

INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (14, 1, 13, CAST(N'2020-12-30 03:29:32.310' AS DateTime), 48600, 24985900, 16042900)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (15, 1, 13, CAST(N'2020-12-30 03:35:29.783' AS DateTime), 48600, 24985900, 16042900)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (16, 1, 10, CAST(N'2020-12-30 07:08:22.197' AS DateTime), 48600, 24944400, 1851400)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (17, 1, 13, CAST(N'2020-12-30 07:35:13.850' AS DateTime), 75600, 25052400, 1824400)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (18, 1, 10, CAST(N'2020-12-30 08:07:39.590' AS DateTime), 275100, 29015400, -610100)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (19, 1, 13, CAST(N'2020-12-30 08:34:11.247' AS DateTime), 162000, 6248000, -362000)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (20, 1, 14, CAST(N'2021-03-31 08:58:39.500' AS DateTime), 0, 12070000, 320000)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (21, 1, 15, CAST(N'2021-03-31 09:03:51.270' AS DateTime), 0, 3655000, 155000)
INSERT [dbo].[HoaDonBanHang] ([MaHoaDon], [MaNhanVien], [MaKhachHang], [NgayBan], [KhuyenMai], [TongTien], [TongLoiNhuan]) VALUES (22, 1, 10, CAST(N'2021-03-31 09:23:06.733' AS DateTime), 90000, 3930000, -20000)
SET IDENTITY_INSERT [dbo].[HoaDonBanHang] OFF
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] ON 

INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (37, 14, 13, 1, 7990000, 1198500, -208500, 6791500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (38, 14, 14, 1, 20000000, 2000000, 16300000, 18000000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (39, 14, 11, 1, 120000, 12000, 0, 108000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (40, 14, 15, 1, 150000, 15000, 0, 135000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (41, 15, 14, 1, 20000000, 2000000, 16300000, 18000000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (42, 15, 13, 1, 7990000, 1198500, -208500, 6791500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (43, 15, 15, 1, 150000, 15000, 0, 135000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (44, 15, 11, 1, 120000, 12000, 0, 108000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (45, 16, 13, 1, 7500000, 750000, 500000, 6750000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (46, 16, 14, 1, 20000000, 2000000, 1400000, 18000000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (47, 16, 11, 1, 120000, 12000, 0, 108000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (48, 16, 15, 1, 150000, 15000, 0, 135000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (49, 17, 13, 1, 7500000, 750000, 500000, 6750000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (50, 17, 14, 1, 20000000, 2000000, 1400000, 18000000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (51, 17, 11, 1, 120000, 12000, 0, 108000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (52, 17, 12, 1, 300000, 30000, 0, 270000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (53, 18, 19, 1, 18000000, 3600000, -600000, 14400000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (54, 18, 18, 1, 15900000, 2385000, 265000, 13515000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (55, 18, 32, 1, 800000, 80000, 0, 720000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (56, 18, 31, 1, 690000, 34500, 0, 655500)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (57, 19, 27, 1, 7000000, 1400000, -200000, 5600000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (58, 19, 33, 1, 900000, 90000, 0, 810000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (59, 20, 26, 1, 4300000, 645000, 155000, 3655000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (60, 20, 16, 1, 9900000, 1485000, 165000, 8415000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (61, 21, 26, 1, 4300000, 645000, 155000, 3655000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (62, 22, 22, 1, 4200000, 630000, 70000, 3570000)
INSERT [dbo].[HoaDonChiTiet] ([MaHDCT], [MaHoaDon], [MaSP], [SoLuong], [DonGia], [GiamGia], [LoiNhuan], [ThanhTien]) VALUES (63, 22, 36, 1, 500000, 50000, 0, 450000)
SET IDENTITY_INSERT [dbo].[HoaDonChiTiet] OFF
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (1, 1, 14, 10, CAST(N'2020-12-30 03:59:50.220' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (2, 1, 13, 1, CAST(N'2020-12-30 04:14:40.010' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (3, 1, 14, 15, CAST(N'2020-12-30 04:17:09.150' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (4, 1, 14, 100, CAST(N'2020-12-30 04:30:52.870' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (5, 1, 18, 1, CAST(N'2020-12-30 08:17:39.157' AS DateTime), NULL)
INSERT [dbo].[HoaDonNhap] ([MaHoaDon], [MaNhanVien], [MaSP], [SoLuong], [NgayNhap], [TienNhap]) VALUES (6, 1, 26, 1, CAST(N'2021-03-31 07:33:33.680' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (7, N'vu', N'0329136777', N'Tỉnh Hà Tĩnh')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (9, N'Minh', N'0329138888', N'Tỉnh Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (10, N'Minh Vu', N'0329138811', N'Tỉnh Bà Rịa')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (13, N'Hoàng Long', N'0391360338', N'Tỉnh Lào Cai')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (14, N'fee', N'df', N'dsf')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi]) VALUES (15, N'dá', N'đsa', N'sfa')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [Nam], [DiaChi], [CMND], [DienThoai], [NgaySinh], [ChucVu]) VALUES (1, N'Nguyễn Trọng Anh', 1, N'Tỉnh Hà Tĩnh', N'184400599', N'0329136011', NULL, N'Quản lý')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [Nam], [DiaChi], [CMND], [DienThoai], [NgaySinh], [ChucVu]) VALUES (2, N'Nguyễn Trọng Vũ', 1, N'Tỉnh Hà Tĩnh', N'184455911', N'0327877877', NULL, N'Quản lý')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [Nam], [DiaChi], [CMND], [DienThoai], [NgaySinh], [ChucVu]) VALUES (4, N'Võ Hữu Minh', 1, N'Tỉnh Hà Nam', N'184455933', N'0326877767', NULL, N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (11, N'op lung iphon 7', 120000, 10, 9)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (12, N'sac iphone', 300000, 10, 1)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (15, N'op lung iphone', 150000, 10, 7)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (29, N'Tai nghe AirPods 2 Apple MV7N2', 4900000, 10, 3)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (30, N'Tai nghe AirPods Pro sạc không dây Apple MWP22', 5100000, 10, 7)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (31, N'Sac dự phòng iphone 10000mAh', 690000, 5, 23)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (32, N'Sac dự phòng iphone 12500mAh', 800000, 10, 36)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (33, N'Sạc nhanh iphone chính hãng 20W Type C-MHJE3ZA', 900000, 10, 24)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (34, N'Gậy tự sướng KA-23', 300000, 10, 45)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (35, N'Sạc nhanh iphone chính hãng 22W Type A-MFZA', 400000, 10, 55)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (36, N'Gậy tự sướng KA-23', 500000, 10, 44)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (41, N'Thẻ nhớ samsung 64gb', 300000, 10, 23)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (42, N'Thẻ nhớ samsung 128gb(', 200000, 10, 12)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (43, N'Tai nghe Bluetooth Mozard R559X Đen', 300000, 10, 32)
INSERT [dbo].[PhuKien] ([MaPhuKien], [TenPhuKien], [GiaBanPK], [PtGiamGia], [SLDaBan]) VALUES (44, N'Op lung samsung (99-199k)', 50000, 10, 45)
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (10, N'DT        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (11, N'PK        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (12, N'PK        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (13, N'DT        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (14, N'DT        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (15, N'PK        ')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (16, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (17, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (18, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (19, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (20, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (21, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (22, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (23, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (24, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (25, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (26, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (27, N'DT')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (29, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (30, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (31, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (32, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (33, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (34, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (35, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (36, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (41, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (42, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (43, N'PK')
INSERT [dbo].[SanPham] ([MaSP], [LoaiSP]) VALUES (44, N'PK')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (13, 11)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (13, 12)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (13, 15)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (13, 31)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (14, 12)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (14, 15)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (17, 12)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (18, 31)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (19, 11)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (19, 32)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (20, 33)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (20, 36)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (21, 36)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (22, 36)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (22, 42)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (23, 33)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (23, 41)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (24, 31)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (24, 42)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (25, 43)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (25, 44)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (26, 43)
INSERT [dbo].[TuongThich] ([MaDT], [MaPhuKien]) VALUES (27, 33)
/****** Object:  Index [UNIQUE_MaNhanVien]    Script Date: 3/31/2021 5:33:01 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UNIQUE_MaNhanVien] UNIQUE NONCLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FK_CMND]    Script Date: 3/31/2021 5:33:01 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [FK_CMND] UNIQUE NONCLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_SanPham] FOREIGN KEY([MaDT])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_SanPham]
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHang.MaKhachHang_KhachHang.MaKhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_HoaDonBanHang.MaKhachHang_KhachHang.MaKhachHang]
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBanHang.MaNhanVien_NhanVien.MaNhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_HoaDonBanHang.MaNhanVien_NhanVien.MaNhanVien]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDonBanHang] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDonBanHang] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDonBanHang]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_SanPham]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhanVien]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_SanPham]
GO
ALTER TABLE [dbo].[PhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhuKien_SanPham] FOREIGN KEY([MaPhuKien])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[PhuKien] CHECK CONSTRAINT [FK_PhuKien_SanPham]
GO
ALTER TABLE [dbo].[TuongThich]  WITH CHECK ADD  CONSTRAINT [FK_TuongThich.MaDT_DienThoai.MaDT] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DienThoai] ([MaDT])
GO
ALTER TABLE [dbo].[TuongThich] CHECK CONSTRAINT [FK_TuongThich.MaDT_DienThoai.MaDT]
GO
ALTER TABLE [dbo].[TuongThich]  WITH CHECK ADD  CONSTRAINT [FK_TuongThich.MaPhuKien_PhuKien.MaPhuKien] FOREIGN KEY([MaPhuKien])
REFERENCES [dbo].[PhuKien] ([MaPhuKien])
GO
ALTER TABLE [dbo].[TuongThich] CHECK CONSTRAINT [FK_TuongThich.MaPhuKien_PhuKien.MaPhuKien]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_DANH_GIA] CHECK  (([DiemDanhGia]>=(0) AND [DiemDanhGia]<=(5)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DIEM_DANH_GIA]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_GIA_DT] CHECK  (([GiaNhapDT]>=(0) AND [GiaBanDT]>=(0)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_GIA_DT]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_LUOT_DANH_GIA] CHECK  (([LuotDanhGia]>=(0)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_LUOT_DANH_GIA]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_PT_GIAM_GIA] CHECK  (([%GiamGia]>=(0) AND [%GiamGia]<=(100)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_PT_GIAM_GIA]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_SO_LUONG_BAN] CHECK  (([SLBanRaTrongNam]>=(0)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_SO_LUONG_BAN]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_SO_LUONG_HT] CHECK  (([SLHienTai]>=(0)))
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_SO_LUONG_HT]
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_NGAY_BAN] CHECK  (([NgayBan]<=getdate()))
GO
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_NGAY_BAN]
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD  CONSTRAINT [FK_TONG_TIEN] CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonBanHang] CHECK CONSTRAINT [FK_TONG_TIEN]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DON_GIA] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_DON_GIA]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_GIAM_GIA] CHECK  (([GiamGia]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_GIAM_GIA]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_SO_LUONG] CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_SO_LUONG]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_THANH_TIEN] CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_THANH_TIEN]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NGAY_SINH] CHECK  (([NgaySinh]<=getdate()))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NGAY_SINH]
GO
ALTER TABLE [dbo].[PhuKien]  WITH CHECK ADD  CONSTRAINT [FK_GIA_PHU_KIEN] CHECK  (([GiaBanPK]>=(0)))
GO
ALTER TABLE [dbo].[PhuKien] CHECK CONSTRAINT [FK_GIA_PHU_KIEN]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP] CHECK  (([LoaiSP]='PK' OR [LoaiSP]='DT'))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_LoaiSP]
GO
/****** Object:  StoredProcedure [dbo].[USP_FindPhone]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_FindPhone]
@TenDienThoai NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.DienThoai WHERE TenDienThoai LIKE @TenDienThoai
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccLogin]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccLogin]
@userName NVARCHAR(50), @passWord NVARCHAR(50)
AS
SELECT * FROM dbo.Account WHERE @userName = TenDangNhap AND @passWord = MatKhau

GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUseName]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetAccountByUseName]
@userName nvarchar(50)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE TenDangNhap = @userName;
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetBillInfoList]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetBillInfoList]
@MaHD INT
AS
SELECT * FROM dbo.HoaDonChiTiet WHERE MaHoaDon = @MaHD

GO
/****** Object:  StoredProcedure [dbo].[USP_GetKhachHangByID]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetKhachHangByID]
@MaKhachHang NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.KhachHang WHERE MaKhachHang = @MaKhachHang;
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetKhachHangList]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[USP_GetKhachHangList]
AS
BEGIN
	SELECT * FROM dbo.KhachHang;
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaBillMoi]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetMaBillMoi]
AS  SELECT TOP 1.MaHoaDon FROM dbo.HoaDonBanHang ORDER BY MaHoaDon DESC

GO
/****** Object:  StoredProcedure [dbo].[USP_GetMaKhachHangMoi]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetMaKhachHangMoi]
AS
BEGIN
 SELECT TOP 1.MaKhachHang FROM dbo.KhachHang ORDER BY MaKhachHang DESC
END

GO
/****** Object:  StoredProcedure [dbo].[USP_GetPhone]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetPhone]
@TenDienThoai NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.DienThoai WHERE TenDienThoai = @TenDienThoai
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_GetPhoneList]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_GetPhoneList]
AS
SELECT * FROM dbo.DienThoai;

GO
/****** Object:  StoredProcedure [dbo].[USP_GetPhuKienList]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_GetPhuKienList]
@MaDT NVARCHAR(50)
AS
BEGIN
	SELECT dbo.PhuKien.*
	FROM dbo.TuongThich INNER JOIN dbo.PhuKien
	ON dbo.PhuKien.MaPhuKien = dbo.TuongThich.MaPhuKien
	WHERE @MaDT = dbo.TuongThich.MaDT
END

GO
/****** Object:  StoredProcedure [dbo].[USP_LoaiTaiKhoan]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoaiTaiKhoan]
@userName NVARCHAR(50), @passWord NVARCHAR(50)
AS
BEGIN
	SELECT Admin FROM dbo.Account WHERE TenDangNhap = @userName AND MatKhau = @passWord
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Login]
@userName NVARCHAR(50), @passWord NVARCHAR(50)
AS
BEGIN
	SELECT COUNT(*) FROM dbo.Account WHERE TenDangNhap = @userName AND MatKhau = @passWord
END

GO
/****** Object:  StoredProcedure [dbo].[USP_NhapThem]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_NhapThem]
@MaDT INT, @MaNhanVien INT ,  @SoLuong INT
AS
BEGIN
	INSERT INTO dbo.HoaDonNhap
	        ( MaNhanVien ,
	          MaSP ,
	          SoLuong
	        )
	VALUES  ( @MaNhanVien , -- MaNhanVien - int
	          @MaDT , -- MaSP - int
	          @SoLuong -- SoLuong - int
	        )
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_ThemBill]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_ThemBill]
@MaNhanVien INT, @MaKhachHang INT, @KhuyenMai FLOAT
AS
BEGIN
	INSERT INTO dbo.HoaDonBanHang
	        ( MaNhanVien ,
	          MaKhachHang ,
			  KhuyenMai
	        )
	VALUES  ( @MaNhanVien , -- MaNhanVien - int
	          @MaKhachHang,  -- MaKhachHang - int
			  @KhuyenMai
	        )
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ThemBillInfo]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ThemBillInfo]
@MaHoaDon INT, @MaSanPham INT, @SoLuong INT
AS
BEGIN
	INSERT INTO dbo.HoaDonChiTiet
	        ( MaHoaDon ,
	          MaSP ,
	          SoLuong 
	        )
	VALUES  ( @MaHoaDon , -- MaHoaDon - int
	          @MaSanPham , -- MaSP - int
	          @SoLuong  -- SoLuong - int
	        )
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_ThemKhachHang]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ThemKhachHang]
@TenKhachHang NVARCHAR(50), @DienThoai NVARCHAR(50), @DiaChi NVARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.KhachHang
	        ( TenKhachHang, DienThoai, DiaChi )
	VALUES  ( @TenKhachHang, -- TenKhachHang - nvarchar(50)
	          @DienThoai, -- DienThoai - nvarchar(50)
	          @DiaChi  -- DiaChi - nvarchar(50)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateAccount]
@TenDangNhap NVARCHAR(50), @TenHienThi NVARCHAR(50), @MatKhau NVARCHAR(50), @MatKhauMoi NVARCHAR(50)
AS
BEGIN
	DECLARE @isRightPasss INT = 0
	SELECT @isRightPasss = COUNT(*) FROM dbo.Account WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
	IF (@isRightPasss = 1)
	BEGIN
		IF(@MatKhauMoi = NULL OR @MatKhauMoi = '')
		BEGIN
			UPDATE dbo.Account SET TenHienThi = @TenHienThi WHERE TenDangNhap = @TenDangNhap
		END
		ELSE
			UPDATE dbo.Account SET TenHienThi = @TenHienThi, MatKhau = @MatKhauMoi WHERE TenDangNhap = @TenDangNhap
	END
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateHDBH]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[USP_UpdateHDBH]
@MaHoaDon INT
AS 
BEGIN
	UPDATE dbo.HoaDonBanHang
	SET TongTien -= KhuyenMai,
		TongLoiNhuan -= KhuyenMai
	WHERE MaHoaDon = @MaHoaDon
END 

GO
/****** Object:  StoredProcedure [dbo].[USP_XoaDienThoai]    Script Date: 3/31/2021 5:33:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_XoaDienThoai]
@MaDT INT
AS 
BEGIN
	DELETE dbo.DienThoai
	WHERE MaDT = @MaDT;
	DELETE dbo.SanPham
	WHERE MaSP = @MaDT;	
END

GO
--------------------------------------------------------------------------------
--TAO TRIGGER

--------------------------------------------------------------------------------
--TRIGGER CAP NHAT TONG TIEN, TONG LOI NHUAN O TABLE HoaDonBanHang KHI INSERT TABLE HoaDonChiTiet
CREATE TRIGGER TRG_INSERT_HDCT_HDBH
ON dbo.HoaDonChiTiet
FOR UPDATE
AS
BEGIN
	DECLARE @ThanhTien FLOAT
	DECLARE @MaHoaDon INT
	DECLARE @LoiNhuan FLOAT
	SELECT @ThanhTien = ThanhTien, @MaHoaDon = MaHoaDon, @LoiNhuan = LoiNhuan FROM Inserted
	UPDATE dbo.HoaDonBanHang
		SET TongTien += @ThanhTien,
			TongLoiNhuan += @LoiNhuan
		WHERE @MaHoaDon = dbo.HoaDonBanHang.MaHoaDon
END
GO
--------------------------------------------------------------------------------
--TRIGGER INSERT DienThoai HOAC PHU KIEN KHI INSERT TABLE SanPham
CREATE TRIGGER TRG_SANPHAM_DT_OR_PHUKIEN
ON dbo.SanPham
FOR INSERT 
AS
BEGIN
	DECLARE @MaSP INT
	DECLARE @LoaiSP NCHAR(10)
	SELECT @MaSP = Inserted.MaSP, @LoaiSP = LoaiSP  FROM Inserted
	IF (@LoaiSP = 'DT') 
		INSERT dbo.DienThoai ( MaDT) VALUES( @MaSP)
	ELSE
		INSERT dbo.PhuKien (MaPhuKien) VALUES (@MaSP)
END
GO
----TRIGGER TINH CAC THANH PHAN CON LAI INSERT TABLE HoaDonChiTiet VA TANG UPDATE SOLUONG O TABLE DIEN THOAI OR PHU KIEN
CREATE TRIGGER TRG_INSERT_HDCT_SANPHAM
ON dbo.HoaDonChiTiet 
FOR INSERT 
AS
BEGIN
	DECLARE @MaSP INT
	DECLARE @MaHoaDon INT
	DECLARE @LoaiSP NCHAR(10)
	DECLARE @GiaNhap FLOAT
	DECLARE @GiaBan FLOAT
	DECLARE @ptGiamGia FLOAT
	DECLARE @SoLuong INT
	DECLARE @SLHienTai INT
	DECLARE @LoiNhuan FLOAT
	SELECT @MaSP = Inserted.MaSP, @MaHoaDon = Inserted.MaHoaDon, @SoLuong = SoLuong FROM INSERTED
    SELECT @LoaiSP = LoaiSP FROM dbo.SanPham WHERE @MaSP=MaSP
	IF (@LoaiSP = 'DT') 
	BEGIN
		SELECT @GiaNhap = GiaNhapDT, @GiaBan = GiaBanDT, @ptGiamGia = [%GiamGia], @SLHienTai = SLHienTai FROM dbo.DienThoai WHERE @MaSP = MaDT
		SET @SLHienTai -= @SoLuong
		SET @LoiNhuan = (@GiaBan - @GiaBan*@ptGiamGia/100 - @GiaNhap)*@SoLuong
		IF (@SLHienTai < 0) ROLLBACK TRANSACTION
		ELSE
		BEGIN
			UPDATE dbo.DienThoai
			SET SLHienTai -= @SoLuong,
				SLBanRaTrongNam += @SoLuong
			WHERE @MaSP = MaDT
		END 
	END
	ELSE
	BEGIN
		SET @LoiNhuan = 0;
		SET @SoLuong = 1;
		SELECT @GiaBan = GiaBanPK, @ptGiamGia = PtGiamGia FROM dbo.PhuKien WHERE @MaSP = MaPhuKien
		BEGIN
			UPDATE dbo.PhuKien
			SET SLDaBan += @SoLuong
			WHERE @MaSP = MaPhuKien
		END 
	END
	UPDATE dbo.HoaDonChiTiet
	SET DonGia = @GiaBan,
		GiamGia = (@GiaBan*@ptGiamGia/100)*@SoLuong,
		ThanhTien = (@GiaBan - @GiaBan*@ptGiamGia/100)*@SoLuong,
		LoiNhuan = @LoiNhuan
	WHERE @MaSP = MaSP AND @MaHoaDon = MaHoaDon
END
GO
----------------------------------------------------------------------------------
---TRIGGER UPDATE GIA NHAP KHI INSERT HOA DON NHAP
CREATE TRIGGER TRG_HDN_SP
ON dbo.HoaDonNhap
FOR INSERT
AS
BEGIN
	DECLARE @MaSP INT
	DECLARE @MaHoaDon INT
	DECLARE @SoLuongNhap INT
	DECLARE @LoaiSP NCHAR(10)
	DECLARE @GiaNhap FLOAT
	SELECT @MaSP = MaSP, @SoLuongNhap = SoLuong FROM INSERTED
	BEGIN
		SELECT @GiaNhap = GiaNhapDT FROM dbo.DienThoai WHERE @MaSP = MaDT
		UPDATE dbo.DienThoai
		SET SLHienTai += @SoLuongNhap
		WHERE @MaSP = MaDT
	END
	UPDATE dbo.HoaDonNhap
	SET TienNhap = @SoLuongNhap*@GiaNhap
	WHERE @MaHoaDon = MaHoaDon
END
GO