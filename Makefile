example:
	cp tests/example.swift tests/main.swift
	sh ./tests/make_example.sh
	./example
	rm tests/main.swift example

test:
	make test-equal-osx
	make test-utilities-osx

test-utilities-osx:
	cp tests/test_utilities.swift main.swift
	xcrun -sdk macosx swiftc Utilities.swift main.swift -o test
	./test
	rm main.swift test

test-equal-osx:
	cp tests/test_equal.swift main.swift
	xcrun -sdk macosx swiftc Utilities.swift Errors.swift Profile.swift main.swift -o test
	./test
	rm main.swift test