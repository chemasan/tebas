TEBAS
============
Copyright (c) 2017 Jose Manuel Sanchez Madrid. This file is licensed under MIT license. See file LICENSE for details.

## Overview
Tebas is a simple unit testing framework for testing Bash scripts. It is a little bit inspirated on [Nose](http://nose.readthedocs.io/en/latest/) for Python.

## Usage
Write a file containging your tests, each test must be a function which name begins with "test". See examples folder for sample tests files.

If a function named 'setup' exists, it will be executed before each test.
If a function named 'teardown' exists, it will be executed after each test.

Tebas provides helper functions that are available to be used in the tests:
assert
assertTrue
pass
fail
die
