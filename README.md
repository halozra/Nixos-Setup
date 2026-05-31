# ❄️ NixOS Configuration with Flakes & Home Manager

Repositori ini berisi konfigurasi lengkap NixOS yang saya gunakan sehari-hari. Seluruh sistem dikelola menggunakan **Nix Flakes** dan **Home Manager** untuk memastikan konfigurasi yang modular, reproducible, dan mudah dipelihara.

## ✨ Fitur

* NixOS berbasis **Flakes**
* Integrasi **Home Manager**
* Desktop Environment **GNOME**
* Tema **Tokyo Night Storm**
* Terminal **Kitty**
* Shell **Fish**
* Konfigurasi modular dan mudah dikembangkan
* Dukungan rebuild sistem menggunakan profil terpisah

---

## 📋 Persyaratan

Sebelum menggunakan konfigurasi ini, pastikan:

* Sudah menginstal NixOS
* Flakes telah diaktifkan
* Git telah terpasang
* Memahami dasar penggunaan NixOS dan Home Manager

---

## ⚠️ Perhatian Sebelum Menggunakan

Konfigurasi ini dibuat khusus untuk perangkat dan akun pengguna saya. Beberapa bagian wajib disesuaikan sebelum digunakan pada komputer lain.

### 1. Hardware Configuration

File berikut:

```text
system/hardware-configuration.nix
```

berisi konfigurasi yang dihasilkan otomatis oleh NixOS berdasarkan perangkat keras saya, termasuk:

* UUID partisi
* Mount point
* Driver perangkat
* Konfigurasi boot
* Microcode CPU

Jangan gunakan file tersebut secara langsung pada perangkat lain.

### 2. Username dan Home Directory

Seluruh konfigurasi Home Manager menggunakan username:

```text
halozra
```

dan home directory:

```text
/home/halozra
```

Anda harus menggantinya dengan username dan direktori home milik Anda sendiri.

---

# 🚀 Instalasi

## 1. Clone Repository

```bash
git clone https://github.com/halozra/Nixos-Setup.git ~/Nixos-Setup

cd ~/Nixos-Setup
```

---

## 2. Generate Hardware Configuration Baru

Hapus file konfigurasi hardware bawaan lalu buat konfigurasi sesuai perangkat Anda:

```bash
nixos-generate-config --show-hardware-config > system/hardware-configuration.nix
```

---

## 3. Sesuaikan Username

Cari seluruh kata:

```text
halozra
```

dan ganti dengan username Linux Anda.

Pastikan seluruh path home directory juga telah diperbarui, misalnya:

```text
/home/halozra
```

menjadi:

```text
/home/username
```

---

## 4. Tambahkan Perubahan ke Git

Nix Flakes hanya dapat membaca file yang sudah terdaftar dalam Git. Setelah melakukan perubahan, jalankan:

```bash
git add .
```

Untuk memastikan seluruh file telah ter-track.

---

## 5. Rebuild Sistem

Terapkan konfigurasi menggunakan profil GNOME:

```bash
sudo nixos-rebuild switch --flake .#gnome
```

Tunggu hingga proses build selesai.

---

# 🔄 Update Konfigurasi

Jika repository sudah diperbarui dan ingin menerapkan perubahan terbaru:

```bash
git pull

sudo nixos-rebuild switch --flake .#gnome
```

---

# 📁 Struktur Repository

```text
.
├── flake.nix
├── flake.lock
├── system/
│   ├── hardware-configuration.nix
│   ├── packages.nix
│   ├── services.nix
│   └── ...
├── home-manager/
│   ├── hosts/
│   ├── programs/
│   └── ...
└── README.md
```

---

# 📜 Lisensi

Repositori ini tersedia untuk dipelajari, dimodifikasi, dan dijadikan referensi sesuai kebutuhan masing-masing.
