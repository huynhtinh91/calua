import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ctl_bang_tinh.dart';
import 'package:intl/intl.dart';

class BangTinhView extends StatelessWidget {
  const BangTinhView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(BangTinhController());
    final fmt = NumberFormat('#,###', 'vi_VN');

    return Scaffold(
      appBar: AppBar(title: const Text('Bảng tính')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/add-bang-tinh'),
        icon: const Icon(Icons.add),
        label: const Text('Tạo bảng mới'),
      ),
      body: Obx(() {
        if (ctl.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (ctl.danhSachBang.isEmpty) {
          return const Center(child: Text('Chưa có bảng tính nào\nNhấn + để tạo mới', textAlign: TextAlign.center));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: ctl.danhSachBang.length,
          itemBuilder: (ctx, i) {
            final b = ctl.danhSachBang[i];
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.table_chart)),
                title: Text(b.tenBang, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${b.tenNhom} • ${b.danhSachDong.length} dòng\n'
                    'Tổng KL: ${fmt.format(b.tongKhoiLuong)} kg • Tiền: ${fmt.format(b.tongThanhTien)} đ'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => ctl.xoaBang(b.id),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
