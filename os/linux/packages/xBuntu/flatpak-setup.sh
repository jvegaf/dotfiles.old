#!/bin/bash
set -euo pipefail

echo "🔧 Instalador de Snap, Flatpak, Flathub y AppImageLauncher (Ubuntu 24.04+)"

# Verificar permisos
if [ "$(id -u)" -ne 0 ]; then
    echo "❌ Este script debe ejecutarse como root. Usa: sudo ./instalar-formatos-apps.sh"
    exit 1
fi

# Actualizar sistema
echo "📦 Actualizando lista de paquetes..."
apt update -y

# -------- Instalar Snapd --------
if ! command -v snap >/dev/null 2>&1; then
    echo "🛠️ Instalando Snapd..."
    apt install -y snapd
    systemctl enable --now snapd.apparmor
else
    echo "✅ Snap ya está instalado"
fi

# -------- Instalar Flatpak y Flathub --------
echo "🛠️ Instalando Flatpak y plugin de GNOME Software..."
apt install -y flatpak gnome-software-plugin-flatpak

echo "🌐 Añadiendo repositorio Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# -------- Instalar AppImageLauncher manualmente --------
echo "📁 Descargando e instalando AppImageLauncher..."

# Detectar arquitectura
ARCH=$(dpkg --print-architecture)

# Descargar versión estable directamente desde GitHub (puedes actualizar el número de versión si cambia)
APPIMAGELAUNCHER_VERSION="2.2.0"
# DEB_URL="https://github.com/TheAssassin/AppImageLauncher/releases/download/v${APPIMAGELAUNCHER_VERSION}/appimagelauncher_${APPIMAGELAUNCHER_VERSION}-${ARCH}.deb"
DEB_URL="https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb"



# Crear carpeta temporal
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Descargar .deb
wget -q --show-progress "$DEB_URL" -O appimagelauncher.deb

# Instalar
dpkg -i appimagelauncher.deb || apt install -fy

# Limpiar
cd ~
rm -rf "$TMP_DIR"

echo ""
echo "✅ Instalación completada. Puedes usar Snap, Flatpak y AppImage con integración total."
