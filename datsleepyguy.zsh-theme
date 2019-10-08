LCHAR_WIDTH=%1G

LCHAR='ﲤ'

#PROMPT='%{$fg[cyan]%}%c %{$fg_bold[green]%}➜ %{$reset_color%}'
PROMPT='%{$fg_bold[green]%}ﲤ %{$fg[cyan]%}%c %{$fg[green]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
