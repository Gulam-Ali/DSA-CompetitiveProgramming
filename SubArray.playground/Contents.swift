import UIKit

/*
 Given an array of size 21, find the total number of subarrays of the array.
 */

func TotalSubarrays(N:Int) -> Int {
    var count = 0
    count = N * (N+1) / 2
    return count
}
//print(TotalSubarrays(N: 21))


/*
 What is the time and space complexity for printing the sum of each subarray?

 void printSums(int ar[]){

 int n = ar.length;

 for(int i = 0 ; i < n ; i++){

 int sum = 0;
 
 for(int j = i ; j < n ; j++){
 
 sum = sum + ar[j];
 
 print(sum)
 
 }
 
 }

 }
 
 Answer - TC - O(N^2) , SC - O(1)(Because carry forward technique is used to find the sum of EACh subarray)
 
 */



/*
 Given an array A of length N, return the subarray from B to C.
 */

func getSubarrayFromRange(A: [Int], B:Int, C:Int) -> [Int]{
    var result = [Int]()
    var i = B
    while (i <= C){
        result.append(A[i])
        i += 1
    }
    
    return result
}

//let A = [4, 3, 2, 6]
//let B = 1
//let C = 3
//
//print(getSubarrayFromRange(A: A, B: B, C: C))

/*
 You are given an integer array C of size A. Now you need to find a subarray (contiguous elements) so that the sum of contiguous elements is maximum.
 But the sum must not exceed B.
 Return a single integer which denotes the maximum sum.
 */

func getMax(C:[Int], A:Int, B:Int) -> Int{
    var result = 0
    for i in 0..<C.count{
        var sum = 0
        for j in i+1..<C.count{
            sum += C[j]
            if sum <= B && result < sum{
                result = sum
            }
        }
    }
    return result
}

//let A = 5
//let B = 12
//let C = [2, 1, 3, 4, 5]
//print(getMax(C: C, A: A, B: B))

/*
 You are given an integer array A of length N.
 You have to find the sum of all subarray sums of A.
 More formally, a subarray is defined as a contiguous part of an array which we can obtain by deleting zero or more elements from either end of the array.
 A subarray sum denotes the sum of all the elements of that subarray.
 */


func sumOfAllSubarrays(_ array: [Int]) -> Int {
    
    let N = array.count
    
    //Brute force - TC - O(N^3)
//    var sum = 0
//
//    for start in 0..<N{
//        for end in start..<N{
//            var subarray = [Int]()
//            for k in start...end{
//                subarray.append(array[k])
//                sum += array[k]
//            }
//            print(subarray)
//        }
//    }
//    return sum
    
    
    //Prefix sum - O(N^2), SC - O(N)
//    var sum = 0
//    var PrefixArr = [array[0]]
//    //create prefix sum arr
//    for i in 1..<N{
//        let value = PrefixArr[i - 1] + array[i]
//        PrefixArr.append(value)
//    }
//    print("Prefix sum array -> ", PrefixArr)
//    
//    for start in 0..<PrefixArr.count{
//        var psum = 0
//        for end in start..<PrefixArr.count{
//            if start == 0{
//                psum = PrefixArr[end]
//            }else{
//                psum = PrefixArr[end] - PrefixArr[start - 1]
//            }
//            sum += psum
//        }
//    }
//    
//    return sum
    
    
    //Carry forward - O(N^2), SC- O(1) (Here carry forward is used because we are finding sum of all in continuation, if sum in a given range has to find then we would use PREFIX SUM ONLY)
//    var sum = 0
//    for start in 0..<N{
//        var SubSum = 0
//        for end in start..<N{
//            SubSum += array[end]
//            sum += SubSum
//        }
//    }
//    return sum
    
    
    
    // We can optimise it furthermore
    //by checking the contribution of each element in subarrays
    var sum = 0
    for i in 0..<N{
        let contribution = (array[i] * (i+1) * (N-i))
        sum += contribution
    }
    return sum
}

//// Example usage
//let array = [1,2,3]
//print(sumOfAllSubarrays(array))

/*
 Given an array of integers A, a subarray of an array is said to be good if it fulfills any one of the criteria:
 1. Length of the subarray is be even, and the sum of all the elements of the subarray must be less than B.
 2. Length of the subarray is be odd, and the sum of all the elements of the subarray must be greater than B.
 Your task is to find the count of good subarrays in A.
 */



