import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ctl_bang_tinh.dart';
import '../controllers/ctl_nhom.dart';
import '../models/bang_tinh.dart';

class AddBangTinhView extends StatefulWidget {
  const AddBangTinhView({super.key});

  @override
  State<AddBangTinhView> createState() => _AddBangTinhViewState();
}

class _AddBangTinhViewState extends State<AddBangTinhView> {
  final tenCtrl = TextEditingController();
  String? selectedNhomId;
  String selectedNhomTen = '';

  @override
  Widget build(BuildContext context) {
    final bangCtl = Get.find<BangTinhController>();
    final nhomCtl = Get.put(NhomController());

    return Scaffold(
      appBar: AppBar(title: const Text('Tạo bảng tính mới')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tenCtrl,
              decoration: const InputDecoration(
                labelText: 'Tên bảng tính *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (nhomCtl.danhSachNhom.isEmpty) {
                return const Text('Chưa có nhóm nào. Hãy tạo nhóm trước.', style: TextStyle(color: Colors.red));
              }
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Chọn nhóm *',
                  border: OutlineInputBorder(),
                ),
                value: selectedNhomId,
                items: nhomCtl.danhSachNhom
                    .map((n) => DropdownMenuItem(value: n.id, child: Text(n.tenNhom)))
                    .toList(),
                onChanged: (v) {
                  setState(() {
                    selectedNhomId = v;
                    selectedNhomTen = nhomCtl.danhSachNhom.firstWhere((e) => e.id == v).tenNhom;
                  });
                },
              );
            }),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (tenCtrl.text.trim().isEmpty || selectedNhomId == null) {
                    Get.snackbar('Lỗi', 'Vui lòng nhập đủ thông tin');
                    return;
                  }
                  final bang = BangTinh(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    tenBang: tenCtrl.text.trim(),
                    idNhom: selectedNhomId!,
                    tenNhom: selectedNhomTen,
                  );
                  bangCtl.themBang(bang);
                },
                icon: const Icon(Icons.save),
                label: const Text('Tạo bảng tính'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
