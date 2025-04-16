# 🐚 My Bash Scripts Collection

This repository contains various Bash scripts I've created for different purposes. Each script has its own dedicated folder with a detailed README explaining its usage, installation, and functionality.

## Available Scripts

### 1. [LaTeX Compilation Automation](./texcompiler)

This project automates the compilation of LaTeX documents, including bibliography management, double compilation, and cleanup of temporary files. Compatible with VS Code's LaTeX Workshop extension.

[More details here](./texcompiler/README.md)

### 2. [convert-mkv-to-mp3](./convert-mkv-to-mp3)

This script converts `.mkv` video files into `.mp3` audio files in the specified directory. It uses `ffmpeg` for the conversion process.

[More details here](./convert-mkv-to-mp3/README.md)

### 3. [dock](./dock)

A small script to change quickly the position of the GNOME Shell dock using `gsettings`.

[More details here](./dock/README.md)

## Usage

Each script comes with its own `Makefile` for installation and uninstallation. To install a script globally, navigate to the desired script folder and run:

```bash
make install
```

To uninstall a script, run:

```bash
make uninstall
```
