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
        for i in A.enumerated(){
            for (i.offset + 1)..<A.count{
                
            }
        }
    }
    return false
}

print(hasPair(A: [2,5,6], B: 8))














