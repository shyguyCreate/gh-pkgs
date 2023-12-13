#!/bin/sh

package_name="name"
repo="owner/repo-name"
package_type="bin"

#Save path to root of the repo
repoDir="$(dirname "$(dirname "$0")")"

#Check if should install
. "$repoDir/.check-install.sh"

#Regex match by architecture
download_x64=''
download_arm32=''
download_arm64=''
download_x32=''

#Specify that file has checksums with same filename
hash_extension=''
#Specify filename with checksums
hash_file=''
#Specify hash algorithm when not found in extension
hash_algorithm=''

#Download release file
. "$repoDir/.download.sh"

#Remove num of leading folders in tar archive
strip_components=0
#Path to binary based on download (start with ./)
bin_package="install-directory/binary"

#Source file with functions
. "$repoDir/.install.sh"

#Add completion file for bash/zsh/fish (completion-location)
# add_completions "bash" "location-of-completion-file-for-bash"
# add_completions "zsh" "location-of-completion-file-for-zsh"
# add_completions "fish" "location-of-completion-file-for-fish"
# add_completions "old-Cobra"
# add_completions "new-Cobra"

#Add image file to system (local|onine) (image-location|url)
# add_image_file "local" "image-location"
# add_image_file "online" "url"

#Add desktop file to system (true|false for terminal application)
# add_desktop_file false
