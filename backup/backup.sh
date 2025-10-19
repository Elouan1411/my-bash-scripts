#!/bin/bash

# --- Configuration ---
SOURCE_DIR="$HOME/Documents"        # Dossier à sauvegarder
BACKUP_DIR="$HOME/backups"          # Dossier parent où stocker les backups


# Vérifie que le dossier source existe
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Le dossier source n'existe pas : $SOURCE_DIR" >&2
    exit 1
fi

# Génère le nom du backup avec date et heure
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$BACKUP_DIR/backup_$DATE.log"

# Supprime l'ancien .log
rm -f "$BACKUP_DIR"/*.log


# Crée le dossier de backup
mkdir -p "$BACKUP_DIR"

# Synchronisation incrémentale avec rsync en excluant certains dossiers/fichiers
rsync -av --delete \
    --exclude='.git/' \
    --exclude='node_modules/' \
    --exclude='target/' \
    --exclude='*.aux' \
    --exclude='*.log' \
    --exclude='*.toc' \
    "$SOURCE_DIR" "$BACKUP_DIR" &> "$LOG_FILE"

# Vérifie si rsync a réussi
if [[ $? -eq 0 ]]; then
    echo "Backup réussi dans $BACKUP_DIR"
    exit 0
else
    echo "Erreur lors du backup !" >&2
    exit 1
fi
