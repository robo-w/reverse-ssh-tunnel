#!/bin/bash

# Based on https://www.tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel/

REMOTE_SSH_HOST=example.com
REMOTE_SSH_USER=change-me
# Do not use 22 here, since it is already in use by the server!
REMOTE_SSH_FORWARD_HOST=10022

createTunnel() {
  /usr/bin/ssh -N -R $REMOTE_SSH_FORWARD_HOST:localhost:22 $REMOTE_SSH_USER@$REMOTE_SSH_HOST &
  if [[ $? -eq 0 ]]; then
    echo Tunnel to jumpbox server created successfully
  else
    echo An error occurred creating a tunnel to jumpbox. return code was $?
  fi
}

echo
echo Tunnel creation script started
/bin/date

# Checks if an SSH connection already exists.
# This might not work reliably, if users open SSH connections manually from this host.
/bin/pidof ssh
if [[ $? -ne 0 ]]; then
  echo Creating new tunnel connection
  createTunnel
else
  echo Tunnel already exists.
fi

echo