export EDITOR=vim
export VISUAL=vim

HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ls="ls --color --group-directories-first"
alias ll="ls -lah"
alias exa="exa --icons --group-directories-first"
alias exal="exa -lah" 
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

PROMPT='%B%F{magenta}%n%f@%F{cyan}%m:%b %U%F{yellow}%~%f%u >> '
RPROMPT='%F{blue}%T %(?.%F{green}[%?].%F{red}[%?]%f)'

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 

bindkey -v

export GDK_BACKEND=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP="Unity slack"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ "$(tty)" = "/dev/tty1" ] && exec sway
