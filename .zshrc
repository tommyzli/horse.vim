# Prompt config
setopt prompt_subst
PROMPT='%~ %DT%* %F{243}$(kubens -c).$(kubectx -c)%f'
PROMPT=$PROMPT$'\n'
PROMPT="$PROMPT%B%F{%(?.green.red)}$%f%b "

# fix home and end keys
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

# fix option-arrow keys
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

alias gti="git"
alias k="kubectl"
