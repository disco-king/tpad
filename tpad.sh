#!/usr/bin/bash

id=$(xinput list | awk '/[Tt]ouch[\-]?[Pp]ad/{print $6}' | cut -d '=' -f2)

if [ -z $id ]
then
	echo "Xinput entry not found"
	echo "Check device name"
	exit 1
fi

state=$(xinput list-props $id | awk '/Device Enabled/{print $4}')

if [ $state -eq 1 ]
then
	echo "Touchpad disabled"
else
	echo "Touchpad enabled"
fi

xinput set-prop $id 'Device Enabled' $((($state + 1) % 2))
