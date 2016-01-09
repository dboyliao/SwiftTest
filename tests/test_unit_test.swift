colorPrint("\n===== Test on Equilation Tests =====\n", color:"yellow")

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

colorPrint("\n===== Test on Equality with Tolerance =====\n", color:"yellow")

func testEqualInTolDouble() -> [Double] {

    return [Double]([1, 2, 3])

}

func testEqualInTolFloat() -> [Float] {

    return [Float]([1, 2, 3])

}

let answerTolDouble:[Double] = [1+1e-5, 2+2e-5, 3+3e-5]
let answerTolFloat:[Float] = [1+1e-5, 2+2e-5, 3+3e-5]

testEqualInTol("Equilation with Tolerance Double", test: testEqualInTolDouble, expect: answerTolDouble, tol: 1e-4)
testEqualInTol("Equilation with Tolerance Double", test: testEqualInTolDouble, expect: answerTolDouble, tol: 1e-5)
testEqualInTol("Equilation with Tolerance Float", test: testEqualInTolFloat, expect: answerTolFloat, tol: 1e-4)
