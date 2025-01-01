#!/usr/bin/env python3

"""
Movie Folder Renamer

This script renames movie folders by fetching their official titles and release years
from TheMovieDB. It helps organize movie collections by adding standardized names
and release years to folder names.
"""

import logging
import os
import re
import time
from typing import Optional, Tuple

import requests
from bs4 import BeautifulSoup

# configuration constants
TMDB_BASE_URL = "https://www.themoviedb.org/search"
REQUEST_HEADERS = {"Accept-Language": "en-US,en;q=0.5"}
REQUEST_DELAY = 2  # delay between API requests in seconds

# configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


def fetch_movie_info(movie_name: str) -> Tuple[Optional[str], Optional[str]]:
    """
    Fetch movie information from TheMovieDB.

    Args:
        movie_name: The name of the movie to search for.

    Returns:
        A tuple containing (title, release_year) if found, (None, None) otherwise.
    """
    search_url = f"{TMDB_BASE_URL}?query={movie_name.replace(' ', '+')}&language=en-US"

    try:
        response = requests.get(search_url, headers=REQUEST_HEADERS)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, "html.parser")
        first_result = soup.find("div", class_="card v4 tight")

        if not first_result:
            logger.warning(f"No results found for movie: {movie_name}")
            return None, None

        title = first_result.find("h2")
        release_date = first_result.find("span", class_="release_date")

        if title and release_date:
            year_match = re.search(r"\d{4}", release_date.text)
            if year_match:
                return title.text.strip(), year_match.group()

        logger.warning(f"Incomplete information found for movie: {movie_name}")
        return None, None

    except requests.RequestException as e:
        logger.error(f"Error fetching data for {movie_name}: {e}")
        return None, None


def generate_new_folder_name(
    original_name: str, movie_title: str, release_year: str
) -> str:
    """
    Generate a new folder name based on the original name and fetched information.

    Args:
        original_name: The current folder name
        movie_title: The official movie title
        release_year: The movie's release year

    Returns:
        The new folder name
    """
    # remove any existing year in parentheses from the old name
    clean_original_name = re.sub(r"\s*\(\d{4}\)$", "", original_name).strip()

    # if the original name matches the found title (case-insensitive),
    # use only the official title
    if clean_original_name.lower() == movie_title.lower():
        return f"{movie_title} ({release_year})"

    # otherwise, keep both names for reference
    return f"{clean_original_name} -- {movie_title} ({release_year})"


def process_movie_folder(folder_path: str, folder_name: str) -> None:
    """
    Process a single movie folder by fetching info and renaming it.

    Args:
        folder_path: Full path to the folder
        folder_name: Name of the folder
    """
    movie_title, release_year = fetch_movie_info(folder_name)

    if not movie_title or not release_year:
        logger.warning(f"Skipping folder: {folder_name} - Could not fetch information")
        return

    new_name = generate_new_folder_name(folder_name, movie_title, release_year)
    new_path = os.path.join(os.path.dirname(folder_path), new_name)

    try:
        os.rename(folder_path, new_path)
        logger.info(f"Renamed: {folder_name} -> {new_name}")
    except OSError as e:
        logger.error(f"Failed to rename {folder_name}: {e}")


def rename_movie_folders(directory: str) -> None:
    """
    Rename all movie folders in the specified directory.

    Args:
        directory: Path to the directory containing movie folders
    """
    for folder_name in os.listdir(directory):
        folder_path = os.path.join(directory, folder_name)

        if not os.path.isdir(folder_path):
            continue

        process_movie_folder(folder_path, folder_name)
        time.sleep(REQUEST_DELAY)  # prevent overwhelming the API


def main():
    """Main entry point of the script."""
    movie_directory = input("Enter the path to your movie folders: ").strip()

    if not os.path.isdir(movie_directory):
        logger.error(
            "The specified directory does not exist. Please check the path and try again."
        )
        return

    logger.info(f"Starting to process movies in: {movie_directory}")
    rename_movie_folders(movie_directory)
    logger.info("Finished processing all folders")


if __name__ == "__main__":
    main()
