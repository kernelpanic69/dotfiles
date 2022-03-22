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
  cp $ROOT/scripts/volume.sh $HOME/.local/bin/vol
}

function main {
  case $1 in
    "all")
      install_zshrc
      install_sway
      install_waybar
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
      exit 1
  esac
}

main $@
