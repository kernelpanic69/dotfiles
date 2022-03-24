#!/bin/zsh

function showVolume(){
  msg_tag="VolCtrl"
  app_name="Volume"

  if [ $1 -eq 0 ]; then 
    dunstify -a $app_name -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msg_tag "Volume muted"
  else
    dunstify -a $app_name -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msg_tag \
      -h int:value:"$1" "Volume ${1}%" 
  fi
}

function setVolume(){
  vol=$1

  if [ $vol -lt 0 ]; then
    vol=0
  elif [ $vol -gt 100 ]; then
    vol=100
  fi


  pactl set-sink-volume @DEFAULT_SINK@ $vol% 
  showVolume $vol
}

function getVolume() {
  echo "$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{ print $12 }' | sed 's/%//g')"
}

function main() {
  curr_vol=$(getVolume)
  i=10

  if [[ $1 == '-i' ]]; then
    setVolume $(( curr_vol + i ))
  elif [[ $1 == '-d' ]]; then
    setVolume $(( curr_vol - i ))
  fi
}

main "$@"
