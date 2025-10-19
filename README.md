# 🐚 My Bash Scripts Collection

This repository contains various Bash scripts I've created for different purposes. Each script has its own dedicated folder with a detailed README explaining its usage, installation, and functionality.

### 1. [LaTeX Compilation Automation](./texcompiler)

This project automates the compilation of LaTeX documents, including bibliography management, double compilation, and cleanup of temporary files. Compatible with VS Code's LaTeX Workshop extension.

[More details here](./texcompiler/README.md)

### 2. [convert-mkv-to-mp3](./convert-mkv-to-mp3)

This script converts `.mkv` video files into `.mp3` audio files in the specified directory. It uses `ffmpeg` for the conversion process.

[More details here](./convert-mkv-to-mp3/README.md)

### 3. [convert-md-to-pdf](./convert-md-to-pdf)

This script converts a Markdown file (`.md`) into a PDF. You can optionally use a GitHub-style CSS for the HTML conversion, or use LaTeX for PDF compilation. The script utilizes `pandoc` and `weasyprint`.

[More details here](./convert-md-to-pdf/README.md)

### 4. [html2php](./html2php)

This Bash script converts an HTML file into a series of PHP `echo` statements, line by line. It escapes special characters and maintains indentation — perfect for embedding HTML in PHP code.

[More details here](./html2php/README.md)

### 5. [Backup Script](./backup)

This Bash script performs an incremental backup of your documents using `rsync`. It excludes certain folders and files (`.git`, `node_modules`, `target`, and LaTeX temporary files) and creates a timestamped log for each backup. You can launch it via a desktop shortcut with a popup confirmation. [More details here](./backup/README.md)

## Usage

Each script comes with its own `Makefile` for installation and uninstallation. To install a script globally, navigate to the desired script folder and run:

```bash
make install
```

To uninstall a script, run:

```bash
make uninstall
```
