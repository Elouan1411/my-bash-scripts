INSTALL_DIR := $(HOME)/.local/bin
SCRIPT := convert-md-to-pdf.sh
BIN_NAME := $(basename $(SCRIPT)) 
BIN_PATH := $(INSTALL_DIR)/$(BIN_NAME)
BASHRC := $(HOME)/.bashrc

install: install-script update-path

install-script:
	@echo "Installation du script dans $(INSTALL_DIR)..."
	@mkdir -p $(INSTALL_DIR)
	@cp $(SCRIPT) $(BIN_PATH)
	@chmod +x $(BIN_PATH)
	@echo "Le script est installé en tant que $(BIN_NAME)."

update-path:
	@echo "Vérification de la présence de $(INSTALL_DIR) dans le PATH..."
	@if ! echo "$$PATH" | grep -q "$(INSTALL_DIR)"; then \
	    echo "Ajout de $(INSTALL_DIR) au PATH dans $(BASHRC)..."; \
	    echo "\n# Ajouter ~/.local/bin au PATH" >> $(BASHRC); \
	    echo "export PATH=\"\$$PATH:$(INSTALL_DIR)\"" >> $(BASHRC); \
	    echo "Pour prendre en compte le changement, exécutez : . $(BASHRC)"; \
	else \
	    echo "$(INSTALL_DIR) est déjà dans le PATH."; \
	fi

uninstall:
	@echo "Suppression du script $(BIN_NAME) de $(INSTALL_DIR)..."
	@rm -f $(BIN_PATH)
	@echo "Script supprimé."

.PHONY: install install-script update-path uninstall
