#!/bin/bash

# Popup avec "Oui" / "Non"
zenity --question --title="Sauvegarde" --text="Lancer le backup automatique ?"

BACKUP_DIR="$HOME/backups"

if [[ $? -eq 0 ]]; then
    # Lancer le script de backup
    ~/.local/bin/backup.sh

    # Vérifier le code de retour
    if [[ $? -eq 0 ]]; then
        # Récupère le dernier fichier log
        last_log=$(ls -t "$BACKUP_DIR"/backup_*.log | head -n1)
        # Compte le nombre de lignes en ignorant les 4 premières
        nb=$(tail -n +5 "$last_log" | wc -l)
        # Affiche le popup avec le nombre de fichiers
        zenity --info --title="Backup" --text="Backup réussi !\n$nb fichiers copiés ou mis à jour."
    else
        zenity --error --title="Backup" --text="Erreur lors du backup !"
    fi
fi
