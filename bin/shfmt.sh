#!/bin/sh

program_name="Shfmt"
program_file="shfmt"
repo="mvdan/sh"
program_type="bin"

#Source file with functions
. "$(dirname "$0")/../.check-install.sh"

#Source file with functions
. "$(dirname "$0")/../.install.sh"

#Download release file (specifiy match [regex])
download_program 'shfmt_.*_linux_amd64'

#Send download contents to install directory (optional flags)
send_to_install_dir

#BIN: Specify the program binary location
#FONT: Specify which fonts should be kept
install_program "$installDir/$program_file"

#Uninstall old program version
uninstall_old_version