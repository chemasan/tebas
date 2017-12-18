#!/usr/bin/env bash

# Fixtures

# setUp runs before every test
function setUp()
{
	echo "UP"
}
# tearDown runs after every test, unless setUp failed (if exists and returned with status != 0)
function tearDown()
{
	echo "DOWN"
}
# cleanUp runs after every test, after tearDown (if exists), even if setUp failed.
function cleanUp()
{
	echo "CLEANING"
}
# setUpOnce runs only once per tests script, before running any test in the file.
function setUpOnce()
{
	echo "STARTING"
}
# tearDownOnce runs only once per tests script, after running all the tests in the file.
function tearDownOnce()
{
	echo "ENDED"
}
# cleanUpOnce runs only once per test script, after running all the tests in the file and its tearDownOnce, or after a failed setUpOnce.
function cleanUpOnce()
{
	echo "ALL CLEAN"
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

	# assertTrue passes the arguments directly to the 'test' command and checks the condition is true
	grep root /etc/passwd >/dev/null
	assertTrue $? -eq 0

	# assertStrEq and assertStrNotEq takes two variable names and compare their values as strings
	local str1="Hello world"
	local str2="Hello world"
	local str3="Bye world"
	assertStrEq str1 str2
	assertStrNotEq str1 str3

	# assertIntEq and assertIntNotEq takes two variable names and compare their values as integers
	local -i val1=33
	local -i val2=33
	local -i val3=44
	assertIntEq val1 val2
	assertIntNotEq val1 val3

	# assertReMatch and assertReNotMatch check string matching regular expressions
	assertReMatch '192.168.0.1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
	assertReNotMatch '192-168-0-1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'

	# asssertCmd runs the provided command and checks its outputs
	assertCmd -o 'Hello world' -e '' -r 0 -- echo "Hello world"
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
# This test succeeds
function testRunCmd()
{
	# runCmd can run a command and capture its outputs in the indicated variables
	runCmd -o myout -e myerr -r ret -- bash -c 'echo "standard message"; echo "error message" >&2;  exit 7'
	assertTrue "${ret}" -eq "7"
	assertTrue "${myout}" = "standard message"
	assertTrue "${myerr}" = "error message"
}
# This test succeeds
function testWithAnnotations()
{
	@shouldFail
	@description "This is a test with annotations"
	@withSetUp myCustomSetup
	@withTearDown myCustomTearDown
	@withCleanUp myCustomCleanUp

	assert false
}
function myCustomSetup()
{
	echo "UP with custom setup for test ${CURRENT_TEST}"
}
function myCustomTearDown()
{
	echo "DOWN with custom teardown for test ${CURRENT_TEST}"
}
function myCustomCleanUp()
{
	echo "CLEANING with custom cleanup for test ${CURRENT_TEST}"
}
