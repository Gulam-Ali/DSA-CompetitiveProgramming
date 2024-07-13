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
var C = [1,2,3,1,3,4,6,4,6,3]

func sizeOfSmallestSubarray(A:[Int]) -> Int{
    //1. finc the Max & Min value
    var max = A[0]
    var min = A[0]
    var result = A.count
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
    
    for i in 0..<A.count{
        if A[i] == min{
            if maxIndex > -1{
                let lengthOfSubArr = i - maxIndex + 1
                if lengthOfSubArr < result{
                    result = lengthOfSubArr
                }
            }
            minIndex = i
        }
        
        if A[i] == max{
            if minIndex > -1{
                let lengthOfSubArr = i - minIndex + 1
                if lengthOfSubArr < result{
                    result = lengthOfSubArr
                }
            }
            maxIndex = i
        }
        
    }
    
    return result
}

//print(sizeOfSmallestSubarray(A: C))


/*
 Given an integer array A containing N distinct integers, you have to find all the leaders in array A. An element is a leader if it is strictly greater than all the elements to its right side.

 NOTE: The rightmost element is always a leader.
 */

func findLeader(A:[Int]) -> [Int]{
    var result = [A[0]]
    var maxElem = A[0]
    for i in 1..<A.count{
        if A[i] > maxElem{
            maxElem = A[i]
            result.append(A[i])
        }
        
    }
    return result
}

let inp = [16, 17, 4, 3, 5, 2]
let secInp = [17,2,5]
print(findLeader(A: secInp))
