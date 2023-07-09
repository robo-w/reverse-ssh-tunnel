# Reverse SSH Tunnel

Script for an auto-created reverse SSH tunnel for remote management of devices behind a NAT.

## Precondition

* SSH server which is publicly available. Referenced as "jump host" in the script.
* Device for remote management, which does not have a public IP itself

## Setup

* Create a dedicated user on the SSH server host. The user should have minimal rights, just enough to open an SSH connection with port forwarding.
* Create an SSH key on the remote device and add the public key to the `authorized_keys` of the newly created user on the jump host.
* Test the connection from the remote device to the SSH server manually. If necessary, confirm the authenticity of the SSH server fingerprint.
* Install the provided script on the remote device.
* Add the cron job entry on the remote device.
* Latest after a minute you can access the remote device on the SSH server via the locally exposed port configured in the script.
