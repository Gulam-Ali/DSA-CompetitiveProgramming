import UIKit

/*
 Q - Given an integer A, you need to find the count of it's factors.
 */

//BruteForce approach
func findFactorsBF(N:Int) -> Int {
    var factors = 0
    var i = 1
    while i <= N {
        print("Iteration -",i)
        if(N % i == 0){
            factors += 1
        }
        i += 1
    }
    return factors
}

//print(findFactorsBF(N: 24))
/*
 Time complexity = O(N)
 */

//Optimized Solution
func findFactorsOS(N:Int) -> Int {
    var factors = 0
    var i = 1
    while i * i <= N {
        print("Iteration -",i)
        if(N % i == 0){
            if(i * i == N){
                factors += 1
            }else{
                factors += 2
            }
            
        }
        i += 1
    }
    return factors
}
//print(findFactorsOS(N: 100))
/*
 Time complexity = O(Root N)
 */


/*
 Q - Given a number A. Return 1 if A is prime and return 0 if not.
 */

func isPrime(A:Int) -> Int{
    var factors = findFactorsOS(N: A)
    if factors == 2{
        return 1
    }else{
        return 0
    }
}
//print(isPrime(A: 10))
/*
 Time complexity = O(Root N)
 */

