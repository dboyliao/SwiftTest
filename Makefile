example:
	cp tests/example_equal.swift tests/main.swift
	sh ./tests/make_example.sh
	./example
	rm tests/main.swift example
	cp tests/example_equal_tol.swift tests/main.swift
	sh ./tests/make_example.sh
	./example
	rm tests/main.swift example

test-osx:
	make test-unit-test-osx
	make test-utilities-osx
	make test-allclose-osx

test-utilities-osx:
	cp tests/test_color_print.swift main.swift
	xcrun -sdk macosx swiftc Sources/TestUtilities.swift main.swift -o test_color_print
	./test_color_print
	rm main.swift test_color_print

test-unit-test-osx:
	cp tests/test_unit_test.swift main.swift
	xcrun -sdk macosx swiftc Sources/TestUtilities.swift Sources/Errors.swift Sources/UnitTest.swift main.swift -o test_unit_test
	./test_unit_test
	rm main.swift test_unit_test

test-allclose-osx:
	cp tests/test_allclose.swift main.swift
	xcrun -sdk macosx swiftc Sources/TestUtilities.swift Sources/Errors.swift Sources/UnitTest.swift main.swift -o test_allclose
	./test_allclose
	rm main.swift test_allclose