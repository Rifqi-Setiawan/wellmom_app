# Prompt: Fitur Forum Diskusi untuk Perawat di Website (WellMom)

Gunakan dokumen ini sebagai **spesifikasi dan prompt** untuk mengimplementasikan fitur **Forum Diskusi** pada **website** (bukan aplikasi mobile), agar perawat dapat berdiskusi, membuat postingan, filter kategori, dan membalas diskusi. Fitur ini harus **selaras** dengan forum di aplikasi mobile (kategori, metode posting, dan data yang ditampilkan), dengan **UI/UX website** yang profesional dan mengikuti style halaman lain.

---

## 1. KONTEKS

- **Platform:** Website (bukan aplikasi Flutter/mobile).
- **Role:** Perawat (nurse).
- **Nama fitur:** Forum Diskusi / Forum Diskusi Perawat.
- **Posisi akses:** Tombol atau link **Forum Diskusi** harus berada **di atas** fitur **Chat** (urutan: Forum Diskusi → Chat, atau navigasi yang menempatkan Forum Diskusi lebih atas dari Chat).

---

## 2. KESELARASAN DENGAN APLIKASI MOBILE

Fitur forum di website **harus selaras** dengan aplikasi mobile WellMom dalam hal:

### 2.1 Filter Kategori Forum

- **Sumber kategori:** API `GET /api/v1/forum/categories` (sama seperti aplikasi).
- **Struktur kategori:** Setiap item punya: `id`, `name`, `display_name`, `description`, `icon` (opsional), `is_active`, `created_at`, `updated_at`.
- **Perilaku filter:**
  - Opsi **"Semua"** (tanpa filter kategori) → menampilkan semua postingan.
  - Opsi per kategori → filter berdasarkan `category_id` (sama seperti aplikasi).
  - Filter dipakai saat memuat list post: parameter query `category_id` (opsional) pada `GET /api/v1/forum`.

### 2.2 Metode Posting (Buat Postingan)

- **Sama seperti aplikasi:**
  - **Endpoint:** `POST /api/v1/forum`
  - **Body (JSON):**
    - `title` (string, wajib)
    - `details` (string, wajib)
    - `category_id` (integer, wajib) — harus pilih kategori dari daftar kategori API.
  - Validasi: judul dan detail wajib diisi; kategori wajib dipilih sebelum submit.

### 2.3 Metode Balas (Reply)

- **Sama seperti aplikasi:**
  - **Endpoint:** `POST /api/v1/forum/{post_id}/replies`
  - **Body (JSON):** `reply_text` (string, wajib).

### 2.4 Data yang Ditampilkan (Sama seperti Aplikasi)

**Daftar postingan (list):**

- Per post: `id`, `author_user_id`, `author_name`, `author_role`, `author_photo_url` (opsional), `title`, `details`, `category_id`, `category_name`, `category_display_name`, `like_count`, `reply_count`, `is_liked`, `created_at`, `updated_at`.
- Tampilkan: nama penulis, waktu (relatif atau format konsisten), judul, preview isi (detail dipotong misalnya 2 baris), **tag kategori** (display_name), jumlah like, jumlah balasan, dan indikator like (is_liked).

**Detail postingan:**

- Data post: `id`, `author_user_id`, `author_name`, `author_role`, `title`, `details`, `like_count`, `reply_count`, `is_liked`, `created_at`, `updated_at`, serta **list replies**.
- Setiap reply: `id`, `post_id`, `author_user_id`, `author_name`, `author_role`, `reply_text`, `parent_reply_id` (opsional), `created_at`, `updated_at`.
- Tampilkan: info penulis post, waktu, judul, isi lengkap, tombol like, jumlah like & balasan, serta daftar balasan (nama penulis, waktu, isi balasan).

**Buat post:**

- Form: input judul, input detail (textarea), dan **dropdown/select kategori** yang diisi dari `GET /api/v1/forum/categories` (tampilkan `display_name`, value `id`).

---

## 3. REFERENSI API (SESUAI APLIKASI)

