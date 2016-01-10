
func threshold(x:[Double], thres:Double) -> [Double] {
    var result = [Double](count:x.count, repeatedValue:0.0)

    for i in 0..<x.count {
        if x[i] > 0.0 {
            result[i] = x[i]
        }
    }
    return result
}

func testThreshold() -> [Double]{
    
    let x:[Double] = [1, 2, -1, 3, -10, 30]

    return threshold(x, thres:0.0)
}

let answerWithNoise:[Double] = [1.002, 2, 0, 3, 0, 30]

testEqualInTol("Test on Thresholding [Pass]", test:testThreshold, 
               expect:answerWithNoise, tol:1e-2)

testEqualInTol("Test on Thresholding [Fail]", test:testThreshold, 
               expect:answerWithNoise, tol:1e-3)