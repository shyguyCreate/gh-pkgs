#!/bin/sh

program_name="VSCodium"
program_file="codium"
repo="VSCodium/vscodium"
program_type="bin"

#Check if should install
. "$(dirname "$0")/../.check-install.sh"

#Regex match by architecture
download_x64='VSCodium-linux-x64-.*\.tar\.gz'
download_arm32='VSCodium-linux-armhf-.*\.tar\.gz'
download_arm64='VSCodium-linux-arm64-.*\.tar\.gz'
download_x32=''

#Download release file
. "$(dirname "$0")/../.download.sh"

#Source file with functions
. "$(dirname "$0")/../.install.sh"

#Send download contents to install directory (optional flags)
send_to_install_dir

#BIN: Specify the program binary location
#FONT: Specify which fonts should be kept
install_program "$installDir/bin/$program_file"

#Uninstall old program version
uninstall_old_version

#Add completion file for bash/zsh/fish (completion-location)
add_completions "bash" "$installDir/resources/completions/bash/$program_file"
add_completions "zsh" "$installDir/resources/completions/zsh/_$program_file"

#Add image file to system (local|onine) (image-location|url)
add_image_file "local" "$installDir/resources/app/resources/linux/code.png"

#Add desktop file to system (true|false for terminal application)
add_desktop_file false
