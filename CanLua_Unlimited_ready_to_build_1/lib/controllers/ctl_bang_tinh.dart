import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/bang_tinh.dart';
import '../services/storage_service.dart';

class BangTinhController extends GetxController {
  final danhSachBang = <BangTinh>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    danhSachBang.value = await StorageService.loadBangTinh();
    isLoading.value = false;
  }

  Future<void> themBang(BangTinh bang) async {
    danhSachBang.add(bang);
    await StorageService.saveBangTinh(danhSachBang);
    Get.back();
    Get.snackbar('Thành công', 'Đã tạo bảng tính',
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  Future<void> xoaBang(String id) async {
    danhSachBang.removeWhere((e) => e.id == id);
    await StorageService.saveBangTinh(danhSachBang);
  }

  void tinhTong(BangTinh bang) {
    bang.tongKhoiLuong = bang.danhSachDong.fold(0, (s, e) => s + e.khoiLuong);
    bang.tongThanhTien = bang.danhSachDong.fold(0, (s, e) => s + e.thanhTien);
  }
}
