# convert-mkv-to-mp3.sh

This script converts `.mkv` video files into `.mp3` audio files in the specified directory. It uses `ffmpeg` for the conversion process.

## Usage

### Basic Usage

To convert all `.mkv` files in a directory to `.mp3` files, run the following command:

```bash
./convert-mkv-to-mp3.sh /path/to/your/directory
```

Replace `/path/to/your/directory` with the actual path to the directory containing the `.mkv` files.

### Example

```bash
./convert-mkv-to-mp3.sh ~/Videos
```

This will convert all `.mkv` files in the `~/Videos` directory to `.mp3` files.

### Usage After Installation

Once the script is installed, you can run it from anywhere using the following command:

```bash
convert-mkv-to-mp3 /path/to/your/directory
```

This will convert all `.mkv` files in the specified directory to `.mp3` files.

## Installation

You can install this script into a directory that is part of your `PATH`, such as `~/.local/bin`, so that you can run it from anywhere.

Run the following commands:

```bash
make install
```

This will install the script and ensure that the directory `~/.local/bin` is added to your `PATH`.

### Uninstallation

To uninstall the script, you can remove it from `~/.local/bin` using the following command:

```bash
make uninstall
```
