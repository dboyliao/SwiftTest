func testInt() -> Int {

    return 3

}

testEqual("Test Equal Int 3 (Correct)", test: testInt, expect:3)
testEqual("Test Equal Int 3 (Wrong)", test: testInt, expect:1)

func testFloat() -> Float {

    return Float(1.1)

}

testEqual("Test Equal Float 1.1 (Correct)", test:testFloat, expect:Float(1.1))
testEqual("Test Equal Float 1.1 (Wrong)", test:testFloat, expect:Float(1.2))

func testDouble() -> Double {

    return 3.14

}

testEqual("Test Equal Double 3.14 (Correct)", test:testDouble, expect: 3.14)
testEqual("Test Equal Double 3.14 (Wrong)", test:testDouble, expect: 1.41421)