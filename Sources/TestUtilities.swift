import Foundation
import Accelerate

let ColorCodes = [
    "red": 31,
    "green": 32,
    "yellow": 33,
    "blue": 34,
    "magenta": 35,
    "cyan": 36,
    "white": 37 
]

func colorPrint(args:AnyObject..., color:String) {

    let colorCode = ColorCodes[color]

    if let colorCode = colorCode {

        for arg in args {
            print("\u{001B}[1;\(colorCode)m\(arg)\u{001B}[0m")
        }

    } else {
        colorPrint("==== [\(color)] not supported ===", color:"red")
        for arg in args {
            print(arg)
        }
    }

}

func testAllClose(x:[Double], y:[Double], tol:Double = 3e-7) -> Bool {

    /*
    Return `true` if x and y are element-wise equal within a tolerance.

    params:
        `x`, `y`: double-precision array.
        `tol`: tolerance. 
    */

    var inputX = [Double](x)
    var inputY = [Double](y)
    var isClosed = false

    if x.count == y.count {

        let N = x.count

        var xMinusY = [Double](count:N, repeatedValue:0.0)
        
        // Compute x - y (vectorized)
        vDSP_vsubD(&inputX, 1, &inputY, 1, &xMinusY, 1, vDSP_Length(N))

        // Take abs value
        vDSP_vabsD(&xMinusY, 1, &xMinusY, 1, vDSP_Length(N))

        var maximum:Double = 0
        vDSP_maxvD(&xMinusY, 1, &maximum, vDSP_Length(N))

        if maximum <= tol {
            isClosed = true
        }
    }

    return isClosed

}

func testAllClose(x:[Float], y:[Float], tol:Float = 3e-7) -> Bool {

    /*
    Return `true` if x and y are element-wise equal within a tolerance.

    params:
        `x`, `y`: double-precision array.
        `tol`: tolerance. 
    */

    var inputX = [Float](x)
    var inputY = [Float](y)
    var isClosed = false

    if x.count == y.count {

        let N = x.count

        var xMinusY = [Float](count:N, repeatedValue:0.0)
        
        // Compute x - y (vectorized)
        vDSP_vsub(&inputX, 1, &inputY, 1, &xMinusY, 1, vDSP_Length(N))

        // Take abs value
        vDSP_vabs(&xMinusY, 1, &xMinusY, 1, vDSP_Length(N))

        var maximum:Float = 0
        vDSP_maxv(&xMinusY, 1, &maximum, vDSP_Length(N))

        if maximum <= tol {
            isClosed = true
        }
    }

    return isClosed
    
}
