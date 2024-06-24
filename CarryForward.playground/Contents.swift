import UIKit

/*
 You have given a string A having Uppercase English letters.

 You have to find how many times subsequence "AG" is there in the given string.

 
 Input : A = "ABCGAG"
 */

func findSubsequenceOfAG(A: String) -> Int{
    var count = 0
    var countOfA = 0
    for i in A{
        if i == "A"{
            countOfA += 1
        }
        if i == "G"{
            count += countOfA
        }
    }
    return count
}

//let A = "ABCGAG"
//print(findSubsequenceOfAG(A: A))

/*
 Asked in Amazon & Zeta interview
 Given an array A, find the size of the smallest subarray such that it contains at least one occurrence of the maximum value of the array

 and at least one occurrence of the minimum value of the array.
 */

var B = [2, 6, 1, 6, 9]

func sizeOfSmallestSubarray(A:[Int]) -> Int{
    //1. finc the Max & Min value
    var max = A[0]
    var min = A[0]
    var result = 0
    for i in A{
        if i > max{
            max = i
        }
        if i < min{
            min = i
        }
    }
    print("Maxx >>",max)
    print("Minn >>", min)
    
    var minIndex = -1
    var maxIndex = -1
    
    return result
}

print(sizeOfSmallestSubarray(A: B))
