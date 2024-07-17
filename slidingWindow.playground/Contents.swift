import UIKit

/*
 Given N elements, print maximum subarray sum of length K
 */

func maxSubArraySum(A:[Int], K:Int) -> Int {
   var ans = 0
    var sum = 0
    for i in 0..<K{
        sum += A[i]
    }
    var s = 1
    var e = K
    while (e < A.count) {
        sum = sum - A[s-1] + A[e]
        if sum > ans{
            ans = sum
        }
        s += 1
        e += 1
    }
    return ans
}

//let A = [-3,4,-2,5,3,-2,8,2,-1,4]
//print(maxSubArraySum(A: A, K: 5))

/*
 Given an array of integers A and an integer B, find and return the minimum number of swaps required to bring all the numbers less than or equal to B together.

 Note: It is possible to swap any two elements, not necessarily consecutive.
 */

func getMinSwaps(A: [Int], B:Int) -> Int {
    //find numbers which are <= B
    var numbersLessThenB = 0
    for i in A{
        if i <= B{
            numbersLessThenB += 1
        }
    }
    
    //make a window size of numbersLessThenB
    var s = 0
    var e = numbersLessThenB
    var ans = 0
    while(e < A.count){
        
    }
    
    return ans
}

let A = [1, 12, 10, 3, 14, 10, 5]
let B = 8
print(getMinSwaps(A: A, B: B))
