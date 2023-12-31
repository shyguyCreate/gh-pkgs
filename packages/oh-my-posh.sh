#!/bin/sh

#Name to identify package
package_name="oh-my-posh"

#Specify github repo like this "owner/repo-name"
package_repo="JanDeDobbeleer/oh-my-posh"

#Specify type of package (app|bin|font)
package_type="bin"

#Regex match for package for specific architecture
package_for_x64="posh-linux-amd64"
package_for_arm64="posh-linux-arm64"
package_for_arm32="posh-linux-arm"
package_for_x32="posh-linux-386"

#Hashes are in same filename as download match plus extension
hash_extension="sha256"

#Path to binary based on download (start with ./)
bin_package="./$package_name"

#Completions for bash/zsh/fish using Cobra completion command (old|new)
cobra_completion="new"
