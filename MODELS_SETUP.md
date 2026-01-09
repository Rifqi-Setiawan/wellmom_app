# WellMom Models Setup Guide

## Dependencies Added

Models menggunakan **Freezed** untuk code generation. Dependencies yang ditambahkan:

```yaml
dependencies:
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
```

## Setup Steps

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate Code
Jalankan build_runner untuk generate freezed files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Atau untuk watch mode (auto-rebuild saat file berubah):
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 3. Verify Generation
Setelah generate, pastikan file-file berikut terbuat:
- `*.freezed.dart` - Freezed generated code
- `*.g.dart` - JSON serialization code

## Models Created

### Core Models
- `lib/core/models/location.dart` - Location model untuk lat/lng

### Auth Models
- `lib/features/auth/data/models/user_model.dart`
- `lib/features/auth/data/models/ibu_hamil_model.dart`
- `lib/features/auth/data/models/riwayat_kesehatan_ibu_model.dart`
- `lib/features/auth/data/models/kerabat_model.dart`

### Health Models
- `lib/features/health/data/models/health_record_model.dart`

## Usage Example

```dart
import 'package:wellmom_app/features/auth/data/models/user_model.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';

// Parse from JSON
final userJson = {
  'id': 1,
  'phone': '+6281234567890',
  'full_name': 'Sari Dewi',
  'role': 'ibu_hamil',
  'is_active': true,
  'is_verified': true,
  'created_at': '2024-01-15T10:30:00Z',
  'updated_at': '2024-01-20T14:45:00Z',
};

final user = UserModel.fromJson(userJson);

// Validate
if (user.isValidPhone() && user.isValidRole()) {
  print('Valid user: ${user.fullName}');
}

// Update using copyWith
final updatedUser = user.copyWith(isActive: false);

// Convert to JSON
final json = updatedUser.toJson();
```

## Troubleshooting

### Error: "Target of URI doesn't exist"
- Pastikan sudah run `flutter pub run build_runner build`
- Check bahwa file `*.freezed.dart` dan `*.g.dart` sudah ter-generate

### Error: "The getter 'xxx' isn't defined"
- Pastikan import statement benar
- Re-run build_runner

### Error: "Unhandled exception: FormatException"
- Check format JSON sesuai dengan model
- Pastikan DateTime format ISO 8601
- Check nullable fields

## Next Steps

1. Run `flutter pub get`
2. Run `flutter pub run build_runner build --delete-conflicting-outputs`
3. Verify semua models bisa di-import tanpa error
4. Test dengan contoh JSON di folder `examples/`
