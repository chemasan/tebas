#!/usr/bin/env bash

# This setUp function will fail, making the test to be aborted
function setUp()
{
	logInfo "UP"
	return 1
}

# TearDown will never run if setUp failed
function tearDown()
{
	logInfo "DOWN"
}

# cleanUp will run, ever if the setUp failed
function cleanUp()
{
	logInfo "CLEANING"
}

# Test will be skipped and fail
function testDummy()
{
	pass
}

