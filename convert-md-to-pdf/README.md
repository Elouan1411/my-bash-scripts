# Markdown to PDF Converter

This Bash script converts a Markdown (.md) file into a PDF using `pandoc` and `weasyprint`. It allows you to customize the output with LaTeX options or use a GitHub-style HTML conversion (without LaTeX).

## 🚀 Usage

### Basic Conversion (with LaTeX)

```bash
$(basename "$0") <file.md>
````

This will convert the Markdown file to a PDF using the `pandoc` engine with LaTeX, outputting the PDF next to the original `.md` file.

### GitHub-style Conversion (no LaTeX)

```bash
$(basename "$0") --github <file.md>
```

This will convert the Markdown file to a PDF using a GitHub-like HTML style (via `weasyprint`), without using LaTeX.

## Options

* `--github`: Use GitHub-style (like README rendering) without LaTeX.
* `-h`, `--help`: Show the help message.

### 📚 Useful LaTeX Options (add them when prompted)

Here are some useful LaTeX options that you can include when prompted:

* **Metadata:**

  * `-V title:"My Document"`: Set document title.
  * `-V author:"Your Name"`: Set author name.
  * `-V date:"May 2025"`: Set custom date.

* **Layout:**

  * `--toc`: Include a table of contents.
  * `--number-sections`: Number section headings.
  * `-V geometry:margin=2.5cm`: Set page margins.
  * `-V fontsize=11pt`: Set font size (default: 10pt).
  * `-V mainfont:"DejaVu Serif"`: Set custom font.
  * `-V linestretch=1.3`: Adjust line spacing.

## 🔧 Dependencies

### LaTeX Dependencies

- `xelatex` (part of the `texlive-xetex` package)
- `texlive-fonts-recommended`, `texlive-latex-extra` (for extra fonts and customization)

### Python Dependencies

- `weasyprint`
- `libpango1.0-0`, `libcairo2`, `libgdk-pixbuf2.0-0` (required for rendering)

## Installation

You can install this script into a directory that is part of your `PATH`, such as `~/.local/bin`, so that you can run it from anywhere.

Run the following commands:

```bash
make install
```

Before running the script, ensure that you have the necessary dependencies installed on your system:

- **LaTeX** (for the PDF conversion with pandoc and xelatex)
- **Python libraries**: `weasyprint`, `pandoc` (for handling Markdown and HTML to PDF conversion)


## Example

### With LaTeX options:

```bash
$(basename "$0") monfichier.md
```

This will prompt you to add LaTeX options (or leave empty). For example:

```bash
--toc --number-sections -V title:"Résumé" -V author:"Alice"
```

### With GitHub style (no LaTeX):

```bash
$(basename "$0") --github readme.md
```

This will use a GitHub-style HTML conversion (no LaTeX) to generate the PDF.


