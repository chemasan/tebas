#!/usr/bin/env bash

function myfunction()
{
	echo "Hello stdout"
	echo "Hello stderr" >&2
	return 7
}
function myfuncReturnsCode()
{
	echo "Hello stdout"
	echo "Hello stderr" >&2
	return $1
}

function test_assertCmd_outputOnly()
{
	assertCmd -o "Hello stdout" myfunction
}
function test_assertCmd_errortOnly()
{
	assertCmd -e "Hello stderr" myfunction
}
function test_assertCmd_returnOnly()
{
	assertCmd -r 7 myfunction
}
function test_assertCmd_outAndErr()
{
	assertCmd -o "Hello stdout" -e "Hello stderr" myfunction
}
function test_assertCmd_everything()
{
	assertCmd -o "Hello stdout" -e "Hello stderr" -r 7 myfunction
}
function test_assertCmd_nothing()
{
	assertCmd myfunction
}
function test_assertCmd_accepts_Arguments()
{
	assertCmd -o "Hello World" echo "Hello World"
}
#This test should fail
function test_assertCmd_returnFail()
{
	assertCmd -r 0 myfunction
}
#This test should fail
function test_assertCmd_outputFail
{
	assertCmd -o "Doesn't match" myfunction
}
#Thist test should fail
function test_assertCmd_errorFail()
{
	assertCmd -e "Doesn't match" myfunction
}
#This test should fail
function test_assertCmd_nonExistingCommandFail()
{
	assertCmd shouldNotExist
}
function test_assertCmd_existingCommandReturns127or126()
{
	assertCmd -o "Hello stdout" -e "Hello stderr" -r 127 -n myfuncReturnsCode 127
	assertCmd -o "Hello stdout" -e "Hello stderr" -r 126 -n myfuncReturnsCode 126
}
