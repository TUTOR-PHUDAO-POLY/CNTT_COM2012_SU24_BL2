CREATE DATABASE Buoi4
-- Tạo bảng 
    -- Tao bang k có khoá ngoại trước 
    -- Tạo các bảng có khoá ngoại
-- Xoá bảng
    -- Xoá bảng có FK trước
    -- Xoá các bảng k có khoá ngoại 
-- KhachHang(MaKhachHang,TenKhachHang,SoDienThoai, Email ,DiaChi)
-- SanPham(MaSanPham,TenSanPham,Gia ,MoTa)
-- DonHang(MaDonHang,NgayDatHang,MaKhachHang)
-- ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,GiaBan)
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY NOT NULL,
    TenKhachHang NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    Email NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200)
)
CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY NOT NULL ,
    TenSanPham VARCHAR(100),
    Gia FLOAT,
    MoTa VARCHAR(50)
)
-- DonHang(MaDonHang,NgayDatHang,MaKhachHang)
-- Kieu du lieu FK phai trung
CREATE TABLE DonHang(
    MaDonHang VARCHAR(50) PRIMARY KEY NOT NULL,
    NgayDatHang DATE,  -- yyyy - MM - dd
    MaKhachHang INT FOREIGN KEY REFERENCES KhachHang(MaKhachHang) -- KHOA NGOAI  
    -- Gia tri cua khoa ngoai phai ton tai trong bang noi (co value cua khoa chinh)
)
-- ChiTietDonHang(MaDonHang,MaSanPham,SoLuong,GiaBan)
CREATE TABLE ChiTietDonHang(
    MaDonHang VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DonHang(MaDonHang),
    MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham), 
    SoLuong INT,
    GiaBan FLOAT,
    PRIMARY KEY (MaDonHang,MaSanPham)
)
-- INSERT INTO 
-- thu tu create ntn thi thu tu insert dung theo the 
INSERT INTO KhachHang
VALUES
    (8,N'Nguyễn Văn A','0123456789','a@fpt.edu.vn',N'Hà nội'),
    (7,N'Nguyễn Văn B','0812455454','b@fpt.edu.vn',N'Lào Cai'),
    (9,N'Lê Văn A','0913534534','c@fpt.edu.vn',N'Vĩnh Phúc'),
    (4,N'Trần Văn C','071423432','d@fpt.edu.vn',N'Thanh Hoá'),
    (5,N'Phùng Văn D','01237514325','e@fpt.edu.vn',N'Thái Bình')
select * FROM KhachHang
INSERT INTO SanPham (MaSanPham,TenSanPham,MoTa,Gia)
VALUES  
    (1,N'Sản phẩm 1','Sản phẩm tốt',10),
    (2,N'Áo','Sản phẩm tốt1',10.5),
    (3,N'Áo khoác','Sản phẩm tốt2',12.7),
    (4,N'Giày thể thao','Sản phẩm tốt3',13),
    (5,N'Sữa rửa mặt','Sản phẩm tốt4',29)
SELECT * FROM SanPham
-- makhach hang - don hang : 1,2,3,4,5,7,8,9
INSERT INTO DonHang
VALUES
    ('DH01','2025-12-30',3),
    ('DH02','2024-11-15',9),
    ('DH03','2023-09-10',1),
    ('DH09','2005-08-08',3)
SELECT * FROM DonHang
-- Khoa chinh ca 1 cap (MA DON HANG &&& MA SAN PHAM)
-- MA DON HANG  MA SAN PHAM 
-- DH01         1
-- DH01         5
-- DH02         5
INSERT INTO ChiTietDonHang
VALUES
    ('DH03',1,10,15.6),
    ('DH03',5,100,20),
    ('DH01',5,1000,90),
    ('DH01',2,15,23.3),
    ('DH03',3,20,25.6)

SELECT * FROM KhachHang
SELECT * FROM SanPham
SELECT * FROM DonHang
SELECT * FROM ChiTietDonHang

-- Hiển thị danh sách khách hàng gồm:
--  Tên khách hàng và Địa chỉ theo điều kiện địa chỉ tại Hà Nội
SELECT TenKhachHang, DiaChi
FROM KhachHang 
WHERE DiaChi = N'Hà nội'

-- Hiển thị danh sách đơn hàng gồm : 
-- Mã Đơn Hàng, Mã Khách Hàng,Ngày đặt hàng, Tên Khách Hàng, SDT
-- C1:WHERE (LIET KE CAC BANG CAN NOI VS NHAU)
SELECT dh.*,kh.TenKhachHang,kh.SoDienThoai
FROM DonHang dh, KhachHang kh
WHERE dh.MaKhachHang = kh.MaKhachHang
-- C2: INNER JOIN
SELECT dh.*,kh.TenKhachHang,kh.SoDienThoai
FROM DonHang dh INNER JOIN KhachHang kh 
ON dh.MaKhachHang = kh.MaKhachHang
-- Hiển thị danh sách đơn hàng gồm : bảng đơn hàng, Tên khách hàng, SDT khách hàng
-- theo điều kiện sđt khách hàng bắt đầu bằng 081
-- C1
SELECT dh.*,kh.TenKhachHang,kh.SoDienThoai
FROM DonHang dh, KhachHang kh
WHERE dh.MaKhachHang = kh.MaKhachHang
AND kh.SoDienThoai LIKE '081%'
-- C2
SELECT dh.*,kh.TenKhachHang,kh.SoDienThoai
FROM DonHang dh INNER JOIN KhachHang kh 
ON dh.MaKhachHang = kh.MaKhachHang
WHERE kh.SoDienThoai LIKE '081%'