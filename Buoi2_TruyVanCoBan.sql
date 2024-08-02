CREATE DATABASE Buoi2
GO
USE BUOI2
GO

-- SinhVien: 
-- MaSinhVien (varchar(100)), TenSinhVien (nvarchar(100)), 
-- NgaySinh (date), GioiTinh (bit), 
-- SoDienThoai (nvarchar(20)), DiaChi (nvarchar(200)) 
CREATE TABLE sinhVien(
	maSinhVien VARCHAR (100) PRIMARY KEY NOT NULL,
	tenSinhVien NVARCHAR (100) ,
	ngaySinh DATE ,
	gioiTinh BIT,
	SDT NVARCHAR(20) NOT NULL UNIQUE,
	diaChi NVARCHAR (200)
);
-- DROP : Han che
-- DROP TABLE sinhVien
-- DROP: Xoá 
-- ALTER : Sửa/Update dữ liệu
-- KHOA
-- MaKhoa (varchar(100)), TenKhoa (nvarchar(100)), TruongKhoa (nvarchar(100)) 
CREATE TABLE Khoa(
	MaKhoa VARCHAR(100) PRIMARY KEY NOT NULL,
	TenKhoa NVARCHAR(100),
	TruongKhoa NVARCHAR(100)
);
-- Lop: 
-- MaLop (varchar(100)), MaKhoa (varchar(100)),TenLop (nvarchar(100)), 
-- GiaoVienChuNhiem (nvarchar(100))
CREATE TABLE LOP (
    MaLop VARCHAR(100) NOT NULL,
    MaKhoa VARCHAR(100) NOT NULL,
    TenLop NVARCHAR(100),
    GiaoVienChuNhiem NVARCHAR(100),
    PRIMARY KEY (MaKhoa, MaLop)
    -- Khoa chinh (MaLop & MaKhoa)
) 
-- 1 bang Khoa chinh => 1 khoa chinh
-- 1 bang co 1 khoa chinh. Nhung no co the co nhieu thuoc tinh khoa chinh  
-- MonHoc: 
-- MaMonHoc (varchar(100)), MaKhoa (varchar(100))
-- TenMonHoc(nvarchar(100)), SoTinChi (int), SoHocPhan (int)

CREATE TABLE MonHoc(
    MaMonHoc VARCHAR(100) NOT NULL,
    MaKhoa VARCHAR(100) NOT NULL,
    TenMonHoc NVARCHAR(100),
    SoTinChi INT,
    SoHocPham INT
    PRIMARY KEY(MaMonHoc,MaKhoa)
)

-- INSERT 
INSERT INTO SinhVien 
VALUES
    ('SV001', 'Nguyen Van A', '2000-01-01', 1, '0912345678', 'Ha Noi'),
    ('SV002', 'Le Thi B', '2000-02-02', 0, '0923456789', 'Ho Chi Minh'),
    ('SV003', 'Tran Van C', '2000-03-03', 1, '0934567890', 'Da Nang'),
    ('SV004', 'Phan Thi D', '2000-04-04', 0, '0945678901', 'Hue'),
    ('SV005', 'Nguyen Thi E', '2000-05-05', 0, '0956789012', 'Nha Trang'),
    ('SV006', 'Do Van F', '2000-06-06', 1, '0967890123', 'Can Tho'),
    ('SV007', 'Ho Thi G', '2000-07-07', 0, '0978901234', 'Vinh'),
    ('SV008', 'Nguyen Van H', '2000-08-08', 1, '0989012345', 'Thanh Hoa'),
    ('SV009', 'Mai Thi I', '2000-09-09', 0, '0990123456', 'Quang Nam'),
    ('SV010', 'Vu Thi J', '2000-10-10', 0, '0901234567', 'Binh Duong');
