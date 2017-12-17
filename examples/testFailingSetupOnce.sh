#!/usr/bin/env bash

# This setUp function will fail, making the test suite to be aborted
function setUpOnce()
{
	logInfo "STARTING"
	return 1
}

# TearDown will never run
function tearDownOnce()
{
	logInfo "ENDED"
}

# Test will be skipped and fail
function testDummy()
{
	pass
}

