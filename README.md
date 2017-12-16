TEBAS
============
Copyright (c) 2017 Jose Manuel Sanchez Madrid. This file is licensed under MIT license. See file LICENSE for details.

## Overview
Tebas is a simple unit testing framework for testing Bash scripts. It is a little bit inspirated on [Nose](http://nose.readthedocs.io/en/latest/) for Python.

## Usage
Write a file with your tests, each test must be a function which name begins with "test". See [examples folder](examples/) for sample tests files.

If a test function return code is zero or it calls "exit 0", the test succeeds.
If a test function return code is non-zero or it calls exit with a non-zero argument, the test fails.

If a function named 'setUp' exists, it will be executed before each test.
If a function named 'tearDown' exists, it will be executed after each test.

Tebas provides helper functions that are available to be used in the tests:
 * assert \<command\> [args..] - Executes the command and checks the return code is 0. If the check fails it aborts the execution (calling _exit 1_). Square brakets or the _test_ command can be used as arguments for typical _if_ like conditional expressions (see _man test_ or _help test_)
 * assertTrue \<args...\> - Arguments must be a conditional expression, they are passed directly to the _test_ command. If the expression evaluates to false the execution is aborted.
 * assertStrEq \<varname1\> \<varname2\> - Arguments must be variable names. If the values of the referenced variables compared as strings are not equal the execution is aborted.
 * assertStrNotEq \<varname1\> \<varname2\> - Arguments must be variable names. If the values of the referenced variables compared as strings are not different the execution is aborted.
 * assertIntEq \<varname1\> \<varname2\> - Arguments must be variable names. If the values of the referenced variables compared as integers are not equal the execution is aborted. If any value is not an integer it aborts too.
 * assertIntNotEq \<varname1\> \<varname2\> - Arguments must be variable names. If the values of the referenced variables compared as integers are not different the execution is aborted. If any value is not an integer it aborts too.
 * assertReMatch \<string\> \<regex\> - Check the string matches the regex. If it doesn't the execution is aborted. If the regex is invalid it aborts too.
 * assertReNotMatch \<string\> \<regex\> - Check the string doesn't match the regex. If it does the execution is aborted. If the regex is invalid it aborts too.
 * pass - alias for _exit 0_ (makese the test succeed)
 * die [message] - Prints the message to stderr and aborts execution (calls _exit 1_, which makes the test fail)
 * fail [message] - If message is provided it is printed to stdout prefixed by an ERROR label and the name of the current test, then calls _exit 1_.
 * logInfo [message] - Prints message to stdout prefixed by an INFO label and the name of the current test
 * logWarn [message] - Prints message to stdout prefixed by a WARNING label and the name of the current test
 * logErr [message] - Prints message to stdout prefixed by an ERROR label and the name of the current test

Note that the log functions print to stdout so tebas has to run with flag '-vv' in order to display the messages.

## Example
```
./tebas -v examples/testsExample.sh
```
This brings the following output:
```
[SUCCESS] testAsserts
[FAILED ] testDying
[FAILED ] testFailed
[FAILED ] testLoggers
[SUCCESS] testSuccess

----------------------------------------------------------------------

Ran 5 tests

FAILED 3 tests
```

## TODO
 - [ ] Allow using custom function names for fixtures to avoid function name collission
 - [ ] setUpOnce and tearDownOnce fixtures
 - [x] Prefix internal function names to mitigate the possibility of function name collission
 - [ ] Accept more than one test file in arguments
 - [ ] Search for test files automatically if none has been provided as arguments
 - [ ] Reports
 - [ ] Add optional message argument to assert functions
 - [ ] Add some sort of timeout anotation
 - [ ] Add some sort of anotation to set setup and teardown per test
 - [ ] Add some sort of anotation to indicate expected exit
 - [ ] Add some sort of anotation to indicate description
 - [x] logInfo, logWarn and logErr helper functions
 - [ ] assertReturn, assertStdout, assertStderr, assertOutput, assertAllOut helper functions with option to warn on values that do not match
 - [x] assertStrEq, assertStrNotEq, assertIntEq, assertIntNotEq, helper functions using references
 - [x] assertReMatch, assertReNotMatch
 - [x] parse arguments using getopt
 - [x] stop processing command options when '--' reached and treat the rest as arguments
 - [x] Allow running individual tests
 - [x] option to enable tracing with -x
 - [x] Replace -x and -s with verbosity levels
