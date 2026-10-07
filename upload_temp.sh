#!/bin/bash

# Minta input nama/path file dari pengguna
read -p "Masukkan nama file atau drag-and-drop file ke sini: " FILEPATH

# Hapus tanda petik jika pengguna mengunggah dengan cara drag-and-drop
FILEPATH=$(echo "$FILEPATH" | sed -e "s/^'//" -e "s/'$//" -e 's/^"//' -e 's/"$//')

# Cek apakah file ada
if [ ! -f "$FILEPATH" ]; then
    echo "Error: File '$FILEPATH' tidak ditemukan!"
    echo ""
    read -p "Tekan [Enter] untuk keluar..."
    exit 1
fi

echo "Mengunggah $FILEPATH ke temp.sh..."

# Jalankan perintah upload
RESPONSE=$(curl -s -F "file=@$FILEPATH" https://temp.sh/upload)

echo ""
echo "Upload Berhasil!"
echo "Link Download: $RESPONSE"
echo ""

# Tahan terminal agar tidak langsung tertutup
read -p "Tekan [Enter] untuk keluar..."