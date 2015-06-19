#!/usr/bin/env bash
# This script requires the relative script path as first argument.
if [ -f $1 ]; then
  # Prepare the filename without extension.
  FILE=${1%%.*}
  # Prepare the installation path.
  if [ -d /usr/bin ]; then
    INSTALLATION_PATH=/usr/bin/${FILE}
    # Installation process.
    echo "Prepare to install script '${FILE}'"
    printf '%100s\n' | tr ' ' =
    echo -n "Copy file to the /usr/bin/ directory..."
    sudo cp $1 ${INSTALLATION_PATH}; sleep 1; echo "Success"
    printf '%100s\n' | tr ' ' =
    echo -n "Apply the execute permissions..."
    sudo chmod +x ${INSTALLATION_PATH}; sleep 1;  echo "Success";
    printf '%100s\n' | tr ' ' =
    echo "The script ${FILE} from the file ${1} has been succesfully installed!"
  else
    echo "Directory '/usr/bin' doesn't exist!"
  fi
else
  echo "File '$1' doesn't exist!"
fi
