#!/bin/bash
# based on: https://macos-defaults.com/

echo "📦 Configuring macOS settings..."

# close System Preferences to prevent override
osascript -e 'tell application "System Preferences" to quit'

# ask user if they want to reset all settings
read -p "❓ Do you want to reset all previously configured settings? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🔄 Resetting all configured settings..."
    for domain in $(defaults domains); do
        defaults delete "$domain"
    done
    echo "✅ All settings have been reset to defaults"
fi

# set language and text formats
defaults write NSGlobalDomain "AppleLanguages" -array "en-US"
defaults write NSGlobalDomain "AppleLocale" -string "en_US"
defaults write NSGlobalDomain "AppleMeasurementUnits" -string "Centimeters"
defaults write NSGlobalDomain "AppleMetricUnits" -bool "true"

# Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "ShowStatusBar" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Dock
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "tilesize" -int "36"

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.spaces "spans-displays" -bool "true"

# Screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "type" -string "png"

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"

# Keyboard
defaults write com.apple.HIToolbox "AppleFnUsageType" -int "2"
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "true"
defaults write NSGlobalDomain "InitialKeyRepeat" -int "15"
defaults write NSGlobalDomain "KeyRepeat" -int "2"
defaults write NSGlobalDomain "com.apple.keyboard.fnState" -bool "false"

# Safari
defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool "false"
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"

# Terminal
defaults write com.apple.Terminal "SecureKeyboardEntry" -bool "true"

# TextEdit
defaults write com.apple.TextEdit "RichText" -bool "false"
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"

# Activity Monitor
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "1"

# Time Machine
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# Feedback Assistant
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

# Music
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false"

# miscellaneous
defaults write com.apple.CrashReporter "DialogType" -string "none"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"
defaults write NSGlobalDomain "NSCloseAlwaysConfirmsChanges" -bool "false"
defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindow" -bool "false"

# kill affected applications
for app in "Finder" \
    "Dock" \
    "SystemUIServer" \
    "Safari" \
    "Terminal" \
    "TextEdit" \
    "Activity Monitor" \
    "Music"; do
    killall "${app}" &> /dev/null
done

echo "✅ macOS settings configured"
echo "Some changes may require a logout/restart to take effect."
