-- CREATE DATABASE Buoi1_Bai1
-- DROP 
GO
USE Buoi1_Bai1
-- Co 2 cach de su database:
-- USE ten csdl 
-- Chon truc tiep CSDL trong cbb
GO
CREATE TABLE DongSP(
    -- Liet ke cac thuoc tinh cua bang 
    -- ten thuoc tinh ten kieu du lieu 
    ma VARCHAR(50) PRIMARY KEY NOT NULL,
    ten NVARCHAR(100) NOT NULL
)
GO 
CREATE TABLE CuaHang(
	ma VARCHAR(50) PRIMARY KEY NOT NULL,
	ten NVARCHAR(100),
	diaChi NVARCHAR(100) NOT NULL,
	thanhPho NVARCHAR(100),
	quocGia NVARCHAR(100)
);
GO 
CREATE TABLE ChucVu(
    ma VARCHAR(50) PRIMARY KEY NOT NULL,
    ten NVARCHAR(100) NOT NULL,
    trang_thai INT DEFAULT 0 -- Gia tri default ban dau 
)
GO 
-- K co ngoai tron sau ten bang => thu tu nhap vap table
-- TRUNG VS THU TU KHI TAO BANG
INSERT INTO DongSP(ten,ma)
VALUES
    (N'Dòng SP2','DSP005'),
    ('DSP01',N'Dòng sản phẩm 1'),
    ('DSP02',N'Dòng sản phẩm 2'),
    ('DSP03',N'Dòng sản phẩm 3')

SELECT * FROM DongSP

INSERT INTO CuaHang(ten,ma,diaChi)
VALUES 
    (N'Cửa hàng 1','CH01',N'Hà Nội'),
    (N'Cửa hàng 2','CH02',N'Hà Nội1'),
    (N'Cửa hàng 3','CH03',N'Hà Nội2')
SELECT * FROM CuaHang

INSERT INTO ChucVu(ma,ten)
VALUES 
    ('CV01',N'Chức vụ 1')

INSERT INTO ChucVu
VALUES 
    ('CV002',N'Chuc vu 2',1)
SELECT * FROM ChucVu