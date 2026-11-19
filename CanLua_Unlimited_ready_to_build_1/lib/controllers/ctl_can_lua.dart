import 'package:get/get.dart';

class CanLuaController extends GetxController {
  final maCan = ''.obs;
  final ketQua = ''.obs;
  final lichSu = <String>[].obs;

  void tinhMaCan(String input) {
    // Logic tính mã cân đơn giản (có thể mở rộng theo công thức thực tế)
    if (input.isEmpty) {
      ketQua.value = '';
      return;
    }
    try {
      final so = double.parse(input.replaceAll(',', '.'));
      // Ví dụ công thức demo: mã cân = khối lượng * hệ số
      final ma = (so * 1.0).toStringAsFixed(2);
      ketQua.value = ma;
      if (!lichSu.contains(ma)) {
        lichSu.insert(0, '$input → $ma');
        if (lichSu.length > 50) lichSu.removeLast();
      }
    } catch (_) {
      ketQua.value = 'Lỗi nhập liệu';
    }
  }

  void xoaLichSu() => lichSu.clear();
}
