import Cocoa

// MARK: Recursive Fib

func fib(_ n: Int) -> Int {
    var result: Int
    if n <= 2 {
        result = 1
    } else {
        result = fib(n-1) + fib(n-2)
    }
    return result
}

// MARK: Recursive fib with memoization

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
    return result
}

// MARK: Looped fib with memoization

func loopedFib(_ n: Int) -> Int {
    var memo = [Int:Int]()
    var result: Int = 0
    
    for i in 1...n+1 {
        if i <= 2 {
            result = 1
        } else {
            result = memo[i-1]! + memo[i-2]!
        }
        memo[i] = result
    }

    return memo[n]!
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

let memoLooped = clock.measure {
    print(loopedFib(i))
}
print("loopedFib: \(memoLooped)")

//75025
//fib: 8.159130583000001 seconds
//75025
//memoizedFib: 0.002710917 seconds
//75025
//loopedFib: 0.001554541 seconds
