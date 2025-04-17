# html2php

This Bash script converts an HTML file into a series of PHP `echo` statements, line by line. It escapes special characters and maintains indentation — perfect for embedding HTML in PHP code.

## 🚀 Usage

```bash
html2php [input_file] [output_file]
```

### 🔹 Examples

```bash
html2php                   # Uses input.html → output.php
html2php mypage.html       # Uses mypage.html → output.php
html2php in.html out.php   # Uses in.html → out.php
```

### 🆘 Help

```bash
html2php --help
```

Displays usage instructions.

---

## 📥 Installation

Install the script to your local bin directory:

```bash
make install
```

This will:

- Copy the script to `~/.local/bin/html2php`
- Make it executable
- Add the directory to your `PATH` (if not already there)

You can then use `html2php` from anywhere in your terminal.

## 🧹 Uninstallation

To remove the script:

```bash
make uninstall
```

## 📋 Requirements

- Bash (preinstalled on most Unix-like systems)
- Standard utilities: `sed`, `grep`

## 📁 Example Output

Given `input.html`:

```html
<div>
  <p>Hello World!</p>
</div>
```

Generated `output.php`:

```php
echo '<div>',
     '    <p>Hello World!</p>',
     '</div>';
```
