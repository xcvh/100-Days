// MARK: Naive Recursive Approach

func gridTraveller(_ m: Int, _ n: Int) -> Int {
   
    if m == 1 && n == 1 {
        return 1
    }
    if m == 0 || n == 0 {
        return 0
    }
    
    return gridTraveller(m - 1, n) + gridTraveller(m, n - 1)
}

// MARK: Memoized Approach
//  Remember to put the memo object outside of the function scope, better yet try a bottom up approach.

var memo = [String: Int]()
func gridTravellerMemoized(_ m: Int, _ n: Int) -> Int {
    var key = "\(m),\(n)"

    if memo[key] != nil {
        return memo[key]!
    }
    
    if m == 1 && n == 1 {
        return 1
    }
    if m == 0 || n == 0 {
        return 0
    }
    
    memo[key] = gridTravellerMemoized(m - 1, n) + gridTravellerMemoized(m, n - 1)
    
    return memo[key]!
}

// MARK: Memoized approach with respect for backwards keys
//  Remember to put the memo object outside of the function scope, better yet try a bottom up approach.

var memoB = [String: Int]()
func gridTravellerMemoized2(_ m: Int, _ n: Int) -> Int {
    let key = "\(m),\(n)"
    let backwardsKey = "\(n),\(m)"
    
    if memoB[key] != nil {
        return memoB[key]!
    }
    if memoB[backwardsKey] != nil {
        return memoB[backwardsKey]!
    }
    
    if m == 1 && n == 1 {
        return 1
    }
    if m == 0 || n == 0 {
        return 0
    }
    
    memoB[key] = gridTravellerMemoized2(m - 1, n) + gridTravellerMemoized2(m, n - 1)
    
    return memoB[key]!
}

let clock = ContinuousClock()
let i = 11

var measure = clock.measure {
    print("gridTraveller: \(gridTraveller(i, i))")
}

print(measure)

measure = clock.measure {
    print("gridTravellerM: \(gridTravellerMemoized(i, i))")
}

print(measure)

measure = clock.measure {
    print("gridTravellerM2: \(gridTravellerMemoized2(i, i))")
}

print(measure)

//gridTraveller: 184756
//27.141337666 seconds
//gridTravellerM: 184756
//0.015501708 seconds
//gridTravellerM2: 184756
//0.010865208 seconds
