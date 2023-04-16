#!/bin/bash
echo "script_update: $(date)" >> /var/log/update_script.log
apt -y update
apt -y upgrade
apt -y autoremove

if [ -f /var/run/reboot-required ]; then
	echo "System rebooted: $(date)" >> /var/log/update_script.log
        reboot
fi
