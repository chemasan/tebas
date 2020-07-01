#!/bin/bash

# "include" applies a "source" to a file relative to the current file.
# "source" applies to files relatives to the current working directory which sometimes may be problematic
include resources/functions.sh

function testAbsPositive()
{
	assertCmd -o "3" -- abs 3
	assertCmd -o "4" -- abs 4
	assertCmd -o "0" -- abs 0
}

function testAbsNegative()
{
	assertCmd -o "3" -- abs "-3"
	assertCmd -o "4" -- abs "-4"
	assertCmd -o "0" -- abs "-0"
}

function testToUpper()
{
	assertCmd -o "TEST" toUpper "test"
	assertCmd -o "TEST" toUpper "tEsT"
	assertCmd -o "TEST" toUpper "TEST"
}

function testToLower()
{
	assertCmd -o "test" toLower "test"
	assertCmd -o "test" toLower "tEsT"
	assertCmd -o "test" toLower "TEST"
}
