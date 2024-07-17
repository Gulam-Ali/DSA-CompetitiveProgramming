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
    
    //calculate bad elements (number which are greater then B)
    var badElements = 0
    for i in 0..<numbersLessThenB{
        if A[i] > B{
            badElements += 1
        }
    }
    
    //make a window size of numbersLessThenB
    var s = 1
    var e = numbersLessThenB
    var ans = badElements
        /*
         0. Initalize the answer with same as badElement count for first window
         1. check if removed element was greter then B, decrement badelement count
         2. check if added element is greated then B, Increment badElement count
         3. If in any iteration if badElement count is less then current answer, update answer
         Note: we are finding the window in which less number of badelement are there, that would be the minimum swap in order
         to make all elements together
         */
    while(e < A.count){
        if A[s-1] > B{
            badElements -= 1
        }
        if A[e] > B{
            badElements += 1
        }
        
        if badElements < ans{
            ans = badElements
        }
       
        s += 1
        e += 1
    }
    
    return ans
}

let A = [19,11,3,9,7,25,6,20,4]
let B = 10
print(getMinSwaps(A: A, B: B))
