# Backup Script

This is a **local backup program** I personally use to keep a copy of my important files. I synchronize my cloud drive (e.g., Google Drive, KDrive) **with the backup folder**, rather than my working directory, to avoid the drive **accidentally modifying or deleting files** in my projects. Cloud drives often try to sync everything continuously, including temporary or compilation files, which can mess up your working files — this script ensures your original files remain safe while the backup folder stays up to date.

The script performs an **incremental backup** of your documents using `rsync`. It excludes certain folders and files (`.git`, `node_modules`, `target`, and LaTeX temporary files) and creates a **timestamped log** for each backup. You can also launch it via a **desktop shortcut with a popup confirmation**.

## 🚀 Usage

Once installed, you don’t need to run the script manually from the terminal. Simply **open your applications menu** and search for:

```text
Backup Documents
```

Clicking it will:

1. Show a popup asking if you want to start the backup.
2. If confirmed, it synchronizes your working directory (e.g., `~/Documents`) to `~/backups` incrementally.
3. Excluded files and folders (`.git`, `node_modules`, `target`, LaTeX temporary files) are skipped.
4. A log file `backup_YYYY-MM-DD_HH-MM-SS.log` is created in `~/backups`.
5. Another popup shows whether the backup succeeded or failed.

---

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

## ⏰ Automating Daily Backups

You can configure the script to run **automatically every day at 20:00** using `cron`. Add this line to your crontab:

```bash
0 20 * * * DISPLAY=:0 ~/.local/bin/popup_backup.sh
```

This will:

-   Show the popup at 20:00 each day
-   Run the backup only if you confirm
-   Ensure that your backup folder is always up to date
-   Prevent accidental file modifications in your working directories due to cloud drive sync

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
-   `zenity` (for popup dialogs)

---
