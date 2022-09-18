class OCRModel {
  final String soCmt;
  final String hoVaTen;
  final String namSinh;
  final String queQuan;
  final String noiTru;
  final String dacDiemNhanDang;
  final String ngayCap;
  final String noiCap;
  final String quocTich;
  final String ngayHetHan;
  final String gioiTinh;

  OCRModel({
    required this.soCmt,
    required this.hoVaTen,
    required this.namSinh,
    required this.queQuan,
    required this.noiTru,
    required this.dacDiemNhanDang,
    required this.ngayCap,
    required this.noiCap,
    required this.quocTich,
    required this.ngayHetHan,
    required this.gioiTinh,
  });

  factory OCRModel.fromJson(Map<String, dynamic> json) {
    return OCRModel(
        soCmt: json['soCmt'] ?? "",
        hoVaTen: json['hoVaTen'] ?? "",
        namSinh: json['namSinh'] ?? "",
        queQuan: json['queQuan'] ?? "",
        noiTru: json['noiTru'] ?? "",
        dacDiemNhanDang: json['dacDiemNhanDang'] ?? "",
        ngayCap: json['ngayCap'] ?? "",
        noiCap: json['noiCap'] ?? "",
        quocTich: json['quocTich'] ?? "",
        ngayHetHan: json['ngayHetHan'] ?? "",
        gioiTinh: json['gioiTinh'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'soCmt': soCmt,
        'hoVaTen': hoVaTen,
        'namSinh': namSinh,
        'queQuan': queQuan,
        'noiTru': noiTru,
        'dacDiemNhanDang': dacDiemNhanDang,
        'ngayCap': ngayCap,
        'noiCap': noiCap,
        'quocTich': quocTich,
        'ngayHetHan': ngayHetHan,
        'gioiTinh': gioiTinh,
      };
}
