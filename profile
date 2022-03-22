# /etc/profile

# Set our umask
umask 022

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'

# Force PATH to be environment
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi

# Unload our profile API functions
unset -f append_path

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash/bashrc
then
    . /etc/bash/bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

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

export PATH=$PATH:/home/kernelpanic/.local/bin
