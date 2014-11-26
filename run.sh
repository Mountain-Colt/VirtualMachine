#!/usr/bin/env bash
echo $1

if [[ $1 = "run" ]]
then
	echo "Let's run this command: "
	$2
fi