#!/usr/bin/env bash
echo $1

if [[ $1 = "run" ]]
then
	echo "Let's add these project to this slaves whitelist: "
	$2
fi