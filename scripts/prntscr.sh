#!/bin/zsh

function screenshot() {
  grim - | swappy -f -
}

function capture_region() {
  grim -g "$(slurp)" - | swappy -f -
}

function capture_window() {
  grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" - | swappy -f -
}

case $1 in
  "-w")
    capture_window
  ;;
  "-r")
    capture_region
  ;;
  "-s")
    screenshot
  ;;
  *)
    echo "Usage $0 <option>\n Options:\n \
      \t-w - capture window\n \
      \t-r - capture region\n \
      \t-s - screenshot\n"
esac
