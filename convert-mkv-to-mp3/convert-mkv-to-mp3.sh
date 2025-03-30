#!/bin/bash
# Script pour convertir des fichiers .mkv en .mp3 dans un dossier donné

# Vérifie si un dossier est passé en paramètre
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <dossier>"
    exit 1
fi

# Vérifie si le paramètre est un dossier
dossier="$1"
if [ ! -d "$dossier" ]; then
    echo "Erreur: '$dossier' n'est pas un dossier valide."
    exit 1
fi

# Conversion des fichiers .mkv en .mp3
cd "$dossier" || exit 1
for fichier in *.mkv; do
    if [ -f "$fichier" ]; then
        ffmpeg -i "$fichier" -vn -acodec libmp3lame -ab 320k -ar 44100 "${fichier%.mkv}.mp3"
    fi
done


