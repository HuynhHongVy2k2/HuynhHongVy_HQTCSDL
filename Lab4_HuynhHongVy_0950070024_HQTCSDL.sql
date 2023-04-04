CREATE VIEW View1_lap3 as
SELECT tenhang, COUNT(*) as N'Tong sp'
FROM Hangsx,Sanpham
GROUP BY tenhang
GO

CREATE VIEW View2_lap3 as
SELECT tenhang, COUNT(*) as N'Tong sp'
FROM Hangsx,Sanpham
GROUP BY tenhang
go

CREATE VIEW View3_lap3 as
SELECT tenhang, COUNT(*) as N'Tong sp'
FROM Hangsx,Sanpham
GROUP BY tenhang
go

CREATE VIEW View4_lap3 as
SELECT Tennv, Phong, count(manv) as Nhanvien
FROM Nhanvien 
WHERE Gioitinh = 'Nam' 
GROUP BY Tennv, Phong
go

CREATE VIEW View5_lap3 as
SELECT Tenhang, tensp, soluongN
FROM Nhap
JOIN Sanpham ON Nhap.Masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.Mahangsx
WHERE YEAR(Ngaynhap) = 2018
GROUP BY Tenhang, tensp, soluongN
go

CREATE VIEW View6_lap3 as
SELECT Sohdx, Nhanvien.Manv, soluongX
FROM Xuat
JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE YEAR(Ngayxuat) = 2018
GROUP BY Sohdx, Nhanvien.Manv, soluongX
go

CREATE VIEW View7_lap3 as
SELECT Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap, tiennhap=soluongN*dongiaN
FROM Nhap INNER JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE YEAR(Ngaynhap) = 2018 AND MONTH(Ngaynhap) = 8 AND dongiaN>100000
GROUP BY Sohdn, Nhanvien.Manv, soluongN, dongiaN, Ngaynhap
go

CREATE VIEW View9_lap3 as
SELECT Nhap.Masp, Ngaynhap, Ngayxuat, dongiaN
FROM Nhap INNER JOIN Xuat ON Nhap.Masp = Xuat.Masp
WHERE YEAR(Ngaynhap) = 2018 AND YEAR(Ngayxuat) = 2018
go

CREATE VIEW View10_lap3 as
SELECT Manv, Tennv FROM Nhanvien
WHERE EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go

CREATE VIEW View11_lap3 as
SELECT Manv, Tennv FROM Nhanvien
WHERE NOT EXISTS(SELECT *FROM Nhap INNER JOIN Xuat ON Nhap.Manv = Xuat.Manv AND Nhap.Manv = Nhanvien.Manv)
go

drop view View1_lap3
drop view View2_lap3
drop view View3_lap3
drop view View4_lap3
drop view View5_lap3
drop view View6_lap3
drop view View7_lap3
drop view View9_lap3
drop view View10_lap3 
drop view View11_lap3