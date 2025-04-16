INSTALL_DIR := $(HOME)/.local/bin
SCRIPT := dock.sh
BIN_NAME := $(basename $(SCRIPT))
BIN_PATH := $(INSTALL_DIR)/$(BIN_NAME)
BASHRC := $(HOME)/.bashrc

install: install-script update-path

install-script:
	@echo "Installing script to $(INSTALL_DIR)..."
	@mkdir -p $(INSTALL_DIR)
	@cp $(SCRIPT) $(BIN_PATH)
	@chmod +x $(BIN_PATH)
	@echo "The script has been installed as $(BIN_NAME)."

update-path:
	@echo "Checking if $(INSTALL_DIR) is in PATH..."
	@if ! echo "$$PATH" | grep -q "$(INSTALL_DIR)"; then \
	    echo "Adding $(INSTALL_DIR) to PATH in $(BASHRC)..."; \
	    echo "\n# Add ~/.local/bin to PATH" >> $(BASHRC); \
	    echo "export PATH=\"\$$PATH:$(INSTALL_DIR)\"" >> $(BASHRC); \
	    echo "To apply the change, run: . $(BASHRC)"; \
	else \
	    echo "$(INSTALL_DIR) is already in PATH."; \
	fi

uninstall:
	@echo "Removing script $(BIN_NAME) from $(INSTALL_DIR)..."
	@rm -f $(BIN_PATH)
	@echo "Script removed."

.PHONY: install install-script update-path uninstall
