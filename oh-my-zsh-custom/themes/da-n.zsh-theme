# Oh-my-Zsh prompt created by gianu (tweaked to show newline)
#
# github.com/gianu
# sgianazza@gmail.com

PROMPT='[%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m%{$reset_color%} %{$fg[white]%}%c%{$reset_color%} $(git_prompt_info)%{$reset_color%}]
%{$fg[red]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%} %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
