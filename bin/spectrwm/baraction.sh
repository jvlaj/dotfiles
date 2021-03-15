#!/bin/bash
# baraction.sh script for spectrwm status bar

while true
do 
  # updates
    updates()   {
        updates="$(pacman -Qu | wc -l)"
        echo -e "updates: $updates"
    }

## HDD
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "hdd: $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "cpu: $cpu%"
}


  # BATTERY
  #bat="$(cat /sys/class/power_supply/BAT0/capacity)%"
  #bat_state="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | tr -d "[:space:]" | cut -c 7-)"
  #if [ "$bat_state" = "charging" ]; then
  #    bat="$bat ($bat_state)"
  #fi

  # VOLUME
#  vol() {
#	  pacmd list-sinks|grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/%//g'
#  }
## VOLUME
vol() {
    vol="$(pacmd list-sinks|grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/%//g')"
    echo -e "vol: $vol"
}


#  if (( 0 <= $(vol) < 30 )); then
#          voli="🔈"
#  elif (( 30 <= $(vol) < 60 )); then
#          voli="🔉"
#  elif (( 60 <= $(vol) < 100 )); then
#          voli="🔊"
#  fi

  # CAFFEINE
  if pgrep "xautolock" >/dev/null 2>&1; then
	  caf=""
  else
	  caf="☕"
  fi

  echo "$(updates) | $(vol)% | $(cpu) | $(mem) | $(hdd)"
  sleep 1.5
done

