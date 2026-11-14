❄️ NixOS Configuration with Flakes & Home Manager

Repositori ini berisi konfigurasi lengkap NixOS yang saya gunakan sehari-hari. Seluruh sistem dikelola menggunakan Nix Flakes dan Home Manager untuk memastikan konfigurasi yang modular, reproducible, dan mudah dipelihara.

✨ Fitur

NixOS berbasis Flakes

Integrasi Home Manager langsung di level host

Pilihan Desktop Environment & Window Manager (GNOME, KDE Plasma, & Hyprland)

Tema Tokyo Night Storm

Terminal Kitty & Shell Fish

Konfigurasi modular dan terstruktur rapi berbasis direktori (hosts, modules, apps)

📋 Persyaratan

Sebelum menggunakan konfigurasi ini, pastikan:

Sudah menginstal NixOS

Flakes telah diaktifkan

Git telah terpasang

Memahami dasar penggunaan NixOS dan Home Manager

⚠️ Perhatian Sebelum Menggunakan

Konfigurasi ini dibuat khusus untuk perangkat dan akun pengguna saya. Beberapa bagian wajib disesuaikan sebelum digunakan pada komputer lain.

1. Hardware Configuration

File berikut:

hosts/halozra/hardware-configuration.nix


berisi konfigurasi yang dihasilkan otomatis oleh NixOS berdasarkan perangkat keras saya, termasuk:

UUID partisi

Mount point

Driver perangkat

Konfigurasi boot

Microcode CPU

Jangan gunakan file tersebut secara langsung pada perangkat lain.

2. Username dan Home Directory

Seluruh konfigurasi Home Manager menggunakan username:

halozra


dan home directory:

/home/halozra


Anda harus menggantinya dengan username dan direktori home milik Anda sendiri.

🚀 Instalasi & Penggunaan

1. Clone Repository

git clone https://github.com/halozra/Nixos-Setup.git ~/Nixos-Setup

cd ~/Nixos-Setup


2. Generate Hardware Configuration Baru

Hapus file konfigurasi hardware bawaan lalu buat konfigurasi sesuai perangkat Anda:

nixos-generate-config --show-hardware-config > hosts/halozra/hardware-configuration.nix


3. Sesuaikan Username

Cari seluruh kata:

halozra


dan ganti dengan username Linux Anda.

Pastikan seluruh path home directory juga telah diperbarui, misalnya:

/home/halozra


menjadi:

/home/username


4. Tambahkan Perubahan ke Git

Nix Flakes hanya dapat membaca file yang sudah terdaftar dalam Git. Setelah melakukan perubahan, jalankan:

git add .


Untuk memastikan seluruh file telah ter-track.

5. Rebuild Sistem

Terapkan konfigurasi menggunakan profil host halozra:

sudo nixos-rebuild switch --flake .#halozra


Tunggu hingga proses build selesai.

🔄 Update Konfigurasi

Jika repository sudah diperbarui dan ingin menerapkan perubahan terbaru:

git pull

sudo nixos-rebuild switch --flake .#halozra


📁 Struktur Repository

.
├── apps/
│   ├── apps.nix
│   └── systemApps.nix
├── flake.lock
├── flake.nix
├── hosts/
│   └── halozra/
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── home.nix
├── modules/
│   ├── desktop/
│   │   ├── gnome.nix
│   │   └── kde.nix
│   ├── home-manager/
│   │   ├── config/
│   │   └── modules/
│   └── system/
│       ├── audio.nix
│       ├── common.nix
│       ├── gaming.nix
│       ├── graphics.nix
│       ├── kernel.nix
│       ├── network.nix
│       ├── nix-settings.nix
│       ├── services.nix
│       └── virtualization.nix
├── LICENSE.mit
└── README.md


📜 Lisensi

Repositori ini tersedia di bawah lisensi MIT untuk dipelajari, dimodifikasi, dan dijadikan referensi sesuai kebutuhan masing-masing.
