import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ctl_nhom.dart';
import '../models/nhom.dart';

class NhomView extends StatelessWidget {
  const NhomView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(NhomController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Nhóm'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: ctl.loadData,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/add-nhom'),
        icon: const Icon(Icons.add),
        label: const Text('Thêm Nhóm'),
      ),
      body: Obx(() {
        if (ctl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (ctl.danhSachNhom.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.group_off, size: 80, color: Colors.grey[400]),
                const SizedBox(height: 16),
                const Text('Chưa có nhóm nào', style: TextStyle(fontSize: 18, color: Colors.grey)),
                const SizedBox(height: 8),
                const Text('Nhấn nút + để thêm nhóm mới\n(Không giới hạn số lượng)', textAlign: TextAlign.center),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: ctl.danhSachNhom.length,
          itemBuilder: (ctx, i) {
            final nhom = ctl.danhSachNhom[i];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Text('${i + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                title: Text(nhom.tenNhom, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${nhom.danhSachHo.length} hộ nông dân'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      title: const Text('Xóa nhóm?'),
                      content: Text('Bạn có chắc muốn xóa "${nhom.tenNhom}"?'),
                      actions: [
                        TextButton(onPressed: () => Get.back(), child: const Text('Hủy')),
                        TextButton(
                          onPressed: () {
                            ctl.xoaNhom(nhom.id);
                            Get.back();
                          },
                          child: const Text('Xóa', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ));
                  },
                ),
                children: [
                  ...nhom.danhSachHo.map((ho) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.person, size: 20),
                        title: Text(ho.tenHo),
                        subtitle: Text(ho.soDienThoai.isEmpty ? 'Chưa có SĐT' : ho.soDienThoai),
                        trailing: IconButton(
                          icon: const Icon(Icons.close, size: 18, color: Colors.red),
                          onPressed: () => ctl.xoaHo(nhom.id, ho.id),
                        ),
                      )),
                  ListTile(
                    leading: const Icon(Icons.person_add, color: Colors.green),
                    title: const Text('Thêm hộ nông dân', style: TextStyle(color: Colors.green)),
                    onTap: () => _showAddHoDialog(context, ctl, nhom),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _showAddHoDialog(BuildContext context, NhomController ctl, Nhom nhom) {
    final tenCtrl = TextEditingController();
    final sdtCtrl = TextEditingController();
    final diaChiCtrl = TextEditingController();

    Get.dialog(AlertDialog(
      title: Text('Thêm hộ vào "${nhom.tenNhom}"'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: tenCtrl, decoration: const InputDecoration(labelText: 'Tên hộ *', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: sdtCtrl, decoration: const InputDecoration(labelText: 'Số điện thoại', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            TextField(controller: diaChiCtrl, decoration: const InputDecoration(labelText: 'Địa chỉ', border: OutlineInputBorder())),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Hủy')),
        ElevatedButton(
          onPressed: () {
            if (tenCtrl.text.trim().isEmpty) {
              Get.snackbar('Lỗi', 'Vui lòng nhập tên hộ');
              return;
            }
            final ho = HoNongDan(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              tenHo: tenCtrl.text.trim(),
              soDienThoai: sdtCtrl.text.trim(),
              diaChi: diaChiCtrl.text.trim(),
            );
            ctl.themHo(nhom.id, ho);
            Get.back();
            Get.snackbar('Thành công', 'Đã thêm hộ: ${ho.tenHo}');
          },
          child: const Text('Thêm'),
        ),
      ],
    ));
  }
}
