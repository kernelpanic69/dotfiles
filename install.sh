#!/usr/bin/zsh

ROOT="$(dirname $(readlink -f $0))"
CONFIG=$HOME/.config/

function install_zshrc {
  cp $ROOT/.zshrc $HOME/
  source $HOME/.zshrc
}

function install_sway {
  cp -r $ROOT/sway $CONFIG
  swaymsg reload
}

function install_waybar {
  cp -r $ROOT/waybar $CONFIG
  swaymsg reload
}

function install_scripts() {
  cp $ROOT/scripts/* $HOME/.local/bin/
}

function check_command {
  com="$1"

  if command -v $1 &> /dev/null; then
    declare "$com"_installed=1

    echo "\e[32m[OK]\e[0m \'$com\' is installed"
  else
    echo "\e[31m[Warning]\e[0m: \'$com\' is not installed"
  fi
}

function check_deps {
  echo "Checking dependencies ..."

  check_command sway
  check_command waybar
  check_command wofi
  check_command slurp
  check_command swappy
  check_command grim
  check_command pactl
  check_command swayidle
  check_command swaylock
}

function main {
  case $1 in
    "all")
      check_deps
      install_zshrc
      install_sway
      install_waybar
      install_scripts
    ;;
    "zsh")
      install_zshrc
    ;;
    "sway")
      install_sway
    ;;
    "waybar")
      install_waybar
    ;;
    "scripts")
	    install_scripts
    ;;
    *)
      echo "Usage: $0 <all|zsh|sway|waybar|scripts>"
      exit 2
  esac
}

main $@
