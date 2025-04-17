#!/bin/bash

html_to_php_echo() {
    # Show help if requested
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "📄 Usage: $0 [input_file] [output_file]"
        echo ""
        echo "🛠  Converts an HTML file into a PHP echo statement."
        echo ""
        echo "📥 Arguments:"
        echo "   input_file        (optional) HTML input file (default: input.html)"
        echo "   output_file       (optional) PHP output file (default: output.php)"
        echo ""
        echo "💡 Examples:"
        echo "   $0                     # uses input.html → output.php"
        echo "   $0 index.html          # uses index.html → output.php"
        echo "   $0 in.html out.php     # uses in.html → out.php"
        exit 0
    fi

    # Handle arguments
    input_file="${1:-input.html}"
    output_file="${2:-output.php}"

    # Check if input file exists
    if [ ! -f "$input_file" ]; then
        echo "❌ Error: File '$input_file' does not exist."
        exit 1
    fi

    escape_php_string() {
        echo "$1" | sed -e "s/\\\\/\\\\\\\\/g" -e "s/'/\\\\'/g"
    }

    echo -n "echo " > "$output_file"
    total_lines=$(grep -c . "$input_file")  # count non-empty lines
    current_line=0

    while IFS= read -r line || [ -n "$line" ]; do
        stripped_line=$(echo "$line" | sed -e 's/^[ \t]*//' -e 's/[ \t]*$//')
        if [ -n "$stripped_line" ]; then
            escaped_line=$(escape_php_string "$stripped_line")
            indent=$((${#line} - ${#stripped_line}))
            indent_str=$(printf '%*s' "$indent")

            ((current_line++))
            if [ "$current_line" -lt "$total_lines" ]; then
                # Add a comma after the line, if it's not the last one
                echo "${indent_str}'${escaped_line}'," >> "$output_file"
            else
                # No comma for the last line #TODO: ca marche pas ca
                echo "${indent_str}'${escaped_line}'" >> "$output_file"
            fi
        fi
    done < "$input_file"

    # Add the closing semicolon after the echo statement
    echo ";" >> "$output_file"

    echo "✅ File '$output_file' successfully generated from '$input_file'."
}

# Call the function with the script's arguments
html_to_php_echo "$1" "$2"
