#!/usr/bin/env bash

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

move_data "$VAULT_DEVICE" "/etc/vault.d/" "vault,vault-agent"
move_data "$CONSUL_DEVICE" "/etc/consul.d/" "consul"
move_data "$NOMAD_DEVICE" "/etc/nomad.d/" "nomad"

move_data "$VAULT_DEVICE" "/var/lib/vault/" "vault,vault-agent"
move_data "$CONSUL_DEVICE" "/var/lib/consul/" "consul"
move_data "$NOMAD_DEVICE" "/var/lib/nomad/" "nomad"

sudo umount /mnt/root
echo "Done preparing persistent data"
