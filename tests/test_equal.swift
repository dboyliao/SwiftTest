func testInt() -> Int {

    return 3

}

testEqual("Test Equal Int 3 (Correct)", test: testInt, expect:3)
testEqual("Test Equal Int 3 (Wrong)", test: testInt, expect:1)