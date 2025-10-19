# Makefile pour installer le backup avec popup et icônes

# Dossiers
BIN_DIR := $(HOME)/.local/bin
ICONS_DIR := $(HOME)/.local/share/icons
APPLICATIONS_DIR := $(HOME)/.local/share/applications

# Fichiers source (dans le même dossier que le Makefile)
CURDIR := $(CURDIR)
POPUP_SCRIPT := $(CURDIR)/popup_backup.sh
BACKUP_SCRIPT := $(CURDIR)/backup.sh
ICON_FILE := $(CURDIR)/backup.png

# Fichiers cibles
BIN_POPUP := $(BIN_DIR)/popup_backup.sh
BIN_BACKUP := $(BIN_DIR)/backup.sh
ICON_DEST := $(ICONS_DIR)/backup.png
DESKTOP_DEST := $(APPLICATIONS_DIR)/backup.desktop

.PHONY: all clean crontab

all: dirs install_files desktop crontab

install: dirs install_files desktop crontab

# Crée les dossiers nécessaires
dirs:
	@echo "Création des dossiers..."
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(ICONS_DIR)
	@mkdir -p $(APPLICATIONS_DIR)
	@echo "Dossiers créés."

# Copie des fichiers et permissions
install_files:
	@echo "Installation des fichiers..."
	@cp $(POPUP_SCRIPT) $(BIN_POPUP)
	@chmod +x $(BIN_POPUP)
	@cp $(BACKUP_SCRIPT) $(BIN_BACKUP)
	@chmod +x $(BIN_BACKUP)
	@cp $(ICON_FILE) $(ICON_DEST)
	@echo "Fichiers installés."

# Écrit le fichier .desktop avec chemins absolus
desktop:
	@echo "Création du fichier backup.desktop..."
	@echo "[Desktop Entry]" > $(DESKTOP_DEST)
	@echo "Type=Application" >> $(DESKTOP_DEST)
	@echo "Name=Backup Documents" >> $(DESKTOP_DEST)
	@echo "Comment=Lancer le script de backup avec popup et log" >> $(DESKTOP_DEST)
	@echo "Exec=$(BIN_POPUP)" >> $(DESKTOP_DEST)
	@echo "Icon=$(ICON_DEST)" >> $(DESKTOP_DEST)
	@echo "Terminal=false" >> $(DESKTOP_DEST)
	@echo "Categories=Utility;" >> $(DESKTOP_DEST)
	@echo "StartupNotify=true" >> $(DESKTOP_DEST)
	@chmod +x $(DESKTOP_DEST)
	@echo "Fichier backup.desktop créé avec succès !"

# Affiche la ligne à ajouter dans crontab
crontab:
	@echo ""
	@echo "Pour lancer le popup tous les jours à 20h, ajoutez cette ligne avec 'crontab -e' :"
	@echo "0 20 * * * DISPLAY=:0 $(BIN_POPUP)"
	@echo ""

uninstall:
	@echo "Suppression des fichiers installés..."
	@rm -f $(BIN_POPUP) $(BIN_BACKUP) $(ICON_DEST) $(DESKTOP_DEST)
	@echo "Fichiers supprimés."

clean:
	uninstall