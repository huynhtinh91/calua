import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/ctl_splash.dart';
import 'views/view_splash.dart';
import 'views/view_menu.dart';
import 'views/view_nhom.dart';
import 'views/view_add_nhom.dart';
import 'views/view_bang_tinh.dart';
import 'views/view_add_bang_tinh.dart';
import 'views/view_can_lua.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const CanLuaApp());
}

class CanLuaApp extends StatelessWidget {
  const CanLuaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cân Lúa Unlimited',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF2E7D32),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2E7D32),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashView()),
        GetPage(name: '/menu', page: () => const MenuView()),
        GetPage(name: '/nhom', page: () => const NhomView()),
        GetPage(name: '/add-nhom', page: () => const AddNhomView()),
        GetPage(name: '/bang-tinh', page: () => const BangTinhView()),
        GetPage(name: '/add-bang-tinh', page: () => const AddBangTinhView()),
        GetPage(name: '/can-lua', page: () => const CanLuaView()),
      ],
    );
  }
}
