#!/bin/bash

# Popup avec "Oui" / "Non"
zenity --question --title="Sauvegarde" --text="Lancer le backup automatique ?"

if [[ $? -eq 0 ]]; then
    # Lancer le script de backup
    ~/.local/bin/backup.sh
    # Vérifier le code de retour
    if [[ $? -eq 0 ]]; then
        zenity --info --title="Backup" --text="Backup réussi !"
    else
        zenity --error --title="Backup" --text="Erreur lors du backup !"
    fi
fi

