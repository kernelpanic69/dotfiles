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

function bg {
  $@ &;disown;
}

# tty colors
if [ "$TERM" = "linux" ]; then
  echo -en "\e]P01d2021" #black
  echo -en "\e]P8282828" #darkgrey
  echo -en "\e]P1cc241d" #darkred
  echo -en "\e]P9fb4934" #red
  echo -en "\e]P298971a" #darkgreen
  echo -en "\e]PAb8bb26" #green
  echo -en "\e]P3d66d0e" #brown
  echo -en "\e]PBfabd2f" #yellow
  echo -en "\e]P4458588" #darkblue
  echo -en "\e]PC83a598" #blue
  echo -en "\e]P5b16286" #darkmagenta
  echo -en "\e]PDd3869b" #magenta
  echo -en "\e]P6689d6a" #darkcyan
  echo -en "\e]PE8ec07c" #cyan
  echo -en "\e]P7ebdbb2" #lightgrey
  echo -en "\e]PFfbf1c7" #white
  clear #for background artifacting
fi

