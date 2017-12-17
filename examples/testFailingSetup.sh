#!/usr/bin/env bash

# This setUp function will fail, making the test to be aborted
function setUp()
{
	logInfo "UP"
	return 1
}

# TearDown will never run
function tearDown()
{
	logInfo "DOWN"
}

# Test will be skipped and fail
function testDummy()
{
	pass
}

