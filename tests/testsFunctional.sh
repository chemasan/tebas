#!/usr/bin/env bash

#if output is a terminal use colors
if [ -t 1 ]
then
    declare -gr NOCOLOR='\033[0m'
    declare -gr RED='\033[0;31m'
    declare -gr GREEN='\033[32m'
    declare -gr YELLOW='\033[33m'
    declare -gr BLUE='\033[34m'
    declare -gr LIGHT_RED='\033[91m'
    declare -gr LIGHT_BLUE='\033[94m'
else
    declare -gr NOCOLOR=''
    declare -gr RED=''
    declare -gr GREEN=''
    declare -gr YELLOW=''
    declare -gr BLUE=''
    declare -gr LIGTH_RED=''
    declare -gr LIGTH_BLUE=''
fi

function err()
{
	echo -e "${RED}FAILED${NOCOLOR} functional tests"
}

trap err ERR

set -o errexit
set -v

# Check tebas works as expected even when the source enables errexit (set -e)
./tebas	-vv tests/resources/testsErrexit.sh >/dev/null 2>&1

# Check incresing verbosity (enables +x on tests) doesn't make the tests that check stderr to fail
./tebas	-vvv tests/resources/testsErrexit.sh >/dev/null 2>&1


set +v
echo
echo -e "${GREEN}SUCCEDED${NOCOLOR} functional tests"
