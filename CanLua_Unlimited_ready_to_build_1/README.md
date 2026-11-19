# Cân Lúa Unlimited

Phiên bản xây dựng lại hoàn toàn từ app Cân Lúa gốc, **không còn giới hạn 1 Nhóm / 5 Hộ nông dân**.

## Tính năng
- Quản lý Nhóm (không giới hạn số lượng)
- Quản lý Hộ nông dân trong nhóm (không giới hạn)
- Tạo Bảng tính
- Tính mã cân nhanh
- Lưu dữ liệu local (SharedPreferences)

## Cách build APK

### Yêu cầu
- Flutter SDK >= 3.0 (https://flutter.dev)
- Android Studio hoặc Android command-line tools

### Các bước

```bash
# 1. Giải nén project này
cd CanLua_Unlimited

# 2. Lấy dependencies
flutter pub get

# 3. Build APK release
flutter build apk --release

# File APK nằm ở:
# build/app/outputs/flutter-apk/app-release.apk
```

### Build App Bundle (cho Play Store)
```bash
flutter build appbundle --release
```

## Cấu trúc thư mục
```
lib/
  main.dart
  controllers/     # GetX controllers
  views/           # UI screens
  models/          # Data models
  services/        # Storage
```

## Ghi chú
- App này được viết lại sạch, không mod binary gốc.
- Không có màn hình kích hoạt / trả phí.
- Dữ liệu lưu trên máy, không gửi server.
