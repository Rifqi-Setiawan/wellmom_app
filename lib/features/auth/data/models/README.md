# WellMom Models Documentation

## Overview
Models untuk aplikasi WellMom menggunakan **Freezed** untuk code generation dengan immutability dan JSON serialization.

## Models Structure

### 1. UserModel
Model untuk user authentication dan management.

**Fields:**
- `id` (int, required)
- `email` (String?, nullable)
- `phone` (String, required, E.164 format)
- `fullName` (String, required)
- `role` (String, required: 'ibu_hamil' atau 'kerabat')
- `profilePhotoUrl` (String?, nullable)
- `isActive` (bool, default: true)
- `isVerified` (bool, default: false)
- `createdAt` (DateTime, required)
- `updatedAt` (DateTime, required)

**Validation Methods:**
- `isValidPhone()` - Validasi format E.164
- `isValidRole()` - Validasi role

**Usage:**
```dart
final user = UserModel.fromJson(jsonData);
if (user.isValidPhone() && user.isValidRole()) {
  // Process user
}
```

### 2. IbuHamilModel
Model komprehensif untuk data ibu hamil.

**Key Features:**
- Data pribadi (NIK, tanggal lahir, alamat)
- Data kehamilan (HPHT, HPL, usia kehamilan)
- Riwayat kesehatan (nested object)
- Kontak darurat
- Assignment ke puskesmas/perawat

**Validation Methods:**
- `isValidNik()` - Validasi NIK 16 digit
- `isValidRiskLevel()` - Validasi risk level

**Usage:**
```dart
final ibuHamil = IbuHamilModel.fromJson(jsonData);
if (ibuHamil.isValidNik()) {
  // Process data
}
```

### 3. RiwayatKesehatanIbuModel
Nested model untuk riwayat kesehatan ibu.

**Fields:**
- `darahTinggi` (bool, default: false)
- `diabetes` (bool, default: false)
- `anemia` (bool, default: false)
- `penyakitJantung` (bool, default: false)
- `asma` (bool, default: false)
- `penyakitGinjal` (bool, default: false)
- `tbcMalaria` (bool, default: false)

### 4. KerabatModel
Model untuk relasi kerabat dengan ibu hamil.

**Fields:**
- `id` (int, required)
- `kerabatUserId` (int, required)
- `ibuHamilId` (int, required)
- `relationType` (String, required)
- `isPrimaryContact` (bool, default: false)
- `canViewRecords` (bool, default: true)
- `canReceiveNotifications` (bool, default: true)
- `inviteCode` (String?, nullable)

### 5. HealthRecordModel
Model untuk catatan kesehatan/checkup.

**Fields:**
- Data checkup (tanggal, tipe, sumber data)
- Data vital (tekanan darah, gula darah, suhu, dll)
- Data kehamilan (usia kehamilan, tinggi fundus)
- Diagnosis dan treatment plan
- Referral information

**Validation Methods:**
- `isValidCheckupType()` - Validasi tipe checkup
- `isValidDataSource()` - Validasi sumber data

### 6. Location
Model untuk koordinat geografis.

**Fields:**
- `latitude` (double, required)
- `longitude` (double, required)

## Code Generation

Setelah membuat atau mengubah models, jalankan:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

Atau untuk watch mode (auto-rebuild):

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## JSON Examples

Contoh JSON untuk setiap model tersedia di folder `examples/`:
- `user_model_example.json`
- `ibu_hamil_model_example.json`
- `kerabat_model_example.json`
- `health_record_model_example.json`

## Best Practices

1. **Always use copyWith for updates:**
   ```dart
   final updatedUser = user.copyWith(isActive: false);
   ```

2. **Validate before processing:**
   ```dart
   if (!user.isValidPhone()) {
     throw ValidationException('Invalid phone format');
   }
   ```

3. **Handle nullable fields:**
   ```dart
   final email = user.email ?? 'No email provided';
   ```

4. **Use fromJson for API responses:**
   ```dart
   final user = UserModel.fromJson(response.data);
   ```

5. **Use toJson for API requests:**
   ```dart
   final json = user.toJson();
   await api.post('/users', data: json);
   ```
