# 🌍 Aplikasi Login dengan Deteksi Lokasi

Tugas 2 - Pemrograman Mobile  
Dibuat oleh: **Nabillah Rhamadhan** Dengan NIM (202310370311452)

---

## 📱 Deskripsi Aplikasi
Aplikasi ini merupakan **simulasi login sederhana** yang dibuat menggunakan **Flutter**.  
Setelah pengguna login dengan username dan password tertentu, aplikasi akan menampilkan lokasi pengguna secara **real-time** menggunakan **plugin Geolocator**.

Semua tampilan dan desain antarmuka dibuat **secara manual tanpa bantuan AI** (menggunakan widget dasar Flutter seperti `Column`, `Container`, `TextField`, dan `ElevatedButton`).

---

## ⚙️ Fitur Utama
- ✅ Form Login (username dan password)
- ✅ Validasi input login
- ✅ Integrasi **Geolocator** untuk mendapatkan posisi GPS pengguna
- ✅ Menampilkan koordinat (latitude dan longitude)
- ✅ Desain manual (tanpa library UI tambahan atau generator AI)

---

## 📍 Plugin yang Digunakan
```yaml
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^12.0.0
