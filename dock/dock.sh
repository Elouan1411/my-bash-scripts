#!/bin/bash

# Fonction pour afficher l'aide
print_help() {
    echo "Usage: $0 [-l|--left] [-b|--bottom]"
    echo "  -l, --left     Déplace le dock à gauche"
    echo "  -b, --bottom   Déplace le dock en bas"
    exit 1
}

# Vérification des arguments
if [ $# -ne 1 ]; then
    print_help
fi

# Traitement des arguments
case "$1" in
    -l|--left)
        gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
        ;;
    -b|--bottom)
        gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
        ;;
    *)
        print_help
        ;;
esac

echo "Position du dock GNOME Shell modifiée."
