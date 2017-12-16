#!/usr/bin/env bash

# Define different names setUp and tearDown functions.
# This is useful if by chance setUp or tearDown already exists in our code base.

TEBAS_DEFAULT_SETUP="mySetupFunction"
TEBAS_DEFAULT_TEARDOWN="myTearDownFunction"

function mySetupFunction()
{
	echo UP
}

function myTearDownFunction() {
	echo DOWN
}

function testDummy()
{
	pass
}
