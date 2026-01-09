# Analisis Field Input Registrasi Ibu Hamil

## Field yang ADA di API Request dan SUDAH ADA Input Field-nya

### Dari `register_ibu_hamil_screen.dart`:
1. ✅ **nama_lengkap** → Input: Nama Lengkap (text field)
2. ✅ **nik** → Input: NIK (text field, 16 digit)
3. ✅ **date_of_birth** → Input: Tanggal Lahir (date picker)
4. ✅ **address** → Input: Jalan/No. Rumah + Kecamatan + Kota + Provinsi (dibangun dari komponen)
5. ✅ **provinsi** → Input: Provinsi (dropdown)
6. ✅ **kota_kabupaten** → Input: Kota/Kab (dropdown)
7. ✅ **kecamatan** → Input: Kecamatan (dropdown)
8. ✅ **kelurahan** → Input: Kelurahan (dari geocoding, bisa manual)
9. ✅ **location** → Input: Latitude & Longitude (dari "Gunakan Lokasi" atau geocoding)
10. ✅ **blood_type** → Input: Golongan Darah (dropdown: A+, A-, B+, B-, AB+, AB-, O+, O-)
11. ✅ **emergency_contact_name** → Input: Nama Kontak Darurat (text field)
12. ✅ **emergency_contact_phone** → Input: Nomor Telepon Kontak Darurat (text field)
13. ✅ **emergency_contact_relation** → Input: Hubungan dengan Kontak Darurat (text field)
14. ✅ **email** → Input: Email (text field)
15. ✅ **phone** → Input: Nomor Telepon (text field)
16. ✅ **password** → Input: Kata Sandi (text field, obscured)

### Dari `medical_data_screen.dart`:
17. ✅ **last_menstrual_period** → Input: HPHT (date picker)
18. ✅ **estimated_due_date** → Input: HPL (date picker, auto-calculated dari HPHT)
19. ✅ **usia_kehamilan** → Input: Usia Kehamilan (minggu) (auto-calculated dari HPHT)
20. ✅ **kehamilan_ke** → Input: Kehamilan ke-berapa (number field)
21. ✅ **jumlah_anak** → Input: Jumlah anak hidup (number field)
22. ✅ **jarak_kehamilan_terakhir** → Input: Jarak kehamilan terakhir (text field)
23. ✅ **miscarriage_number** → Input: Riwayat keguguran (Ya/Tidak toggle) - dihitung: true = 1, false = 0
24. ✅ **riwayat_kesehatan_ibu.darah_tinggi** → Input: Darah tinggi (Ya/Tidak toggle)
25. ✅ **riwayat_kesehatan_ibu.diabetes** → Input: Diabetes (Ya/Tidak toggle)
26. ✅ **riwayat_kesehatan_ibu.anemia** → Input: Anemia (Ya/Tidak toggle)
27. ✅ **riwayat_kesehatan_ibu.penyakit_jantung** → Input: Penyakit jantung (Ya/Tidak toggle)
28. ✅ **riwayat_kesehatan_ibu.asma** → Input: Asma (Ya/Tidak toggle)
29. ✅ **riwayat_kesehatan_ibu.penyakit_ginjal** → Input: Penyakit ginjal (Ya/Tidak toggle)
30. ✅ **riwayat_kesehatan_ibu.tbc_malaria** → Input: TBC/Malaria (Ya/Tidak toggle)
31. ✅ **previous_pregnancy_complications** → Input: Komplikasi kehamilan sebelumnya (text field)
32. ✅ **pernah_caesar** → Input: Persalinan caesar (Ya/Tidak toggle)
33. ✅ **pernah_perdarahan_saat_hamil** → Input: Perdarahan saat hamil sebelumnya (Ya/Tidak toggle)
34. ✅ **whatsapp_consent** → Input: Checkbox persetujuan WhatsApp

### Field yang Auto-Generated/Default (Tidak Perlu Input):
35. ✅ **age** → Dihitung otomatis dari `date_of_birth`
36. ✅ **data_sharing_consent** → Default: `false`
37. ✅ **healthcare_preference** → Default: `"puskesmas"`
38. ✅ **risk_level** → Default: `"normal"`
39. ✅ **user.role** → Default: `"ibu_hamil"`

---

## Field yang ADA di API Request tapi TIDAK ADA Input Field-nya

### Field yang Tidak Dikumpulkan (Saat ini di-set `null`):

1. ❌ **current_medications** (`String?`)
   - Status: Tidak ada input field
   - Nilai saat ini: `null`
   - Lokasi di code: `confirm_registration_view_model.dart:239`

2. ❌ **height_cm** (`double?`)
   - Status: Tidak ada input field
   - Nilai saat ini: `null`
   - Lokasi di code: `confirm_registration_view_model.dart:247`

3. ❌ **medical_history** (`String?`)
   - Status: Tidak ada input field
   - Nilai saat ini: `null`
   - Lokasi di code: `confirm_registration_view_model.dart:256`

4. ❌ **pre_pregnancy_weight_kg** (`double?`)
   - Status: Tidak ada input field
   - Nilai saat ini: `null`
   - Lokasi di code: `confirm_registration_view_model.dart:263`

5. ❌ **rt_rw** (`String?`)
   - Status: Tidak ada input field
   - Nilai saat ini: `null`
   - Lokasi di code: `confirm_registration_view_model.dart:277`

---

## Kesimpulan

**Total Field di API Request:** 39 field (termasuk nested `riwayat_kesehatan_ibu` dan `user`)

**Field dengan Input:** 34 field ✅

**Field Auto-Generated/Default:** 5 field ✅

**Field Tanpa Input (null):** 5 field ❌
- `current_medications`
- `height_cm`
- `medical_history`
- `pre_pregnancy_weight_kg`
- `rt_rw`

**Catatan:** 
- Field-field yang tidak ada input-nya saat ini di-set sebagai `null` di `_buildRegistrationRequest()` method.
- User sebelumnya menyatakan bahwa field-field ini tidak perlu dibuat karena akan diubah di backend.
- Jika diperlukan di masa depan, field-field ini bisa ditambahkan ke form registrasi.
