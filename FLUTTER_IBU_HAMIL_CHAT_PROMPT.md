# Prompt: Fitur Chat Ibu Hamil di Aplikasi Mobile Flutter (WellMom)

Gunakan dokumen ini sebagai **spesifikasi dan prompt** untuk mengimplementasikan fitur chat pada aplikasi mobile Flutter **untuk role Ibu Hamil**, agar ibu hamil dapat berkonsultasi dengan perawat yang dipasangkan kepadanya dan melihat daftar chat di homepage.

---

## 1. KONTEKS APLIKASI

- **Nama aplikasi:** WellMom  
- **Platform:** Mobile Flutter (untuk Ibu Hamil)  
- **Role yang diimplementasikan:** **Ibu Hamil** (bukan Perawat/Puskesmas).

---

## 2. ATURAN BISNIS CHAT (PENTING)

### 2.1 Siapa yang bisa di-chat oleh Ibu Hamil?

- Ibu hamil **hanya boleh mengirim chat** kepada **perawat yang dipasangkan (assigned)** kepadanya (satu perawat utama).
- Ibu hamil **tidak boleh** memilih atau mengirim chat ke perawat lain.

### 2.2 Kapan percakapan lain muncul di list chat Ibu Hamil?

- Jika **perawat lain** (bukan perawat assigned) **menginisiasi chat duluan** ke ibu hamil tersebut, maka percakapan itu **boleh muncul** di daftar chat ibu hamil.
- Ibu hamil **hanya dapat menerima** chat dari perawat lain (tidak bisa memulai chat ke perawat lain). Jadi:
  - **Perawat assigned** → ibu hamil bisa **mulai chat** dan **balas**.
  - **Perawat lain** → hanya muncul di list **setelah perawat itu mengirim pesan pertama**; ibu hamil hanya bisa **membalas**, tidak bisa memulai.

### 2.3 Ringkasan aturan

| Aksi                         | Perawat assigned     | Perawat lain              |
|-----------------------------|----------------------|----------------------------|
| Ibu hamil memulai chat      | ✅ Boleh             | ❌ Tidak boleh             |
| Ibu hamil membalas chat    | ✅ Boleh             | ✅ Boleh (jika sudah ada)  |
| Percakapan muncul di list  | ✅ Selalu (jika ada) | ✅ Hanya jika perawat duluan chat |

Implementasi di backend/API harus memastikan:
- List conversation untuk ibu hamil hanya menampilkan conversation yang **memang melibatkan ibu hamil ini** (ibu_hamil_id = current user).
- Untuk mengirim pesan, ibu hamil mengirim ke **conversation_id** yang sudah ada, atau backend menerima **perawat_id** saat ibu hamil memulai chat (hanya diperbolehkan ke perawat assigned).

---

## 3. LOKASI UI: DAFTAR CHAT DI HOMEPAGE

- **Daftar chat** ditampilkan di **Homepage**, bagian **atas** (above the fold), mengikuti standar UI/UX aplikasi kesehatan/profesional.
- Contoh pola yang umum:
  - **Section "Konsultasi" / "Chat dengan Perawat"** di bagian atas homepage (setelah header/ greeting).
  - Satu baris horizontal: **card/list singkat** percakapan terbaru (avatar, nama perawat, preview pesan terakhir, waktu, badge unread).
  - Tap satu item → navigasi ke **halaman detail chat (Konsul)** dengan perawat tersebut.
- Pastikan:
  - Unread count / badge terlihat jelas.
  - Urutan: percakapan dengan pesan terbaru di atas.
  - Empty state: jika belum ada chat, tampilkan CTA misalnya "Mulai konsultasi dengan perawat Anda" yang mengarah ke halaman Konsul (dengan perawat assigned).

---

## 4. HALAMAN KONSUL (CHAT DETAIL)

- **Nama halaman:** Konsul / Chat dengan Perawat / Konsultasi (pilih satu, konsisten).
- **Isi halaman:**
  - Header: nama perawat (dan foto/avatar jika ada).
  - Daftar pesan (scrollable), bubble chat (kirim kanan, terima kiri).
  - Input teks + tombol kirim di bawah.
- **Perilaku:**
  - Jika ibu hamil membuka chat dengan **perawat assigned**: boleh **langsung ketik dan kirim** (mulai percakapan).
  - Jika ibu hamil membuka chat dengan **perawat lain** (yang duluan chat): hanya **balas**; tidak perlu tombol "Mulai chat" karena conversation sudah ada.
- Tidak perlu menampilkan status "online/offline" (tidak ada di API).

---

## 5. REFERENSI API BACKEND (SESUAI SWAGGER)

Backend WellMom menyediakan endpoint berikut. **Sesuaikan base URL dan auth** (Bearer token) dengan environment Flutter.

