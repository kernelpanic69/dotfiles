export EDITOR=vim
export VISUAL=vim

HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ls="lsd --group-dirs first"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias zhconf="$EDITOR ~/.zshrc"
alias i3conf="$EDITOR ~/.config/i3/config"
# End aliases

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End Tab comletion

# Edit command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line
# end edit commnad lineL

PROMPT='%F{magenta}%n@%F{cyan}%m: %F{yellow}%~%f >> '
RPROMPT='%F{blue}%T %(?.%F{green}[%?].%F{red}[%?]%f)'

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 

bindkey -v

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
