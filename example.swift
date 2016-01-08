func testAdd() -> Int {
    return 1 + 1
}

// this test will pass
testEqual("Testing Add",
          test: testAdd,
          expect: 2)

// Not this one
testEqual("Testing Add (Fail)",
          test: testAdd,
          expect: 1)
