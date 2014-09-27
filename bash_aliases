# No more cd ../../../.. but up 4. Goes up many dirs as the number passed as argument, if none goes up by 1 by default
up(){
    local d=""
    limit=$1
    for ((i=1 ; i <= limit ; i++))
        do
            d=$d/..
        done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

# commonly used variations of ls (and typos)
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"

# command line calculator
calc(){ awk "BEGIN{ print $* }" ;}

# handy aliases
if [ -x /usr/bin/dircolors ]; then
    #alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
