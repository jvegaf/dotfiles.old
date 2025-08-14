#!/usr/bin/env bash

set -euo pipefail

OUTFILE="flatpak_apps.txt"
echo "# Flatpak installation dump"
rm -rf $OUTFILE
flatpak list --app --columns=application > $OUTFILE

echo
echo "Archivo generado: $OUTFILE"
