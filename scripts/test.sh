#!/bin/bash

set -e

node node_modules/.bin/istanbul cover _mocha -- -R spec --recursive

if [ ! -z "$EXPORT_COVERAGE" ]; then
	cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js

	rm -rf ./coverage
fi


