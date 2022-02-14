#!/usr/bin/bash

id=$(xinput list | grep 'TouchPad' | \
	awk '{print $6}' | cut -d '=' -f2)

state=$(xinput list-props $id | awk '/ *Device Enabled/{print $4}')

if [ $state -eq 1 ]
then
	echo "Disabling TouchPad"
else
	echo "Enabling TouchPad"
fi

xinput set-prop $id 'Device Enabled' $((($state + 1) % 2))
