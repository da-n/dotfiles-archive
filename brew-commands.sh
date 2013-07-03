#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install other useful binaries
brew install ack
brew install git
brew install lynx
brew install tree

brew tap homebrew/versions

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  if brew cask info "${@}" | grep "Not installed" > /dev/null; then
    brew cask install "${@}"
  else
    echo "${@} is already installed."
  fi
}

installcask alfred
installcask caffeine
installcask disk-inventory-x
installcask dropbox
installcask github
installcask google-chrome
installcask google-chrome-canary
installcask handbrake
installcask imageoptim
installcask iterm2
installcask libre-office
installcask macvim
installcask mou
installcask sourcetree
installcask sublime-text
installcask the-unarchiver
installcask transmit
installcask vagrant
installcask rest-client
installcask sequel-pro
installcask skype
installcask virtualbox
installcask vlc

# Link Alfred to opt location
brew cask alfred link

# Remove outdated versions from the cellar
brew cleanup