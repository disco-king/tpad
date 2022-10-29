#!/usr/bin/bash

if [ -z $1 ]
then
	echo "Provide an option for installation"
	echo "Use \"help\" or -h to get help"
	exit 1
fi

if { [ $1 == "-h" ] || [ $1 == "--help" ] || [ $1 == "help" ]; } 
then
	echo "This script creates \"tpad\" alias in ~/.bash_aliases"
	echo "run \"install.sh here\" to save this location of tpad.sh"
	echo "or \"install.sh [path]\" to provide a custom path"
	echo "where tpad.sh will be copied automatically"
	exit 0
fi

if [ $1 == "here" ] 
then
	path=$(pwd)"/tpad.sh"
else
	path=$1"/tpad.sh"
	cp tpad.sh $path
fi

echo "Adding alias \"tpad\" for $path"
echo

if ! echo "alias tpad=$path" >> ~/.bash_aliases
then
	echo "Alias creation failed"
	exit 1
fi

echo "Alias creation successfull"