INSERT INTO Khoa 
VALUES
    ('K001', 'Khoa Toan', 'Nguyen Van X'),
    ('K002', 'Khoa Ly', 'Le Thi Y'),
    ('K003', 'Khoa Hoa', 'Tran Van Z'),
    ('K004', 'Khoa Sinh', 'Phan Thi W'),
    ('K005', 'Khoa Van', 'Nguyen Thi Q'),
    ('K006', 'Khoa Su', 'Do Van R'),
    ('K007', 'Khoa Dia', 'Ho Thi S'),
    ('K008', 'Khoa GDTC', 'Nguyen Van T'),
    ('K009', 'Khoa Cong Nghe', 'Mai Thi U'),
    ('K010', 'Khoa Ngoai Ngu', 'Vu Thi V');
INSERT INTO Lop
VALUES
    ('L001', 'K001', 'Lop Toan 1', 'Nguyen Van X'),
    ('L002', 'K002', 'Lop Ly 1', 'Le Thi Y'),
    ('L003', 'K003', 'Lop Hoa 1', 'Tran Van Z'),
    ('L004', 'K004', 'Lop Sinh 1', 'Phan Thi W'),
    ('L005', 'K005', 'Lop Van 1', 'Nguyen Thi Q'),
    ('L006', 'K006', 'Lop Su 1', 'Do Van R'),
    ('L007', 'K007', 'Lop Dia 1', 'Ho Thi S'),
    ('L008', 'K008', 'Lop GDTC 1', 'Nguyen Van T'),
    ('L009', 'K009', 'Lop Cong Nghe 1', 'Mai Thi U'),
    ('L010', 'K010', 'Lop Ngoai Ngu 1', 'Vu Thi V');
INSERT INTO MonHoc 
 VALUES
    ('MH001', 'K001', 'Dai So', 3, 1),
    ('MH002', 'K002', 'Quang Học', 4, 2),
    ('MH003', 'K003', 'Hóa Hữu Cơ', 3, 1),
    ('MH004', 'K004', 'Di Truyền Học', 2, 1),
    ('MH005', 'K005', 'Văn Học', 3, 1),
    ('MH006', 'K006', 'Lịch Sử Thế Giới', 3, 1),
    ('MH007', 'K007', 'Địa Lý Kinh Tế', 2, 1),
    ('MH008', 'K008', 'Thể Dục Thể Thao', 1, 1),
    ('MH009', 'K009', 'Công Nghệ Thông Tin', 4, 2),
    ('MH010', 'K010', 'Tiếng Anh', 3, 1);

SELECT * FROM SINHVIEN
SELECT * FROM KHOA
SELECT * FROM LOP
SELECT * FROM MonHoc
-- BIT : Chi co the nhap vao 0/1 
-- Ngay sinh: nam - thang- ngay (yyyy - MM - DD)
-- Thêm vào bảng SinhVien trường diemTrungBinh - float 
ALTER TABLE SinhVien 
ADD diemTrungBinh FLOAT
SELECT * FROM sinhvien
-- Xóa tất cả bản ghi của sinh viên có giới tính là 0 
DELETE FROM sinhvien 
WHERE gioitinh = 0
-- Update địa chỉ, ten của SinhVien theo mã sinh viên
UPDATE sinhvien 
SET diaChi = 'Viet Nam', tenSinhVien = 'abc'
WHERE maSinhVien = 'SV001'
-- Hiển thị tất cả danh sách sinh viên có mã là SV001. 
SELECT *
FROM SinhVien 
WHERE maSinhVien = 'SV001'
-- De yeu cao ss 2 gia vi nhau (Co gia tri dung bang)=> = 
-- Kiem tra chua/Bat dau bang/ Ket thuc bang => LIKE 
-- -- Bat dau bang:
--     LIKE 'gia tri%'
--     -- LIKE '081%'
-- -- Ket thuc bang
--     LIKE '%gia tri'
-- -- Kiem tra chua 
--     LIKE '%gia tri%'
-- Hiển thị tất cả các sinh viên có mã là SV001 và sdt bắt đầu bằng “081”. 
-- Hiển thị tất cả các môn học có số tín chỉ trong khoảng 2 – 3. 
-- Hiển thị tất cả các sinh viên có tên chứa chữ “a” và có sđt kết thúc là “8687”. 
-- Hiển thị top 3 môn học có số tín chỉ <= 5. 
-- Hiển thị tất cả các sinh viên có ngày sinh 
-- trong khoảng từ “2000-01-01” đến “2002-12-31”. 
