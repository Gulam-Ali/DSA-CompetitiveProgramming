import UIKit

/*
 Given N array elements & Q queries. For each query calculate sum of all elements in range [L,R]
 note - L & R are indices such that L <= R
 Arr = [-3,6,2,4,5,2,8,-9,3,1]
 Q = [4,8], [3,7], [1,3], [0,4], [7,7]
 */


func rangeSum(_ A: inout [Int], _ B: inout [[Int]]) -> [Int] {
    var result = [Int]()
    var prefixArr = [A[0]]
    
    var i = 1

    while(i <= A.count - 1){
        let sum = prefixArr[i-1] + A[i]
        prefixArr.append(sum)
        i += 1
    }
    
    var results = [Int]()
    for j in B{
        result.append(j.first! == 0 ? prefixArr[j.last!] : prefixArr[j.last!] - prefixArr[j.first! - 1])
    }
    
    return result
}

//var A = [1,2,3,4,5]
//var B = [[0, 3], [1, 2]]
//print(rangeSum(&A, &B))

/*
 Given an N array elements, count number of equilibirium index/pivot index. an index is Equilibirium when sum of all elements on left of i th index is equal to sum of all element on right side of i index.
 Note - if i == 0, leftsum = 0
 */


func findEquilibiriumIndex(A:[Int]) -> Int{
 //1. Create prefix sum arr
    var Psum = [A[0]]
    for i in 1...A.count - 1{
        let sum = Psum[i-1] + A[i]
        Psum.append(sum)
    }
    var count = 0
    for j in 0...Psum.count-1{
        var lsum = 0
        if j != 0 {
            lsum = Psum[j-1]
        }
        var rsum = Psum[Psum.count-1] - Psum[j]
        if lsum == rsum{
            count += 1
        }
    }
    return count
}
//let B = [-7, 1, 5, 2, -4, 3, 0]
//print(findEquilibiriumIndex(A: B))

/*
 You are given an array A of integers of size N.

 Your task is to find the equilibrium index of the given array

 The equilibrium index of an array is an index such that the sum of elements at lower indexes is equal to the sum of elements at higher indexes.

 If there are no elements that are at lower indexes or at higher indexes, then the corresponding sum of elements is considered as 0.

 Note:

 Array indexing starts from 0.
 If there is no equilibrium index then return -1.
 If there are more than one equilibrium indexes then return the minimum index.
 */

func equilibiriumIndex(A:[Int]) -> Int{
    //1. Construct prefix sum arr
    var P = [A[0]]
    for i in 1...A.count - 1{
        let sum = P[i-1] + A[i]
        P.append(sum)
    }
    
    var count = 0

    for j in 0...P.count-1{
        var lsum = 0
        if j != 0{
            lsum = P[j-1]
        }
        var rsum = P[P.count - 1] - P[j]
        if lsum == rsum{
            count += 1
            return j
        }
    }
    
    
    return -1
    
}

//var output = [-7, 1, 5, 2, -4, 3, 0]
//print(equilibiriumIndex(A: output))

/*
 You are given an array A of length N and Q queries given by the 2D array B of size Q×2.

 Each query consists of two integers B[i][0] and B[i][1].

 For every query, your task is to find the count of even numbers in the range from A[B[i][0]] to A[B[i][1]].
 */

func countOfEvens(A:inout[Int], B:[[Int]]) -> [Int] {
    
    //1. convert even numbers to 1 & odd to zero
    for i in 0...A.count - 1{
        if (A[i] % 2 == 0){
            A[i] = 1
        }else{
            A[i] = 0
        }
    }
    
    //2. create prefix sum arr
    for j in 1...A.count-1{
        let sum = A[j - 1] + A[j]
        A[j] = sum
    }
    
    //3. Range sum query
    var result = [Int]()
    for k in B{
        let leftIndex = k.first!
        let rightIndex = k.last!
        let sum = leftIndex == 0 ? A[rightIndex] : A[rightIndex] - A[leftIndex - 1]
        result.append(sum)
    }
    
    //print(A)
    return result
}

var A = [1, 2, 3, 4, 5]
var B = [   [0, 2],
            [2, 4],
            [1, 4]   ]

var C = [2, 1, 8, 3, 9, 6]
var D = [   [0, 3],
        [3, 5],
        [1, 3],
        [2, 4]   ]
//print(countOfEvens(A: &C, B: D))


/*
 Given the prefix sum of an array, prefSum = [-2, 4, 1, 5, 2]

 What is the sum of the original array from index 0 to 2 (0-based) ?
 */

func originalSum(A:[Int], Q:[Int]) -> Int{
    var O = [A[0]]
    for i in 1...A.count-1{
       // print("\(A[i]) - \(O[i - 1])")
        let sub =   A[i] - A[i - 1]
        O.append(sub)
    }
    

    var sum = 0
    for j in 0...2{
         sum += O[j]
    }
    
    
  
    return sum
}

var output = [-2, 4, 1, 5, 2]
print(originalSum(A: output, Q: [0,2]))
