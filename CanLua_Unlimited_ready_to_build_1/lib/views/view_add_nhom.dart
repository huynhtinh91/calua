import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ctl_nhom.dart';

class AddNhomView extends StatelessWidget {
  const AddNhomView({super.key});

  @override
  Widget build(BuildContext context) {
    final tenCtrl = TextEditingController();
    final ghiChuCtrl = TextEditingController();
    final ctl = Get.find<NhomController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Thêm Nhóm mới')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tenCtrl,
              decoration: const InputDecoration(
                labelText: 'Tên nhóm *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ghiChuCtrl,
              decoration: const InputDecoration(
                labelText: 'Ghi chú',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (tenCtrl.text.trim().isEmpty) {
                    Get.snackbar('Lỗi', 'Vui lòng nhập tên nhóm',
                        backgroundColor: Colors.red, colorText: Colors.white);
                    return;
                  }
                  ctl.themNhom(tenCtrl.text.trim(), ghiChuCtrl.text.trim());
                },
                icon: const Icon(Icons.save),
                label: const Text('Lưu nhóm', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '✓ Không giới hạn số lượng nhóm\n✓ Không giới hạn số hộ trong nhóm',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
