#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

function myfunc()
{
	echo "stdout"
	echo "stderr" >&2
	return 0
}


function testSomething()
{
	assertCmd -o "stdout" -e "stderr" myfunc
}
