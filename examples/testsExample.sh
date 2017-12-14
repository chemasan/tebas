#!/usr/bin/env bash

#fixtures
function setUp()
{
	echo "UP"
}
function tearDown()
{
	echo "DOWN"
}

#tests
function testSuccess()
{
	assert [ 0 -eq 0 ]
	assertTrue 0 -eq 0
}
function testFailed()
{
	assertTrue "blah" != "blah"
}
function testDying()
{
	echo "I'm dying :("
	die "bye bye world"
	echo "I'm dead"
}
function testSomething()
{
	assertTrue  0 = 0 
}
function testLoggers()
{
	logInfo "This is an informational message"
	logWarn "This is a warning"
	logErr "This is an error"
	fail "This is and error that makes the test fail"
}
