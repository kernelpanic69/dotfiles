ROOT="$(pwd)"
CONFIG=$HOME/.config/

function install_zshrc {
  cp $ROOT/.zshrc $HOME/
}

function install_sway {
  cp -r $ROOT/sway $CONFIG
}

function install_waybar {
  cp -r $ROOT/waybar $CONFIG
}

function main {
  echo $1
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
    *)
      echo "Usage: $0 <all|zsh|sway|waybar>"
      exit 1
  esac
}

main $@
