# Backup Script

This Bash script performs an incremental backup of your documents using `rsync`. It excludes certain folders and files (`.git`, `node_modules`, `target`, and LaTeX temporary files) and creates a timestamped log for each backup. You can also launch it via a desktop shortcut with a popup confirmation.

## 📥 Installation

Install the backup system using the provided Makefile:

```bash
make
```

This will:

-   Create the necessary directories:

    -   `~/.local/bin` → for the scripts
    -   `~/.local/share/icons` → for the desktop icon
    -   `~/.local/share/applications` → for the `.desktop` launcher

-   Copy the scripts:

    -   `popup_backup.sh` → `~/.local/bin/`
    -   `backup.sh` → `~/.local/bin/`

-   Make the scripts executable
-   Create a `.desktop` launcher with an absolute path to the script and icon
-   Copy the icon `backup.png` to `~/.local/share/icons/`

You can then launch the backup from your applications menu.

---

## 🧹 Uninstallation

To remove all installed files:

```bash
make clean
```

This will remove:

-   `~/.local/bin/popup_backup.sh`
-   `~/.local/bin/backup.sh`
-   `~/.local/share/icons/backup.png`
-   `~/.local/share/applications/backup.desktop`

---

## 📋 Requirements

-   Bash (preinstalled on most Unix-like systems)
-   `rsync`

---

## 📁 Example Output

When the backup runs:

1. A popup asks if you want to start the backup.
2. If confirmed, it synchronizes `~/Documents` to `~/backups` (incremental).
3. Excluded files and folders are skipped.
4. A log file `backup_YYYY-MM-DD_HH-MM-SS.log` is created in `~/backups`.
5. Another popup shows if the backup succeeded or failed.
