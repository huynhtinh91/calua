import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ctl_can_lua.dart';

class CanLuaView extends StatelessWidget {
  const CanLuaView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(CanLuaController());
    final inputCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính mã cân'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: ctl.xoaLichSu,
            tooltip: 'Xóa lịch sử',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: inputCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Nhập khối lượng (kg)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale),
              ),
              onChanged: ctl.tinhMaCan,
            ),
            const SizedBox(height: 20),
            Obx(() => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Column(
                    children: [
                      const Text('Kết quả mã cân', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text(
                        ctl.ketQua.value.isEmpty ? '—' : ctl.ketQua.value,
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Lịch sử gần đây', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                if (ctl.lichSu.isEmpty) {
                  return const Center(child: Text('Chưa có lịch sử', style: TextStyle(color: Colors.grey)));
                }
                return ListView.builder(
                  itemCount: ctl.lichSu.length,
                  itemBuilder: (ctx, i) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.history, size: 20),
                    title: Text(ctl.lichSu[i]),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
