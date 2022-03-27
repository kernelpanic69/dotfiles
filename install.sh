#!/usr/bin/zsh

local ROOT="$(dirname $(readlink -f $0))"
local CONFIG=$HOME/.config
local BIN=$HOME/.local/bin

function install_zshrc {
  cp $ROOT/.zshrc $HOME/
  echo "Installed .zshrc to $HOME"
}

function install_sway {
  cp -r $ROOT/sway $CONFIG/
  swaymsg reload
  echo "Installed sway config to: $CONFIG"
}

function install_waybar {
  cp -r $ROOT/waybar $CONFIG/
  swaymsg reload
  echo "Installed waybar config to: $CONFIG"
}

function install_scripts() {
  cp $ROOT/scripts/* $BIN/
  echo "Installed control scripts to: $BIN"
}

function check_command {
  com="$1"

  if command -v $com &> /dev/null; then
    echo "\e[32m[OK]\e[0m '$com' is installed"
  else
    echo "\e[31m[Warning]\e[0m: '$com' is not installed"
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
  check_command playerctl
  check_command notify-send
  check_command librewolf
  check_command telegram-desktop
  check_command skypeforlinux
  check_command keepassxc
}

function main {
  case $1 in
    "all")
      install_zshrc
      install_sway
      install_waybar
      install_scripts
    ;;
    "check-deps")
      check_deps
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
      echo "Usage: $0 <all|zsh|sway|waybar|scripts|check-deps>"
      exit 2
  esac
}

main $@
