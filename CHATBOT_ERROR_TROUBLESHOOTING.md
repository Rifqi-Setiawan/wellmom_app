# Troubleshooting: Error "Model AI tidak ditemukan"

## 🔍 Analisis Masalah

Error **"Model AI tidak ditemukan"** muncul ketika:
1. **Model initialization gagal** saat startup aplikasi
2. **Model gagal saat runtime** (saat mengirim pesan ke Gemini API)
3. **API key tidak valid** atau tidak memiliki akses ke model Gemini
4. **Service belum di-restart** setelah update kode

## 🛠️ Langkah Troubleshooting

### 1. Cek Status Service

**Endpoint untuk cek status:**
```bash
GET /api/v1/chatbot/status
```

**Response yang diharapkan:**
```json
{
  "is_available": true,
  "model_name": "gemini-1.5-flash-latest",
  "api_key_configured": true,
  "error": null
}
```

**Jika `is_available: false`:**
- Cek `error` field untuk detail
- Cek `api_key_configured` apakah `true`
- Lihat logs backend untuk detail error

### 2. Cek Logs Backend

```bash
# Di VPS
docker logs wellmom_backend | grep -i "gemini\|chatbot\|error"

# Expected output jika berhasil:
# INFO: Successfully initialized Gemini model: gemini-1.5-flash-latest

# Jika error:
# ERROR: Failed to initialize model gemini-1.5-flash-latest: 404 models/gemini-1.5-flash-latest is not found
```

### 3. Verifikasi Environment Variables

```bash
# Di VPS, cek apakah GEMINI_API_KEY sudah di-set
docker exec wellmom_backend env | grep GEMINI

# Expected output:
# GEMINI_API_KEY=AIzaSy...
```

**Jika tidak ada:**
1. Edit `.env` file di VPS
2. Tambahkan `GEMINI_API_KEY=your_key_here`
3. Restart container: `docker-compose restart wellmom_backend`

### 4. Test API Key di Google AI Studio

1. Buka https://aistudio.google.com/
2. Login dengan akun yang memiliki API key
3. Cek apakah model `gemini-1.5-flash-latest` atau `gemini-1.5-flash` tersedia
4. Test API key dengan membuat request manual

### 5. Cek Database Migration

Pastikan tabel chatbot sudah dibuat:
```bash
docker exec -it wellmom_postgres psql -U wellmom -d wellmom_db -c "\dt chatbot*"
```

**Expected output:**
```
                    List of relations
 Schema |            Name             | Type  | Owner
--------+-----------------------------+-------+--------
 public | chatbot_conversations       | table | wellmom
 public | chatbot_messages            | table | wellmom
 public | chatbot_user_usage         | table | wellmom
 public | chatbot_global_usage       | table | wellmom
```

**Jika tabel tidak ada:**
```bash
docker exec -i wellmom_postgres psql -U wellmom -d wellmom_db < migrations/create_chatbot_tables.sql
```

### 6. Restart Service

Setelah update kode atau environment variables:
```bash
docker-compose restart wellmom_backend
```

Tunggu 5-10 detik, lalu cek logs:
```bash
docker logs wellmom_backend --tail 50
```

## 🔧 Solusi Berdasarkan Error Message

### Error: "GEMINI_API_KEY tidak ditemukan"

**Penyebab:** Environment variable tidak di-set

**Solusi:**
1. Edit `.env` file di VPS
2. Tambahkan: `GEMINI_API_KEY=your_api_key_here`
3. Restart: `docker-compose restart wellmom_backend`

### Error: "404 models/gemini-1.5-flash-latest is not found"

**Penyebab:** API key tidak memiliki akses ke model tersebut

**Solusi:**
1. Service akan otomatis mencoba model lain (fallback)
2. Cek logs untuk melihat model mana yang berhasil
3. Jika semua model gagal:
   - Verifikasi API key di Google AI Studio
   - Pastikan API key masih aktif
   - Cek apakah ada quota limit yang tercapai

### Error: "Gagal menginisialisasi model AI"

**Penyebab:** Semua model gagal di-initialize

**Solusi:**
1. Cek API key di Google AI Studio
2. Generate API key baru jika perlu
3. Update `.env` dengan API key baru
4. Restart service

### Error: "Model tidak terinisialisasi"

**Penyebab:** Service gagal initialize saat startup

**Solusi:**
1. Cek logs untuk detail error
2. Pastikan `google-generativeai` package terinstall:
   ```bash
   docker exec -it wellmom_backend pip install google-generativeai>=0.8.0
   ```
3. Restart service

## 📋 Checklist Verifikasi

Setelah deploy, verifikasi:

- [ ] Environment variable `GEMINI_API_KEY` sudah di-set
- [ ] Package `google-generativeai` terinstall
- [ ] Database migration sudah dijalankan (tabel chatbot ada)
- [ ] Service sudah di-restart setelah update
- [ ] Logs menunjukkan "Successfully initialized Gemini model"
- [ ] Endpoint `/api/v1/chatbot/status` mengembalikan `is_available: true`
- [ ] Test send message berhasil

## 🚨 Jika Masih Error

1. **Share informasi berikut:**
   - Response dari `/api/v1/chatbot/status`
   - Logs backend (last 50 lines)
   - Error message dari Flutter app

2. **Cek di Google AI Studio:**
   - Apakah API key masih valid?
   - Apakah ada quota limit?
   - Model mana yang tersedia?

3. **Test manual dengan curl:**
   ```bash
   curl -X POST "http://localhost:8000/api/v1/chatbot/send" \
     -H "Authorization: Bearer YOUR_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{"message": "Halo"}'
   ```

## 📞 Support

Jika masalah masih berlanjut:
1. Cek dokumentasi: `DEPLOY_CHATBOT_TO_VPS.md`
2. Cek testing guide: `CHATBOT_TESTING_GUIDE.md`
3. Share error logs dan status endpoint response
