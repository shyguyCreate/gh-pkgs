#!/bin/sh

program_name="Oh-My-Posh"
program_file="oh-my-posh"
repo="JanDeDobbeleer/oh-my-posh"
program_type="bin"

program_tmp_file="/tmp/$program_file"

#Source file with functions
. "$(dirname "$0")/.check-install.sh"

#Source file with functions
. "$(dirname "$0")/.install.sh"

#Install and uninstall
download_from_literal 'posh-linux-amd64'
copy_to_install_dir
install_bin "$installDir/$program_file"
uninstall_old_version
add_new_Cobra_completions
