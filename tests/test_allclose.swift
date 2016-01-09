print("")
colorPrint("==== Testing allclose for [Float] ====\n", color:"yellow")

func testAllCloseFloatInTol() -> Bool {

    let x:[Float] = [1, 2, 3, 4, 5]
    let y:[Float] = [1+1e-7, 2+2e-7, 3+3e-7, 4+4e-7, 5+5e-7]
    let tol:Float = 6e-7

    return allClose(x, y:y, tol:tol)

}

func testAllCloseFloatOutTol() -> Bool {

    let x:[Float] = [1, 2, 3, 4, 5]
    let y:[Float] = [1+1e-7, 2+2e-7, 3+3e-7, 4+4e-7, 5+5e-7]
    let tol:Float = 1e-8

    return allClose(x, y:y, tol:tol)

}

func testAllCloseSingleFloatInTol() -> Bool {

    let x:[Float] = [1]
    let y:[Float] = [1+3e-7]
    let tol:Float = 4e-7

    return allClose(x, y:y, tol:tol)

}

func testAllCloseSingleFloatOutTol() -> Bool {

    let x:[Float] = [1]
    let y:[Float] = [1+3e-7]
    let tol:Float = 1e-8

    return allClose(x, y:y, tol:tol)

}

func testAllCloseDifferentLengthFloat() -> Bool {

    let x:[Float] = [1, 2]
    let y:[Float] = [1]

    return allClose(x, y:y)
}

testEqual("Test allClose Float (in tolerance)", test:testAllCloseFloatInTol, expect:true)
testEqual("Test allClose Float (out of tolerance)", test:testAllCloseFloatOutTol, expect:false)
testEqual("Test allClose Single Float (in tolerance)", test:testAllCloseSingleFloatInTol, expect:true)
testEqual("Test allClose Single Float (out of tolerance)", test:testAllCloseSingleFloatOutTol, expect:false)
testEqual("Test allClose Different Length Float", test:testAllCloseDifferentLengthFloat, expect:false)

func testAllCloseDoubleInTol() -> Bool {

    let x:[Double] = [1, 2, 3, 4, 5]
    let y:[Double] = [1+1e-15, 2+2e-15, 3+3e-15, 4+4e-15, 5+5e-15]
    let tol:Double = 6e-15

    return allClose(x, y:y, tol:tol)
}

func testAllCloseDoubleOutTol() -> Bool {

    let x:[Double] = [1, 2, 3, 4, 5]
    let y:[Double] = [1+1e-15, 2+2e-15, 3+3e-15, 4+4e-15, 5+5e-15]
    let tol:Double = 1e-16

    return allClose(x, y:y, tol:tol)
}

func testAllCloseSingleDoubleInTol() -> Bool {

    let x:[Double] = [1]
    let y:[Double] = [1+3e-15]
    let tol:Double = 4e-15

    return allClose(x, y:y, tol:tol)

}

func testAllCloseSingleDoubleOutTol() -> Bool {

    let x:[Double] = [1]
    let y:[Double] = [1+3e-15]
    let tol:Double = 1e-16

    return allClose(x, y:y, tol:tol)

}

func testAllCloseDifferentLengthDouble() -> Bool {

    let x:[Double] = [1, 2]
    let y:[Double] = [1]

    return allClose(x, y:y)
}

testEqual("Test allClose Double (in tolerance)", test:testAllCloseDoubleInTol, expect:true)
testEqual("Test allClose Double (out of tolerance)", test:testAllCloseDoubleOutTol, expect:false)
testEqual("Test allClose Single Double (in tolerance)", test:testAllCloseSingleDoubleInTol, expect:true)
testEqual("Test allClose Single Double (out of tolerance)", test:testAllCloseSingleDoubleOutTol, expect:false)
testEqual("Test allClose Different Length Double", test:testAllCloseDifferentLengthDouble, expect:false)
