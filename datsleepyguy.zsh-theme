PROMPT="%(?:%{$fg_bold[green]%}ﲤ:%{$fg_bold[red]%}ﲤ)"
PROMPT+=' %{$fg[cyan]%}%c% $(git_prompt_info)%{$fg_bold[green]%}ﲤ%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
