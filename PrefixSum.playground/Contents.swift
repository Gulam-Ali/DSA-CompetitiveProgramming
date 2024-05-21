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

var output = [-7, 1, 5, 2, -4, 3, 0]
print(equilibiriumIndex(A: output))
