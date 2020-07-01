#!/bin/bash

# Example functions

function abs()
{
	local -i val="${1}"

	if [ "${val}" -lt 0 ]
	then
		echo $(( - val))
	else
		echo $(( val ))
	fi
}

function toUpper()
{
	local -u str="${1:-}"

	echo "${str}"
}

function toLower()
{
	local -l str="${1:-}"

	echo "${str}"
}
