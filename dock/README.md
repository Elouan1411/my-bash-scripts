# dock

This script allows you to change the position of the GNOME Shell dock (via the Dash to Dock extension) using simple command-line options. It uses `gsettings` to update the dock position.

## Usage

### Basic Usage

To change the dock position, use one of the following options:

```bash
./dock -l        # Moves the dock to the left
./dock --left    # Same as above

./dock -b        # Moves the dock to the bottom
./dock --bottom  # Same as above
```

### Example

```bash
./dock --left
```

This will move the GNOME Shell dock to the left side of the screen.

```bash
./dock -b
```

This will move the dock to the bottom of the screen.

### Usage After Installation

Once the script is installed, you can run it from anywhere:

```bash
dock --bottom
```

## Installation

You can install this script into a directory that's in your `PATH`, like `~/.local/bin`, to make it accessible globally.

To install:

```bash
make install
```

This will copy the script to `~/.local/bin` and ensure the path is configured properly.

### Uninstallation

To uninstall the script from your system:

```bash
make uninstall
```

## Requirements

- GNOME Shell with the **Dash to Dock** extension.
- `gsettings` (comes by default with GNOME).
