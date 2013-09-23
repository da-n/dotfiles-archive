# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM="$HOME/.dotfiles/oh-my-zsh-custom"

# Theme
ZSH_THEME="da-n"

# Plugins
plugins=(git)

# Aliases
if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

if [ -f $HOME/.zprofile ]; then
  source $HOME/.zprofile
fi

if [ -f $HOME/.aliases.local ]; then
  source $HOME/.aliases.local
fi
