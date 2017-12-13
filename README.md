TEBAS
============
Copyright (c) 2017 Jose Manuel Sanchez Madrid. This file is licensed under MIT license. See file LICENSE for details.

## Overview
Tebas is a simple unit testing framework for testing Bash scripts. It is a little bit inspirated on [Nose](http://nose.readthedocs.io/en/latest/) for Python.

## Usage
Write a file with your tests, each test must be a function which name begins with "test". See examples folder for sample tests files.

If a function named 'setup' exists, it will be executed before each test.
If a function named 'teardown' exists, it will be executed after each test.

If a test function return code is zero or it calls "exit 0", the test succeeds.
If a test function return code is non-zero or it calls exit with a non-zero argument, the test fails.

Tebas provides helper functions that are available to be used in the tests:
 * die [message] - Prints the message to stderr and aborts execution (calls _exit 1_, which makes the test fail)
 * assert \<command\> [args..] - Executes the command and checks the return code is 0. If the check fails it aborts the execution. Square brakets or the _test_ command can be used as arguments for typical _if_ like conditional expressions (see _man test_ or _help test_)
 * assertTrue \<args...\> - arguments must be a conditional expression, they passed directly to the _test_ command. If the expression evaluates to false the execution is aborted.
 * pass - alias for _exit 1_
 * fail - alias for _exit 0_

## Example
```
./tebas -v examples/testsExample.sh
```

## TODO
 - [ ] Allow using custom function names for fixtures to avoid function name collission
 - [ ] Prefix internal function names to mitigate the possibility of function name collission
 - [ ] Accept more than one test file in arguments
 - [ ] Search for test files automatically if none has been provided as arguments
 - [ ] Reports
 - [ ] Add optional message argument to assert functions
 - [ ] Add some sort of timeout anotation
 - [ ] Add some sort of anotation to set setup and teardown per test
 - [ ] Add some sort of anotation to indicate expected exit
 - [ ] info, warn and error helper functions
 - [ ] assertReturn, assertStdout, assertStderr, assertOutput, assertAllOut helper functions with option to warn on values that do not match
