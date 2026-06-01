# Instalasi NixOS Menggunakan Flake

Panduan ini mengasumsikan:

- `/dev/nvme0n1p1` digunakan sebagai partisi root (`/`)
- `/dev/nvme0n1p2` digunakan sebagai partisi EFI (`/boot`)
- Konfigurasi NixOS berada di `/mnt/home/halozra/nixos-config`
- Host yang akan diinstal adalah `hyprland`

## 1. Verifikasi Partisi

Pastikan partisi yang akan digunakan sudah benar:

```bash
lsblk -f
```

Contoh:

```text
nvme0n1
├─nvme0n1p1 ext4  /
└─nvme0n1p2 vfat  /boot
```

## 2. Mount Partisi

Mount partisi root:

```bash
sudo mount /dev/nvme0n1p1 /mnt
```

Buat direktori untuk EFI:

```bash
sudo mkdir -p /mnt/boot
```

Mount partisi EFI:

```bash
sudo mount /dev/nvme0n1p2 /mnt/boot
```

Verifikasi hasil mount:

```bash
findmnt /mnt
```

## 3. Clone atau Salin Konfigurasi

Jika repository belum tersedia di sistem live:

```bash
git clone <repository-url> /mnt/home/halozra/nixos-config
```

Pastikan struktur direktori terlihat seperti berikut:

```text
/mnt/home/halozra/nixos-config
├── flake.nix
├── flake.lock
└── hosts
```

## 4. Install NixOS

Jalankan instalasi menggunakan flake:

```bash
sudo nixos-install \
  --flake /mnt/home/halozra/nixos-config#hyprland \
  --no-root-password
```

Tunggu hingga proses instalasi selesai.

## 5. Reboot

Setelah instalasi berhasil:

```bash
sudo reboot
```

Lepaskan media instalasi (USB/DVD) saat sistem mulai melakukan boot ulang.

## Troubleshooting

### Melihat seluruh disk dan partisi

```bash
lsblk
```

### Memastikan partisi yang benar

```bash
sudo fdisk -l
```

### Menguji konfigurasi sebelum instalasi

```bash
sudo nixos-rebuild dry-build \
  --flake /mnt/home/halozra/nixos-config#hyprland
```