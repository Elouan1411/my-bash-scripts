# Automated LaTeX Compilation Project

This project automates the compilation of LaTeX documents using a shell script. It supports bibliography handling, double compilation, and cleanup of temporary files.

## Dependencies

Before using this project, make sure the following tools are installed on your system:

* `pdflatex` (part of TeX Live or MikTeX)
* `bibtex` (for bibliography management)
* `make` (for script installation and uninstallation)

## Installation

To install the script and make it executable from anywhere, follow these steps:

1. Clone this repository to your workspace.
2. Open a terminal and navigate to the project directory.
3. Run the following command:

```bash
make install
```

This will copy the `texcompiler.sh` script to `/usr/local/bin/texcompiler`, make it executable, and make it available as a global command.

## Integration with LaTeX Workshop in VS Code

To use `texcompiler` directly from **LaTeX Workshop** in **VS Code**, you need to update your `settings.json` configuration.

### LaTeX Workshop Configuration

1. **Open VS Code**.
2. **Press** `F1` and search for **"Open User Settings (JSON)"**.
3. **Add the following lines to your `settings.json` file**:

```json
"latex-workshop.latex.recipes": [
    {
        "name": "Compile with texcompiler",
        "tools": ["texcompiler"]
    }
],

"latex-workshop.latex.tools": [
    {
        "name": "texcompiler",
        "command": "/usr/local/bin/texcompiler",
        "args": [
            "%DOCFILE%.tex"
        ]
    }
],
```

4. **Save and restart VS Code**.

With this setup, you can run `texcompiler` directly from VS Code and automatically recompile your LaTeX documents on save (Ctrl + S) using LaTeX Workshop.

## Available Options

The script accepts the following options:

* `--double`: Performs a double compilation (useful when there's no bibliography).
* `--clean`: Removes temporary files, then compiles.
* `--clear`: Removes temporary files without compiling.
* `--bib`: Handles bibliography (bibtex + recompilations).
* `--help`: Displays usage instructions and available options.

### Example Usage

To compile a LaTeX file with a bibliography:

```bash
texcompiler my_document.tex --bib
```

To perform a double compilation without bibliography:

```bash
texcompiler my_document.tex --double
```

To clean temporary files without compiling:

```bash
texcompiler my_document.tex --clear
```

## Uninstallation

To remove the script and make it unavailable system-wide, simply run:

```bash
make uninstall
```

This will delete the script from `/usr/local/bin`.

