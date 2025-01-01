#!/bin/bash

#---------------------------------------------------------------------------------------
# Gallery Renamer
#
# This script renames files in user directories to a standardized format:
# "username [tweet_id].extension"
#
# Example:
# Run this script in a directory containing user subdirectories with media files ->
# "john_doe [1234567890].jpg"
#---------------------------------------------------------------------------------------

# exit on any error
set -e

# function to rename files in a user's directory
rename_user_files() {
    local user_dir="$1"
    local username="${user_dir%/}"  # remove trailing slash

    echo "Processing directory: $username"

    cd "$user_dir"

    # process each file in the directory
    for file in *; do
        # skip if not a regular file
        [ -f "$file" ] || continue

        # extract components from filename
        local base_name="${file%.*}"        # remove extension
        local extension="${file##*.}"       # get extension
        local tweet_id="${base_name%_*}"    # remove _n suffix if exists

        # if no underscore was found, use the entire base name as tweet_id
        if [ "$tweet_id" = "$base_name" ]; then
            tweet_id="$base_name"
        fi

        # construct new filename
        local new_name="${username} [${tweet_id}].${extension}"

        # rename file if the new name is different
        if [ "$file" != "$new_name" ]; then
            echo "  Renaming: $file -> $new_name"
            mv "$file" "$new_name"
        fi
    done

    cd ..
}

# check if current directory contains subdirectories
if ! ls -d */ >/dev/null 2>&1; then
    echo "Error: No subdirectories found in current directory"
    exit 1
fi

# process each user directory
for user_dir in */; do
    rename_user_files "$user_dir"
done

echo "✨ Renaming complete! ✨"
