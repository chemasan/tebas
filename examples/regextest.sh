#!/usr/bin/env bash


function myfunc()
{
	@description "esto es una descripcion"
	@propiedad 'otra prop'
	@otroparam "con valor" # comentario
	@test
@timed 8
	@variosparams uno dos tres
	@mas
}

function tebasGetTestAnnotations()
{
	local functionName="$1"

	declare -f "${functionName}" | while read line
	do
		if [[ ${line} =~ ^[[:blank:]]*\@([a-zA-Z0-9]+)([[:blank:]]+([^\#\;\'\"]*|\"[^\"]*\"|\'[^\']*\'))?([\s\;]*)$ ]]
		then
			local key="${BASH_REMATCH[1]%% }"
			local value="${BASH_REMATCH[3]%% }"
			value="${value## }"
			if [[ ${value} =~ ^\"([^\"]*)\"$ ]] || [[ ${value} =~ ^\'([^\']*)\'$ ]]
			then
				value="${BASH_REMATCH[1]}"
			fi
			echo "${key}=${value}"
		fi
	done
}

tebasGetTestAnnotations myfunc
