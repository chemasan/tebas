#!/usr/bin/env bash

function setUpOnce()
{
	declare -g str1="Hello World"
	declare -g str2="Hello World"
	declare -g str3="Bye World"
	declare -g int1=12
	declare -g int2=12
	declare -g int3=33
}

function test_AllAssertsSuccess()
{
	assert true
	assert -m "This should not fail" true
	assertTrue 0 -eq 0
	assertTrue -m "This should not fail" true
	assertStrEq str1 str2
	assertStrEq -m "This should not fail" str1 str2
	assertStrNotEq str1 str3
	assertStrNotEq -m "This should not fail" str1 str3
	assertIntEq int1 int2
	assertIntEq -m "This should not fail" int1 int2
	assertIntNotEq int1 int3
	assertIntNotEq -m "This should not fail" int1 int3
	assertReMatch '192.168.0.1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
	assertReMatch -m "This should not fail" '192.168.0.1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
	assertReNotMatch '192-168-0-1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
	assertReNotMatch -m "This should not fail" '192-168-0-1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
	assertCmd -o 'Hello world' -e '' -r 0 -- echo "Hello world"
	assertCmd -m "This should not fail" -o 'Hello world' -e '' -r 0 -- echo "Hello world"
}
function test_assert_FailsNoMessage()
{
	assert false
}
function test_assert_FailsMessage()
{
	assert -m "assert fails with message" false
}
function test_assertTrue_FailsNoMessage()
{
	assertTrue 0 -eq 1
}
function test_assertTrue_FailsMessage()
{
	assertTrue -m "assertTrue fails with message" 0 -eq 1
}
function test_assertStrEq_FailsNoMessage()
{
	assertStrEq str1 str3
}
function test_assertStrEq_FailsMessage()
{
	assertStrEq -m "assertStrEq fails with message" str1 str3
}
function test_assertStrNotEq_FailsNoMessage()
{
	assertStrNotEq str1 str2
}
function test_assertStrNotEq_FailsMessage()
{
	assertStrNotEq -m "assertStrNotEq fails with message" str1 str2
}
function test_assertIntEq_FailsNoMessage()
{
	assertIntEq int1 int3
}
function test_assertIntEq_FailsMessage()
{
	assertIntEq -m "assertIntEq fails with message" int1 int3
}
function test_assertIntNotEq_FailsNoMessage()
{
	assertIntNotEq int1 int2
}
function test_assertIntNotEq_FailsMessage()
{
	assertIntNotEq -m "assertIntNotEq fails with message" int1 int2
}
function test_assertReMatch_FailsNoMessage()
{
	assertReMatch '192-168-0-1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
}
function test_assertReMatch_FailsMessage()
{
	assertReMatch -m 'assertReMatch fails with message' '192-168-0-1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
}
function test_assertReNotMatch_FailsNoMessage()
{
	assertReNotMatch '192.168.0.1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
}
function test_assertReNotMatch_FailsMessage()
{
	assertReNotMatch -m 'assertReNotMatch fails with message' '192.168.0.1' '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]$'
}
function test_assertCmd_FailsOutputNoMessage()
{
	assertCmd -o 'Hello world' -e '' -r 0 -- echo "Hello Worlds"
}
function test_assertCmd_FailsOutputMessage()
{
	assertCmd -m "assertCmd fails with message for output errors" -o 'Hello world' -e '' -r 0 -- echo "Hello Worlds"
}
function test_assertCmd_FailsOutputMessageWhat()
{
	assertCmd -w -o 'Hello world' -e '' -r 0 -- echo "Hello Worlds"
}
function tests_assertCmd_FailsCommandNotFoundNoMessage()
{
	assertCmd -o 'Hello world' -e '' -r 0 -- shouldNotExist
}
function tests_assertCmd_FailsCommandNotFoundMessage()
{
	assertCmd -m "assertCmd fails with message for command not found errors" -o 'Hello world' -e '' -r 0 -- shouldNotExist
}
function test_assertCmd_FailsCommandNotFounMessageWhat()
{
	assertCmd -w -o 'Hello world' -e '' -r 0 -- shouldNotExist
}
