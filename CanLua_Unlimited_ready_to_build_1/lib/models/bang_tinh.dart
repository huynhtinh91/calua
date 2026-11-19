class BangTinh {
  String id;
  String tenBang;
  String idNhom;
  String tenNhom;
  List<DongCan> danhSachDong;
  double tongKhoiLuong;
  double tongThanhTien;
  DateTime ngayTao;

  BangTinh({
    required this.id,
    required this.tenBang,
    required this.idNhom,
    required this.tenNhom,
    List<DongCan>? danhSachDong,
    this.tongKhoiLuong = 0,
    this.tongThanhTien = 0,
    DateTime? ngayTao,
  })  : danhSachDong = danhSachDong ?? [],
        ngayTao = ngayTao ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenBang': tenBang,
        'idNhom': idNhom,
        'tenNhom': tenNhom,
        'danhSachDong': danhSachDong.map((e) => e.toJson()).toList(),
        'tongKhoiLuong': tongKhoiLuong,
        'tongThanhTien': tongThanhTien,
        'ngayTao': ngayTao.toIso8601String(),
      };

  factory BangTinh.fromJson(Map<String, dynamic> json) => BangTinh(
        id: json['id'],
        tenBang: json['tenBang'],
        idNhom: json['idNhom'],
        tenNhom: json['tenNhom'],
        danhSachDong: (json['danhSachDong'] as List?)
                ?.map((e) => DongCan.fromJson(e))
                .toList() ??
            [],
        tongKhoiLuong: (json['tongKhoiLuong'] ?? 0).toDouble(),
        tongThanhTien: (json['tongThanhTien'] ?? 0).toDouble(),
        ngayTao: DateTime.parse(json['ngayTao']),
      );
}

class DongCan {
  String id;
  String tenHo;
  double khoiLuong;
  double donGia;
  double thanhTien;
  int soBao;

  DongCan({
    required this.id,
    required this.tenHo,
    this.khoiLuong = 0,
    this.donGia = 0,
    this.thanhTien = 0,
    this.soBao = 0,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'tenHo': tenHo,
        'khoiLuong': khoiLuong,
        'donGia': donGia,
        'thanhTien': thanhTien,
        'soBao': soBao,
      };

  factory DongCan.fromJson(Map<String, dynamic> json) => DongCan(
        id: json['id'],
        tenHo: json['tenHo'],
        khoiLuong: (json['khoiLuong'] ?? 0).toDouble(),
        donGia: (json['donGia'] ?? 0).toDouble(),
        thanhTien: (json['thanhTien'] ?? 0).toDouble(),
        soBao: json['soBao'] ?? 0,
      );
}
