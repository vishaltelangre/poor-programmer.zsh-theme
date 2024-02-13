left_prompt=' %F{cyan}%2c %F{white} $(git_prompt_info)%F{reset}'

function preexec() {
  timer=$(print -P %D{%s%3.})
}

grey="%F{238}" # Reference: https://www.ditig.com/publications/256-colors-cheat-sheet

function precmd() {
  # Originally copied from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0?permalink_comment_id=4502423#gistcomment-4502423

  spent_prompt=""
  if [ $timer ]; then
    now=$(print -P %D{%s%3.})
    local d_ms=$(($now - $timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))

    if   ((h > 0)); then spent_prompt=${h}h${m}m${s}s
    elif ((m > 0)); then spent_prompt=${m}m${s}.$(printf $(($ms / 100)))s # 1m12.3s
    elif ((s > 9)); then spent_prompt=${s}.$(printf %02d $(($ms / 10)))s # 12.34s
    elif ((s > 0)); then spent_prompt=${s}.$(printf %03d $ms)s # 1.234s
    else spent_prompt=${ms}ms
    fi
    if ((d_ms < 10000)); then # less than 10s
      spent_prompt=""
    else
      spent_prompt="${grey}Spent %B${spent_prompt} %f%b"
    fi
    unset timer
  fi
  newline=$'\n'
  if [ -z "$spent_prompt" ]; then
  # Don't add a newline if the prompt is empty
    newline=""
  fi
  export PS1=${spent_prompt}${newline}${left_prompt}
}

RPROMPT='${grey}@ %*%F{reset}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{reset}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}😕 %f%F{reset}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}🙂 %f%F{reset}"
