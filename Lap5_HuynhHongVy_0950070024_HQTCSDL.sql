
use QLBanHang
go
--cau 1--
create function cau_1(@tensp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten= (select tenhang from hangsx join sanpham on hangsx.mahangsx=sanpham.mahangsx where @tensp=masp)
return @ten
end
go
print dbo.cau_1('SP02')

-- cau 2--
create function cau_2(@x int, @y int)
returns int
as
begin
declare @tong int
select @tong= sum(nhap.soluongN*nhap.dongiaN)
from nhap
where year(ngaynhap) between @x and @y
return @tong
end
go
print dbo.cau_2(2018,2020)
-- cau 3--
CREATE FUNCTION TongNhapXuat(@tensp nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongNhapXuat int
	SELECT @TongNhapXuat = soluongN - soluongX FROM Nhap INNER JOIN Xuat ON Nhap.masp = Xuat.masp INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
	WHERE Sanpham.tensp = @tensp AND YEAR(Ngaynhap) = @y AND YEAR(Ngayxuat) = @y
	RETURN @TongNhapXuat
END
GO
SELECT dbo.TongNhapXuat('GalaxyV21', 2020)
-- cau 4--
CREATE FUNCTION TongGiaTriNhapNgay(@x int, @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongGiaTriNhapNgay int
	SELECT @TongGiaTriNhapNgay = SUM(soluongN*dongiaN) FROM Nhap 
	WHERE DAY(Ngaynhap) BETWEEN @x and @y
	RETURN @TongGiaTriNhapNgay
END
GO
SELECT dbo.TongGiaTriNhapNgay(1,20)
GO
-- cau 5--
CREATE FUNCTION TongGiaTriXuat(@tenhang nvarchar(20), @y int)
RETURNS int
AS
BEGIN 
	DECLARE @TongGiaTriXuat int
	SELECT @TongGiaTriXuat = SUM(soluongX*giaban) FROM Xuat INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
	WHERE Hangsx.Tenhang = @tenhang AND YEAR(Ngayxuat) = @y
	RETURN @TongGiaTriXuat
END
GO
SELECT dbo.TongGiaTriXuat('Samsung', 2020)
GO
--cau 6--
CREATE FUNCTION ThongKeNhanVien(@tenphong nvarchar(30))
RETURNS int
AS
BEGIN 
	DECLARE @ThongKeNhanVien int
	SELECT @ThongKeNhanVien = Count(Phong) FROM Nhanvien 
	WHERE Nhanvien.Phong = @tenphong
	RETURN @ThongKeNhanVien
END
GO
SELECT dbo.ThongKeNhanVien('Ke Toan')
GO