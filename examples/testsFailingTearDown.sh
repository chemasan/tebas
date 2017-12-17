#!/usr/bin/env bash

# TearDown will never run if setUp failed
function tearDown()
{
	logInfo "DOWN"
	return 1
}

function cleanUp()
{
	logInfo "CLEANING"
	return 1
}
function tearDownOnce()
{
	logInfo "ENDED"
	return 1
}
function cleanUpOnce()
{
	logInfo "ALL CLEAN"
	return 1
}
function testDummy()
{
	pass
}

