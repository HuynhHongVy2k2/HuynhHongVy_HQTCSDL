--- Stored Procedure
--- Câu 1 
CREATE PROC Pro_NV(@manv nvarchar(10), @tennv nvarchar(20), @gioitinh nvarchar(10), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20), @phong nvarchar(30), @Flag int)
AS
	IF @gioitinh IN('Nam', 'Nu')
	BEGIN
		IF @Flag = 0
		BEGIN
			INSERT INTO Nhanvien(manv, Tennv, Gioitinh, Diachi, Sodt, email, Phong)
			VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
		END
		ELSE 
		BEGIN
			UPDATE Nhanvien SET Tennv = @tennv, Gioitinh = @gioitinh, Diachi = @diachi, Sodt = @sodt, email = @email, Phong = @phong
			WHERE manv = @manv
		END
		RAISERROR(N'Ma Loi 0', 16,1)
	END
	ELSE 
	BEGIN
		RAISERROR(N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO

exec pro_NV 'NV02',N'Nguyễn Thị Thu',N'nam',N'Hà Nội','0982626521','thu@gmail,com',N'Kế toán',1
select * from Nhanvien 
where manv='NV02'
--CÂU 2
CREATE PROC ThemMoiSanPham122(@masp nvarchar(10), @tensp nvarchar(20), @tenhang nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money,  @donvitinh nvarchar(10), @mota nvarchar(30), @flag int)
AS
	IF @flag = 0
	BEGIN
		IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
		BEGIN
			RAISERROR (N'Ma loi 1',16,1)
			ROLLBACK TRAN
		END
		IF @soluong < 0 
		BEGIN
			RAISERROR (N'Ma loi 2',16,1)
			ROLLBACK TRAN
		END
		IF @tenhang IN (SELECT mahangsx FROM Sanpham) AND @soluong > 0
		BEGIN
			INSERT INTO Sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
			VALUES(@masp, @tenhang, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
	ELSE
	BEGIN
		IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
		BEGIN
			RAISERROR (N'Ma loi 1',16,1)
			ROLLBACK TRAN
		END
		IF @soluong < 0 
		BEGIN
			RAISERROR (N'Ma loi 2',16,1)
			ROLLBACK TRAN
		END
		ELSE
		BEGIN
			UPDATE Sanpham SET mahangsx = @tenhang, tensp = @tensp, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
			WHERE masp = @masp
			RAISERROR (N'Ma loi 0',16,1)
		END
	END
GO
EXEC ThemMoiSanPham122 'SP01','H02',N'F1 Plus','100',N'Xám','7000000',N'Chiếc',N'Hàng cận cao cấp',0

--- Câu 3
CREATE PROC XoaNhanVien (@manv nvarchar(10))
AS
	IF @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		DELETE FROM Nhanvien WHERE manv = @manv
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
		RAISERROR(N'Ma loi 0',16,1)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
--- Câu 4
--- Câu 5
CREATE PROC NhapLieuHangSX1(@mahangsx nvarchar(10), @tenhang nvarchar(20), @diachi nvarchar(20), @sodt nvarchar(10), @email nvarchar(20))
AS 
	IF @tenhang NOT IN (SELECT Tenhang FROM Hangsx)
	BEGIN
		RAISERROR (N'Ma loi 0',16,1)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
--- Câu 6
--- Câu 7



