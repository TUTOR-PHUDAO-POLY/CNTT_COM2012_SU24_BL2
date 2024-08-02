CREATE DATABASE Tutor_COM2012_Buoi3
-- HocVien(MaHocVien, TenHocVien, NgaySinh, DiaChi, CCCD, SDT, Email)
-- KhoaHoc(MaKhoaHoc, TenKhoaHoc, NgayBatDau, NgayKetThuc)
-- KetQuaHocTap(MaHocVien, MaKhoaHoc, Diem)
CREATE TABLE hocvien(
    maHocVien VARCHAR(20) NOT NULL PRIMARY KEY,
    tenHocVien NVARCHAR(50) NOT NULL,
    ngaySinh DATE, 
    diaChi NVARCHAR(100),
    CCCD VARCHAR(20) NOT NULL,
    sdt VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
)

CREATE TABLE KhoaHoc(
    maKhoaHoc VARCHAR(20) NOT NULL PRIMARY KEY,
    tenKhoaHoc NVARCHAR(50) NOT NULL,
    ngayBatDau DATE, 
    ngayKetThuc DATE, 
)
CREATE TABLE KetQuaHocTap(
    -- C1: them truc tiep FOREIGN KEY
    maHocVien1 VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES HocVien(maHocVien), 
    maKhoaHoc1 VARCHAR(20) NOT NULL,
    diem FLOAT
    PRIMARY KEY(maHocVien1,maKhoaHoc1),
    -- C2: contraint 
    CONSTRAINT FK_KhoaHoc FOREIGN KEY (maKhoaHoc1) REFERENCES KhoaHoc(maKhoaHoc)
)