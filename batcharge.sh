function battery_charge {
  # Battery 0: Discharging, 94%, 03:46:34 remaining
  bat_percent=`acpi | awk -F ':' {'print $2;'} | awk -F ',' {'print $2;'} | sed -e "s/\s//" -e "s/%.*//"`

  if [ $bat_percent -lt 20 ]; then cl='%F{red}'
  elif [ $bat_percent -lt 50 ]; then cl='%F{yellow}'
  else cl='%F{green}'
  fi

  filled=${(l:`expr $bat_percent / 10`::▸:)}
  empty=${(l:`expr 10 - $bat_percent / 10`::▹:)}
  echo $cl$filled$empty'%F{default}'
}
RPROMPT='[%*] $(battery_charge)'
