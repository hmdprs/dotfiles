#!/usr/bin/env python3

"""
File Renaming Utility

This script renames files in a specified directory to a datetime-based format.
The new filename format is: YYYYMMDD-HHMMSS-RRRR.ext where:
- YYYYMMDD: date of file modification
- HHMMSS: time of file modification
- RRRR: random 4-digit number
- ext: original file extension (lowercase)

Example:
    $ python rename_to_date.py -d ~/Pictures -t image
    $ python rename_to_date.py -i -t video -d ~/Videos
"""

import argparse
import csv
import logging
import random
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Tuple

# configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)

# type aliases
FileMapping = Dict[str, str]
FileType = str
Extensions = List[str]


def parse_arguments() -> Tuple[bool, FileType, Path]:
    """
    Parse command line arguments for the script.

    Returns:
        Tuple[bool, str, Path]: A tuple containing:
            - interactive mode flag
            - file type to process
            - target directory path
    """
    parser = argparse.ArgumentParser(
        description="Rename files to datetime-based format based on their modification time."
    )
    parser.add_argument(
        "-i",
        "--interactive",
        help="Enable interactive mode for confirmation",
        action="store_true",
    )
    parser.add_argument(
        "-t",
        "--type",
        help="Type of files to process",
        choices={"image", "video", "audio", "document", "archive", "all"},
        type=str.lower,
        default="image",
    )
    parser.add_argument(
        "-d", "--directory", help="Target directory path", type=Path, default=Path.cwd()
    )

    args = parser.parse_args()

    if not args.directory.is_dir():
        parser.error(f"Invalid directory path: {args.directory}")

    return args.interactive, args.type, args.directory


def get_file_extensions(file_type: FileType) -> Extensions:
    """
    Get the list of file extensions for the specified file type.

    Args:
        file_type: Type of files to process (image, video, etc.)

    Returns:
        List of file extensions (lowercase) for the specified type
    """
    extensions = {
        "image": [".jpg", ".jpeg", ".png", ".gif", ".svg"],
        "video": [".mp4", ".mkv", ".avi", ".mov", ".wmv"],
        "audio": [".mp3", ".wav", ".ogg", ".flac", ".m4a"],
        "document": [".txt", ".pdf", ".docx", ".xlsx", ".pptx"],
        "archive": [".zip", ".rar", ".tar", ".gz", ".7z"],
    }

    if file_type == "all":
        return [ext for exts in extensions.values() for ext in exts]

    return extensions[file_type]


def rename_files(directory: Path, extensions: Extensions) -> FileMapping:
    """
    Rename files in the specified directory to datetime-based format.

    Args:
        directory: Path to the target directory
        extensions: List of file extensions to process

    Returns:
        Dictionary mapping original filenames to new filenames
    """
    result: FileMapping = {}

    # filter files by extension
    target_files = [
        f for f in directory.iterdir() if f.is_file() and f.suffix.lower() in extensions
    ]

    for file_path in target_files:
        # get file modification time
        mtime = datetime.fromtimestamp(file_path.stat().st_mtime)

        # generate new filename
        new_name = (
            f"{mtime.strftime('%Y%m%d-%H%M%S')}"  # datetime part
            f"-{random.randint(0, 9999):04d}"  # random number
            f"{file_path.suffix.lower()}"  # extension
        )

        try:
            file_path.rename(directory / new_name)
            result[file_path.name] = new_name
            logger.debug(f"Renamed: {file_path.name} -> {new_name}")
        except OSError as e:
            logger.error(f"Failed to rename {file_path.name}: {e}")

    return result


def save_rename_log(directory: Path, mapping: FileMapping) -> None:
    """
    Save the renaming results to a CSV file.

    Args:
        directory: Path to save the log file
        mapping: Dictionary of original to new filenames
    """
    log_file = directory / "rename_log.csv"
    try:
        with log_file.open("w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["Original Name", "New Name"])
            writer.writerows(mapping.items())
        logger.info(f"Rename log saved to {log_file}")
    except IOError as e:
        logger.error(f"Failed to save rename log: {e}")


def main() -> None:
    """Main execution function."""
    # parse command line arguments
    interactive, file_type, directory = parse_arguments()

    # get target file extensions
    extensions = get_file_extensions(file_type)
    logger.info(
        f"Processing {file_type} files ({', '.join(extensions)}) in {directory}"
    )

    # confirm if in interactive mode
    if interactive:
        if input("Proceed with renaming? [y/N] ").lower() not in ["y", "yes"]:
            logger.info("Operation cancelled by user")
            return

    # rename files
    result = rename_files(directory, extensions)

    # report results
    if result:
        logger.info(f"Successfully renamed {len(result)} files")
        save_rename_log(directory, result)
    else:
        logger.info("No files were renamed")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        logger.info("\nOperation cancelled by user")
    except Exception as e:
        logger.error(f"An unexpected error occurred: {e}")
