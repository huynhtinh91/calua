class Nhom {
  String id;
  String tenNhom;
  String ghiChu;
  DateTime ngayTao;
  List<HoNongDan> danhSachHo;

  Nhom({
    required this.id,
    required this.tenNhom,
    this.ghiChu = '',
    DateTime? ngayTao,
    List<HoNongDan>? danhSachHo,
  })  : ngayTao = ngayTao ?? DateTime.now(),
        danhSachHo = danhSachHo ?? [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenNhom': tenNhom,
        'ghiChu': ghiChu,
        'ngayTao': ngayTao.toIso8601String(),
        'danhSachHo': danhSachHo.map((e) => e.toJson()).toList(),
      };

  factory Nhom.fromJson(Map<String, dynamic> json) => Nhom(
        id: json['id'],
        tenNhom: json['tenNhom'],
        ghiChu: json['ghiChu'] ?? '',
        ngayTao: DateTime.parse(json['ngayTao']),
        danhSachHo: (json['danhSachHo'] as List?)
                ?.map((e) => HoNongDan.fromJson(e))
                .toList() ??
            [],
      );
}

class HoNongDan {
  String id;
  String tenHo;
  String soDienThoai;
  String diaChi;
  String ghiChu;

  HoNongDan({
    required this.id,
    required this.tenHo,
    this.soDienThoai = '',
    this.diaChi = '',
    this.ghiChu = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenHo': tenHo,
        'soDienThoai': soDienThoai,
        'diaChi': diaChi,
        'ghiChu': ghiChu,
      };

  factory HoNongDan.fromJson(Map<String, dynamic> json) => HoNongDan(
        id: json['id'],
        tenHo: json['tenHo'],
        soDienThoai: json['soDienThoai'] ?? '',
        diaChi: json['diaChi'] ?? '',
        ghiChu: json['ghiChu'] ?? '',
      );
}
