PROMPT='⁘ %F{yellow}$(whoami)%f ⁘ %F{cyan}%2c %F{white}﹡%f%F{magenta}$(~/.rvm/bin/rvm-prompt v p)%f %F{magenta}%f '
RPROMPT='$(git_prompt_info)%F{white}⌛$f  %F{grey}%D{%L:%M:%S} %F{grey}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f %F{blue}⁞%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}☹ %f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green} %f"

# FYI, this theme is customized using `nanotech` and `macovsky` themes