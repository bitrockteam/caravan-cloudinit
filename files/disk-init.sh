#!/usr/bin/env bash

# todo: when the persistent disk are empty, it means its the first time we are running the system
#  we need to copy data previously in those folders

move_data() {
  device=$1
  mount=$2
  units=$(echo $3 | tr "," "\n")

  if [ -n "${device}" ]; then
    if [ -z "$(ls -A $mount)" ]; then
        echo "Moving old $mount data to new device $device"
        for unit in $units; do
          echo "Stopping $unit"
          sudo systemctl stop "$unit"
        done
        mv "/mnt/root$mount*" "$mount"
        for unit in $units; do
          echo "Starting $unit"
          sudo systemctl start "$unit"
        done
    else
        echo "New device $device already contains data on $mount, skipping"
    fi
  fi
}

echo "Running disk-init.sh..."
echo "+ VAULT_DEVICE=$VAULT_DEVICE"
echo "+ CONSUL_DEVICE=$CONSUL_DEVICE"
echo "+ NOMAD_DEVICE=$NOMAD_DEVICE"

mkdir /mnt/root
sudo mount --bind / /mnt/root

shopt -s dotglob nullglob

# todo: we need to eb sure that at this point the devices either does not exist, or has already been mounted

move_data "$VAULT_DEVICE" "/etc/vault.d/" "vault,vault-agent"
move_data "$CONSUL_DEVICE" "/etc/consul.d/" "consul"
move_data "$NOMAD_DEVICE" "/etc/nomad.d/" "nomad"

sudo umount /mnt/root
echo "Done preparing persistent data"