### 5.1 REST API

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/api/v1/chat/conversations` | List conversation (untuk user login: ibu hamil dapat list di mana `ibu_hamil_id` = dirinya). |
| GET | `/api/v1/chat/conversations/{conversation_id}` | Detail satu conversation. |
| GET | `/api/v1/chat/conversations/{conversation_id}/messages` | Daftar pesan dalam satu conversation (paginate: skip, limit). |
| POST | `/api/v1/chat/messages` | Kirim pesan. Body: sesuaikan dengan backend (mis. `conversation_id` + `message_text`, atau `perawat_id` + `message_text` untuk ibu hamil). |
| POST | `/api/v1/chat/conversations/{conversation_id}/mark-read` | Tandai pesan dibaca (body bisa `message_ids` opsional). |
| GET | `/api/v1/chat/conversations/{conversation_id}/unread-count` | Jumlah pesan belum dibaca. |

- **Autentikasi:** Header `Authorization: Bearer <token>` (token ibu hamil).
- Untuk **ibu hamil**, pastikan:
  - Response **GET conversations** mengembalikan hanya conversation yang `ibu_hamil_id` = user saat ini; setiap item bisa berisi `perawat_id`, `perawat_name`, `last_message_*`, `unread_count`, dll.
  - **POST messages** untuk ibu hamil: backend menerima `conversation_id` + `message_text`, atau `perawat_id` + `message_text` (jika memulai chat hanya ke perawat assigned).

### 5.2 WebSocket (wajib, untuk real-time)

- URL: `ws://<host>/api/v1/ws/chat/{conversation_id}?token=<jwt>`
- Gunakan untuk menerima pesan baru secara real-time (agar list chat dan bubble chat update tanpa pull manual).
- Event yang relevan: `new_message`, `read_receipt`; type `connection` untuk konfirmasi koneksi.

### 5.3 Data yang perlu dari backend

- **Profil ibu hamil:** Siapa **perawat_id** / perawat yang dipasangkan (assigned) kepadanya. Ini bisa dari endpoint profil ibu hamil atau dari response conversation/list perawat.
- **List conversation:** Sudah difilter per user; pastikan response menyertakan `perawat_id`, nama perawat, last message, unread count.

---

## 6. REQUIREMENT NON-FUNGSIONAL

- **Keamanan:** JWT tidak disimpan di log; hanya di secure storage.
- **Offline:** Boleh tampilkan cache list chat terakhir; saat online sync dan tunjukkan indikator loading/error.
- **Aksesibilitas:** Label yang jelas, kontras warna, dan ukuran tap target memadai (standar a11y).
- **Performance:** List chat dan list pesan di-paginate; hindari load ratusan item sekaligus.

---

## 7. CHECKLIST IMPLEMENTASI (UNTUK DEVELOPER FLUTTER)

- [ ] Integrasi auth: token ibu hamil dipakai untuk semua request chat.
- [ ] Service/repository: GET conversations, GET messages, POST message, mark-read, unread-count.
- [ ] Homepage: section chat di **atas** dengan list conversation (avatar, nama, preview, waktu, unread).
- [ ] Navigasi: tap item conversation → halaman Konsul (chat detail) dengan conversation_id yang benar.
- [ ] Halaman Konsul: header perawat, MessageList, MessageInput; kirim pesan via API.
- [ ] Aturan: hanya perawat assigned yang bisa "dimulai" chat oleh ibu hamil; perawat lain hanya bisa dibalas (setelah muncul di list).
- [ ] Empty state: belum ada chat → CTA ke Konsul (perawat assigned).
- [ ] (Opsional) WebSocket: connect per conversation_id, update UI saat dapat new_message.
- [ ] Deduplikasi pesan di UI (jika sama datang dari REST + WebSocket), pakai `message.id` unik.
- [ ] Tidak menampilkan status online/offline (tidak ada di API).

---

## 8. CONTOH PROMPT SINGKAT UNTUK AI/DEVELOPER

> Implementasikan fitur chat untuk **Ibu Hamil** di aplikasi Flutter WellMom dengan ketentuan berikut:  
> (1) Daftar chat tampil di **bagian atas Homepage** (standar UI/UX profesional).  
> (2) Ibu hamil **hanya bisa memulai chat** dengan **perawat yang dipasangkan**; perawat lain **hanya muncul di list** jika perawat itu **sudah mengirim pesan duluan**, dan ibu hamil hanya bisa **membalas**.  
> (3) Halaman detail chat bernama **Konsul**, berisi list pesan dan input kirim; gunakan API REST chat yang sama dengan backend WellMom (GET/POST conversations & messages, mark-read, unread-count).  
> (4) Jangan tampilkan status online/offline.  
> Spesifikasi lengkap ada di dokumen **FLUTTER_IBU_HAMIL_CHAT_PROMPT.md**.

---

Dokumen ini dapat diberikan kepada developer Flutter atau digunakan sebagai prompt konteks untuk alat bantu coding/AI saat mengerjakan fitur chat Ibu Hamil di WellMom.
