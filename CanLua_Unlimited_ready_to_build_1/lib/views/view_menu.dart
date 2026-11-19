import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cân Lúa Unlimited'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _menuCard(
              icon: Icons.group,
              title: 'Quản lý Nhóm',
              subtitle: 'Không giới hạn',
              color: Colors.blue,
              onTap: () => Get.toNamed('/nhom'),
            ),
            _menuCard(
              icon: Icons.calculate,
              title: 'Bảng tính',
              subtitle: 'Tính tiền lúa',
              color: Colors.orange,
              onTap: () => Get.toNamed('/bang-tinh'),
            ),
            _menuCard(
              icon: Icons.scale,
              title: 'Tính mã cân',
              subtitle: 'Nhập số → ra mã',
              color: Colors.teal,
              onTap: () => Get.toNamed('/can-lua'),
            ),
            _menuCard(
              icon: Icons.info_outline,
              title: 'Thông tin',
              subtitle: 'Phiên bản Unlimited',
              color: Colors.purple,
              onTap: () {
                Get.dialog(AlertDialog(
                  title: const Text('Cân Lúa Unlimited'),
                  content: const Text(
                    'Phiên bản không giới hạn.\n\n'
                    '• Không giới hạn số Nhóm\n'
                    '• Không giới hạn số Hộ nông dân\n'
                    '• Xuất Excel, chia sẻ dễ dàng\n\n'
                    'Xây dựng lại từ đầu dựa trên app gốc.',
                  ),
                  actions: [
                    TextButton(onPressed: () => Get.back(), child: const Text('Đóng')),
                  ],
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, size: 36, color: color),
              ),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600]), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
