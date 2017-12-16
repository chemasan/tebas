#!/usr/bin/env bash

# tested function
function myfunction()
{
	ls /
}

# Fixtures
function setUp()
{
	declare -gr expected="Hello World"
}
function tearDown()
{
	# If the stub has not been unset, this will print "hello world" (run with -vv to display stdout)
	myfunction 
}


function testStub1()
{
	# stub for the 'ls' command by declaring a function with the same name
	function ls()
	{
		echo "Hello World"
	}
	result="$(myfunction)"
	# unset the stub, otherwise will still work during tearDown
	# This is because each sequence of setUp, test and tearDown run in the same subshell.
	# Keep in mind that if 'myfunction' calls 'exit' this will not work (see testStub4 for alternative)
	unset ls
	assertTrue "${result}" = "${expected}"
}
function testStub2()
{
	# This example shows what happen if overriden functions are not unset (run with -vv to display stdout)
	function ls()
	{
		echo "Hello World"
	}
	result="$(myfunction)"
	assertTrue "${result}" = "${expected}"
}
function testStub3()
{
	# Tests themselves are executed in subshells and are not affected
	# in the case other tests overrided a command
	result="$(myfunction)"
	assertTrue "${result}" != "${expected}"
}
function testStub4()
{
	# Another solution is to run the whole test can run inside a subshell.
	# This prevents the stub being active during tearDown if the tested function calls 'exit'
	# In this case, mind to not run anything after the subshell as it modifies $? unless you want
	# to change the test result. 
	# Neither try to run the asserts outside the subshell with data generated inside the subshell
	# as it is not available in the parent shell.
	# Any modification of global variables will not be available for tearDown.
	(
		function ls()
		{
			echo "Hello World"
		}
		result="$(myfunction)"
		assertTrue "${result}" = "${expected}"
	)
}
