#!/usr/bin/env bash

# Define different names setUp and tearDown functions.
# This is useful if by chance setUp or tearDown already exists in our code base.

TEBAS_DEFAULT_SETUP="mySetupFunction"
TEBAS_DEFAULT_TEARDOWN="myTearDownFunction"
TEBAS_DEFAULT_SETUPONCE="mySetUpOnceFunction"
TEBAS_DEFAULT_TEARDOWNONCE="myTearDownOnceFunction"

function mySetupFunction()
{
	logInfo UP
}

function myTearDownFunction()
{
	logInfo DOWN
}

function mySetUpOnceFunction()
{
	logInfo STARTING
}

function myTearDownOnceFunction()
{
	logInfo ENDED
}

function testDummy()
{
	logWarn "Running the test '${CURRENT_TEST}'"
	pass
}
