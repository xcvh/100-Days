import Cocoa

//let dict = [3: 1]
//dict[3]
//dict[2, default: 1]

func fib(_ n: Int) -> Int {
    var result: Int
    if n <= 2 {
        result = 1
    } else {
        result = fib(n-1) + fib(n-2)
    }
    return result
}

var results = [Int:Int]()

func memoizedFib(_ n: Int) -> Int {
    var result: Int
    if results[n] != nil {
        return results[n]!
    }
    if n <= 2 {
        result = 1
    } else {
        result = memoizedFib(n-1) + memoizedFib(n-2)
    }
    results[n] = result
//    print(results)
    return result
}

let clock = ContinuousClock()
let i = 25
let elapsed = clock.measure {
    print(fib(i))
}
print("fib: \(elapsed)")

let memoElapsed = clock.measure {
    print(memoizedFib(i))
}
print("memoizedFib: \(memoElapsed)")
