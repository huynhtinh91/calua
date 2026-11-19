import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/nhom.dart';
import '../services/storage_service.dart';

class NhomController extends GetxController {
  final danhSachNhom = <Nhom>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    danhSachNhom.value = await StorageService.loadNhom();
    isLoading.value = false;
  }

  Future<void> themNhom(String ten, String ghiChu) async {
    // KHÔNG CÓ GIỚI HẠN — Unlimited
    final nhom = Nhom(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tenNhom: ten,
      ghiChu: ghiChu,
    );
    danhSachNhom.add(nhom);
    await StorageService.saveNhom(danhSachNhom);
    Get.back();
    Get.snackbar('Thành công', 'Đã thêm nhóm: $ten',
        backgroundColor: Colors.green, colorText: Colors.white);
  }

  Future<void> xoaNhom(String id) async {
    danhSachNhom.removeWhere((e) => e.id == id);
    await StorageService.saveNhom(danhSachNhom);
    Get.snackbar('Đã xóa', 'Nhóm đã được xóa',
        backgroundColor: Colors.orange, colorText: Colors.white);
  }

  Future<void> themHo(String idNhom, HoNongDan ho) async {
    // KHÔNG CÓ GIỚI HẠN 5 HỘ
    final idx = danhSachNhom.indexWhere((e) => e.id == idNhom);
    if (idx >= 0) {
      danhSachNhom[idx].danhSachHo.add(ho);
      danhSachNhom.refresh();
      await StorageService.saveNhom(danhSachNhom);
    }
  }

  Future<void> xoaHo(String idNhom, String idHo) async {
    final idx = danhSachNhom.indexWhere((e) => e.id == idNhom);
    if (idx >= 0) {
      danhSachNhom[idx].danhSachHo.removeWhere((e) => e.id == idHo);
      danhSachNhom.refresh();
      await StorageService.saveNhom(danhSachNhom);
    }
  }
}
