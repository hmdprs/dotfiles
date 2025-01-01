#!/bin/bash

#---------------------------------------------------------------------------------------
# Movie Directory Organizer
#
# This script organizes movie directories by appending the movie's release year
# to directory names. It processes directories containing a single video file
# (mkv or mp4) and extracts the year from the filename pattern (YYYY).
#
# Example:
# "The Matrix" containing "The Matrix (1999).mkv" -> "The Matrix (1999)"
#---------------------------------------------------------------------------------------

# exit on any error
set -e

readonly VALID_VIDEO_EXTENSIONS=("mkv" "mp4")

extract_year() {
    # extracts the year from a filename by looking for a pattern of (YYYY)
    local filename="$1"
    local year
    year=$(echo "$filename" | sed -n 's/.*(\([0-9]\{4\}\)).*/\1/p')
    echo "$year"
}

count_video_files() {
    # count files with specified extensions
    local dir_path="$1"
    local count=0
    count=$(find "$dir_path" -maxdepth 1 -type f \( -name "*.${VALID_VIDEO_EXTENSIONS[0]}" -o -name "*.${VALID_VIDEO_EXTENSIONS[1]}" \) | wc -l)
    echo "$count"
}


local dir
local video_count
local video_file
local year
local new_name

echo "Starting movie directory organization..."

# process each directory in the current path
for dir in */; do
    # remove trailing slash
    dir=${dir%/}

    # count video files in current directory
    video_count=$(count_video_files "$dir")

    if [ "$video_count" -eq 1 ]; then
        # get the single video file path
        video_file=$(find "$dir" -maxdepth 1 -type f \( -name "*.${VALID_VIDEO_EXTENSIONS[0]}" -o -name "*.${VALID_VIDEO_EXTENSIONS[1]}" \) -print -quit)

        # extract year from filename
        year=$(extract_year "$(basename "$video_file")")

        if [ -n "$year" ]; then
            new_name="${dir} ($year)"

            if [ "$dir" != "$new_name" ]; then
                mv "$dir" "$new_name"
                echo "✓ Renamed: $dir -> $new_name"
            else
                echo "- No change needed for: $dir"
            fi
        else
            echo "! Warning: No year found in filename for: $dir"
        fi
    else
        echo "- Skipping $dir: Contains $video_count video file(s)"
    fi
done

echo "Movie directory organization completed!"
