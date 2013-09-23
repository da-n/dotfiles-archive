# Customize to your needs...

export EDITOR=vim
export PATH="/usr/local/bin:$PATH:/usr/bin:/usr/sbin:/usr/local/share/npm/bin"

if which rbenv >/dev/null; then
    eval "$(rbenv init -)"
else
    echo "Rbenv is not installed: not added to PATH"
fi
