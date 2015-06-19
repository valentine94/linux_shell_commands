#!/bin/bash
# Restart each service if it running.
for i in nginx mysql php5-fpm
do
  if P=$(pgrep ${i}); then
    sudo service ${i} restart
  else
    echo "'${i}' service doesn't running!"
  fi
done
