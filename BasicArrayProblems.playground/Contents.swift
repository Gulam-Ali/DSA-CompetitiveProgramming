import UIKit

/*
 Given an array A of N integers.
 Count the number of elements that have at least 1 elements greater than itself.
 ex- A = [5, 5, 3]
 Ans - 1
 */

/*
 Approach
 1. Find the max element
 2. get count of max element
 3. substarct max count from length of array to get the count of numbers that are less then max (those num are less because max is present)
 */

//func findCount(A:[Int]) -> Int {
//    if A.count != 0 {
//        var maxNum = A[0]
//        var maxCount = 0
//        for i in A{
//            if i > maxNum{
//                maxNum = i
//            }else if i == maxNum{
//                maxCount += 1
//            }
//        }
//        return A.count - maxCount
//    }
//    return 0
//}
////[2,8,3,7,8,5,8]
////print(findCount(A: [5, 5, 3]))

/*
 Given an array A and an integer B. A pair(i, j) in the array is a good pair if i != j and (A[i] + A[j] == B). Check if any good pair exist or not.
 */

func hasPair(A:[Int], B:Int) -> Bool{
    if A.count > 0 {
        for i in 0..<A.count{
            for j in (i+1)..<A.count{
                if A[i] + A[j] == B{
                    return true
                }
            }
        }
    }
    return false
}

//print(hasPair(A: [2,5,6], B: 12))

/*
 Given an array of size N, Reverse entire array such as SC = O(1) (without taking extra steps)
 */

func reverseArr(A: inout [Int]) -> [Int]{
    var i = 0
    var j = A.count - 1
    while (i <= j){
        let temp = A[i]
         A[i] = A[j]
        A[j] = temp
        i += 1
        j -= 1
    }
    return A
}

//var input = [-1,7,8,2,4,0,4]
//print(reverseArr(A: &input))

/*
 Given an array of size N and Si(start index) and Ei(end index), reverse the array from Si to Ei.
 */

func reversArrByIndices(A: inout [Int], Si: Int, Ei:Int) -> [Int]{
    var i = Si
    var j = Ei
    
    while (i < j){
        let temp = A[i]
        A[i] = A[j]
        A[j] = temp
        i += 1
        j -= 1
    }
    return A
}

//var input = [-1,7,8,2,4,0,4]
//print(reversArrByIndices(A: &input, Si: 3, Ei: 6))



/*
 Given an array A, rotate the array by K times from last to first (Amazon,,Google)
 OR
 Given an integer array A of size N and an integer B, you have to return the same array after rotating it B times towards the right.
 ex - [1,2,3,4,5,6,7,8] when K = 2
Ans - [8,1,2,3,4,5,6,7] > [7,8,1,2,3,4,5,6]
 */

func rotateArr(A: inout [Int], B:Int) -> [Int]{
    A = reversArrByIndices(A: &A, Si: 0, Ei: A.count - 1)
    A = reversArrByIndices(A: &A, Si: 0, Ei: B - 1)
    A = reversArrByIndices(A: &A, Si: B, Ei: A.count - 1)
    return A
}

var input = [1, 2, 3, 4]
print(rotateArr(A: &input, B: 2))