Base URL dan autentikasi mengikuti environment website (misalnya sama dengan backend WellMom). Header: `Authorization: Bearer <token_perawat>`.

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | `/api/v1/forum/categories` | Daftar kategori forum (untuk filter & form buat post). |
| GET | `/api/v1/forum` | Daftar post. Query: `search` (opsional), `category_id` (opsional), `skip`, `limit` (paginate). |
| GET | `/api/v1/forum/recent` | Postingan terbaru (opsional, jika dipakai di aplikasi). |
| GET | `/api/v1/forum/{post_id}` | Detail satu post beserta replies. |
| GET | `/api/v1/forum/{post_id}/replies` | Daftar balasan suatu post. |
| POST | `/api/v1/forum` | Buat post. Body: `title`, `details`, `category_id`. |
| POST | `/api/v1/forum/{post_id}/replies` | Kirim balasan. Body: `reply_text`. |
| POST | `/api/v1/forum/{post_id}/like` | Like/unlike post (response mengembalikan like_count, is_liked, dll.). |

---

## 4. UI/UX WEBSITE

- **Berbeda** dari aplikasi mobile: gunakan **standar UI/UX profesional** untuk website dan **ikuti style halaman lain** di website (warna, typography, spacing, komponen form, tombol, kartu, navbar, footer).
- **Posisi:** Akses Forum Diskusi (tombol/link/menu) berada **di atas** akses Chat di navigasi atau urutan konten.
- **Fitur yang perlu ada:**
  - **List forum:** Search (opsional), filter kategori (Semua + tiap kategori dari API), list post dengan data seperti di atas, pagination/infinite scroll.
  - **Detail post:** Judul, penulis, waktu, isi, like, daftar reply, form balas.
  - **Buat post:** Form judul, detail, pilih kategori (dropdown dari API), tombol submit.
- **Responsif:** Layar desktop dan mobile (jika website dipakai di mobile browser).

---

## 5. CHECKLIST IMPLEMENTASI (UNTUK AGENT AI / DEVELOPER)

- [ ] Posisi: Forum Diskusi di atas Chat (navigasi atau urutan konten).
- [ ] Filter kategori: sama dengan aplikasi — "Semua" + daftar dari `GET /forum/categories`, filter list post dengan `category_id`.
- [ ] Metode posting: `POST /forum` dengan `title`, `details`, `category_id`; form dengan dropdown kategori dari API.
- [ ] Metode balas: `POST /forum/{post_id}/replies` dengan `reply_text`.
- [ ] Data list post: author, waktu, judul, preview detail, kategori (display_name), like_count, reply_count, is_liked.
- [ ] Data detail post: full post + list replies (author, waktu, reply_text); like post; form reply.
- [ ] UI/UX: profesional, konsisten dengan style halaman lain di website; responsif.
- [ ] Autentikasi: token perawat (Bearer) untuk semua request forum.

---

## 6. CONTOH PROMPT SINGKAT UNTUK AI AGENT

> Implementasikan fitur **Forum Diskusi untuk Perawat** di **website** WellMom dengan ketentuan berikut:  
> (1) Tombol/akses **Forum Diskusi** berada **di atas** fitur **Chat**.  
> (2) **Filter kategori** forum sama dengan aplikasi: ambil dari `GET /api/v1/forum/categories`, opsi "Semua" dan filter per kategori (`category_id`).  
> (3) **Metode posting** sama: buat post dengan `title`, `details`, `category_id` (`POST /api/v1/forum`); **balas** dengan `reply_text` (`POST /api/v1/forum/{post_id}/replies`).  
> (4) **Data yang ditampilkan** (list post, detail post, replies, form buat post) sama seperti di aplikasi mobile.  
> (5) **UI/UX** website: standar profesional dan mengikuti style halaman lain; boleh berbeda tampilan dari aplikasi asal konsisten dengan website.  
> Spesifikasi lengkap ada di dokumen **WEBSITE_FORUM_DISKUSI_PERAWAT_PROMPT.md**.

---

Dokumen ini dapat diberikan kepada AI agent atau developer saat mengerjakan fitur Forum Diskusi Perawat di website WellMom.
