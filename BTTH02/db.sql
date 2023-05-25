
CREATE TABLE Sinh_vien (
  ID_sinh_vien INT PRIMARY KEY,
  Ten_sinh_vien VARCHAR(255),
  Ngay_sinh DATE,
  Email VARCHAR(255),
  Thong_tin_lien_he VARCHAR(255)
);


CREATE TABLE Khoa_hoc (
  ID_khoa_hoc INT PRIMARY KEY,
  Ma_khoa_hoc VARCHAR(255),
  Tieu_de VARCHAR(255),
  Mo_ta TEXT
);


CREATE TABLE Su_tham_du (
  ID_tham_du INT PRIMARY KEY AUTO_INCREMENT,
  Ngay DATE,
  ID_lop_hoc_phan INT,
  ID_sinh_vien INT,
  Trang_thai_tham_du VARCHAR(255),
  FOREIGN KEY (ID_lop_hoc_phan) REFERENCES Lop_hoc_phan(ID_lop_hoc_phan),
  FOREIGN KEY (ID_sinh_vien) REFERENCES Sinh_vien(ID_sinh_vien)
);


CREATE TABLE Giang_vien (
  ID_giang_vien INT PRIMARY KEY,
  Ten_giang_vien VARCHAR(255),
  Email VARCHAR(255),
  Thong_tin_lien_he VARCHAR(255)
);


CREATE TABLE Lop_hoc_phan (
  ID_lop_hoc_phan INT PRIMARY KEY,
  ID_khoa_hoc INT,
  ID_giang_vien INT,
  Khoang_thoi_gian VARCHAR(255),
  FOREIGN KEY (ID_khoa_hoc) REFERENCES Khoa_hoc(ID_khoa_hoc),
  FOREIGN KEY (ID_giang_vien) REFERENCES Giang_vien(ID_giang_vien)
);


CREATE TABLE Bao_cao (
  ID_bao_cao INT PRIMARY KEY AUTO_INCREMENT,
  ID_khoa_hoc INT,
  ID_sinh_vien INT,
  So_lieu_thong_ke VARCHAR(255),
  FOREIGN KEY (ID_khoa_hoc) REFERENCES Khoa_hoc(ID_khoa_hoc),
  FOREIGN KEY (ID_sinh_vien) REFERENCES Sinh_vien(ID_sinh_vien)
);


CREATE TABLE Xac_thuc_va_uy_quyen (
  ID_nguoi_dung INT PRIMARY KEY,
  Vai_tro VARCHAR(255),
);
