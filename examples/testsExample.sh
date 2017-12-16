#!/usr/bin/env bash

# Fixtures

# setUp runs before every test
function setUp()
{
	echo "UP"
}
# tearDown runs after every test
function tearDown()
{
	echo "DOWN"
}

# Tests
# They are NOT executed in order appearing here.
# They are usually executed in alphabethical order as they are sorted by the shell

# This test succeeds
function testSuccess()
{
	#Different ways to express assert conditions
	assert test 0 -eq 0
	assert [ 0 -eq 0 ]
	assertTrue 0 -eq 0
}
# This test fails
function testFailed()
{
	assertTrue "blah" != "blah"
}
# This test should succeed (unless there is no /etc/passwd or root user in your weird system)
function testAsserts()
{
	# assert executes the command and checks the returned status is 0
	assert grep root /etc/passwd >/dev/null

	#assertTrue passes the arguments directly to the 'test' command and checks the condition is true
	grep root /etc/passwd >/dev/null
	assertTrue $? -eq 0
}
# This test fails
function testDying()
{
	echo "I'm dying :("
	die "bye bye world"  # abort execution and prints the message to stderr (use -vv to display)
	echo "I'm dead"
}
# This test fails
function testLoggers()
{
	# These functions print fancy messages to stdout (use -vv to display)
	logInfo "This is an informational message"
	logWarn "This is a warning"
	logErr "This is an error"
	fail "This is and error that makes the test fail" # This one also aborts execution
}
