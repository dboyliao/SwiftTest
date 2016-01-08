import Foundation

func equal<T:Equatable>(label: String, test: () -> T, expect:T) throws {

    NSLog("%@", label)

    let start = NSDate()

    defer {
        let end = NSDate()
        let duration = end.timeIntervalSinceDate(start)
        NSLog("%@ takes %5.3g seconds.", label, duration)
    }

    let result = test()

    if result != expect {
        throw TestingError.NotEqualError(message:"Output: \(result)\nExpect: \(expect).")
    }

    colorPrint("[\(label)] pass.", color:"blue")

}

func equal<T:Equatable>(label: String, test: () -> [T], expect:[T]) throws {

    NSLog("%@", label)

    let start = NSDate()

    defer {
        let end = NSDate()
        let duration = end.timeIntervalSinceDate(start)
        NSLog("%@ takes %5.3g seconds.", label, duration)
    }

    let result = test()

    if result.count != expect.count {
        throw TestingError.LengthError(message:"Array length do not match.")
    }

    if result != expect {
        throw TestingError.NotEqualError(message:"Output: \(result)\nExpect: \(expect).")
    }

    colorPrint("[\(label)] pass.", color:"blue")
    if result.count > 20 {
        colorPrint("Output: \(result[0..<5])...\(result[(result.count-5)..<(result.count-1)])", color:"cyan")
        colorPrint("Expect: \(expect[0..<5])...\(expect[(result.count-5)..<(expect.count-1)])", color:"cyan")
    } else {
        colorPrint("Output: \(result)", color:"cyan")
        colorPrint("Expect: \(expect)", color:"cyan")
    }
}

func testEqual<T:Equatable>(label: String, test:() -> T, expect: T) {

    do {

        try equal(label, test:test, expect:expect)

    } catch TestingError.NotEqualError(let message){

        colorPrint("[\(label)] fail.", color:"red")
        colorPrint(message, color:"magenta")

    } catch {

        colorPrint("Uncatched Error....", color:"red")

    }

    colorPrint("\n============\n", color: "yellow")

}

func testEqual<T:Equatable>(label: String, test:() -> [T], expect: [T]) {

    do {

        try equal(label, test:test, expect:expect)

    } catch TestingError.NotEqualError(let message){

        colorPrint("[\(label)] fail.", color:"red")
        colorPrint(message, color:"magenta")

    } catch {

        colorPrint("Uncatched Error....", color:"red")

    }

    colorPrint("\n============\n", color: "yellow")

}
