#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT 

function ctrl_c(){
  echo "$redColour""Saliendo""$endColour"
}

# main function

if [ "$(id -u)" == "0" ]; then
  echo -e "\n$blueColour"[*] Purgando NTP..."$endColour"
  sudo apt purge ntp 
  sleep 5 
  echo -e "\n$purpleColour"[*] Levantando el servicio timesyncd..."$endColour" 
  sudo systemctl start systemd-timesyncd 
  echo -e "\n$greenColour"[*] Listo!"$endColour"
else
  echo -e "\n$redColour"[*]" no eres root!!!""$endColour"
fi
