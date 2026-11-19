import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/nhom.dart';
import '../models/bang_tinh.dart';

class StorageService {
  static const String _keyNhom = 'danh_sach_nhom';
  static const String _keyBangTinh = 'danh_sach_bang_tinh';

  static Future<List<Nhom>> loadNhom() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyNhom);
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List;
    return list.map((e) => Nhom.fromJson(e)).toList();
  }

  static Future<void> saveNhom(List<Nhom> list) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(list.map((e) => e.toJson()).toList());
    await prefs.setString(_keyNhom, raw);
  }

  static Future<List<BangTinh>> loadBangTinh() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyBangTinh);
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List;
    return list.map((e) => BangTinh.fromJson(e)).toList();
  }

  static Future<void> saveBangTinh(List<BangTinh> list) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(list.map((e) => e.toJson()).toList());
    await prefs.setString(_keyBangTinh, raw);
  }
}
