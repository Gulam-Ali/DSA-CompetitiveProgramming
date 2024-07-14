import UIKit

/*
 print the row wise sum of 2d array
 */

func rowWiseSum(A: [[Int]]) -> [Int]{
    var result = [Int]()
    let rows = A.count
    let columns = A[0].count
    for i in 0..<rows{
        var sum = 0
        for j in 0..<columns{
            sum += A[i][j]
        }
        result.append(sum)
    }
    return result
}

let array = [[1,2,3,4],
             [5,6,7,8],
             [9,2,3,4]]
//print(rowWiseSum(A: array))

/*
 print the column wise sum of 2d array
 */

func columnWiseSum(A: [[Int]]) -> [Int]{
    var result = [Int]()
    let rows = A.count
    let columns = A[0].count
    for i in 0..<columns{
        var sum = 0
        for j in 0..<rows{
            sum += A[j][i]
        }
        result.append(sum)
    }
    return result
    
}

//print(columnWiseSum(A: array))

/*
 print diagnoals of square matrix, square matrix is where N = M
 */

func getDiagonals(A:[[Int]]){
    //diagonal from L -> R
    let rows = A.count
    for i in 0..<rows{
        print(A[i][i])
    }
    
    //diagonal from R -> L
    var i = 0
    var j = A.count - 1
    while(i < A.count && j >= 0){
        print(A[i][j])
        i += 1
        j -= 1
    }
}

//let sqMatrix =  [[1,2,3],
//                 [4,5,6],
//                 [7,8,9]]
//print(getDiagonals(A: sqMatrix))

/*
 Given matrix[N][M] print all diagonals starting from right to left
 Note - diagonal will start from 0 or m - 1
 */

func printDiagonal(A:[[Int]]) {
   
    let row = A.count
    let col = A[0].count
    //if we start from 0 position
    for k in 0..<row{
        var i = 0
        var j = k
        while (i < row && j >= 0) {
            print(A[i][j])
            i += 1
            j -= 1
        }
    }
    
    
    // traverse from
    for k in 1..<row{
        var i = k
        var j = row - 1
        while (i < row && j >= 0) {
            print(A[i][j])
            i += 1
            j -= 1
        }
    }

}

//let matrix =  [
//    [1, 2, 3, 4],
//    [5, 6, 7, 8],
//    [9, 10, 11, 12],
//    [13, 14, 15, 16]
//]
//printDiagonal(A: matrix)


/*
 Given a 2D integer array A, return the transpose of A.

 The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.
 */

func transposeMatrix(_ A: inout [[Int]]) -> [[Int]] {
    let rows = A.count
    let col = A[0].count
    for i in 0..<rows{
        for j in 0..<col{
            if i < j{
                let value = A[i][j]
                A[i][j] = A[j][i]
                A[j][i] = value
            }
        }
    }
    return A
}

//var A = [[1, 2, 3],
//         [4, 5, 6],
//         [7, 8, 9]]
//print(transposeMatrix(&A))

//This above method work only in case when its square matrix, m = n and when SC = 1, in case of non square matrix logic will be below and SC will be O(N)

func transposeNonSqMatrice(A: [[Int]]) -> [[Int]]{
    let rows = A.count
    let cols = A[0].count
    var Transposed = Array(repeating: Array(repeating: 0, count: rows), count: cols)
    for i in 0..<rows{
        for j in 0..<cols{
            
                Transposed[j][i] = A[i][j]
            
        }
    }
    
    return Transposed
}

//let A = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
//print(transposeNonSqMatrice(A: A))


/*
 Rotate 2D aray by 90 degree
 */

func rotateArray(A:[[Int]]) -> [[Int]]{
    //Transpose the matrice
    var TransposedMatrice = transposeNonSqMatrice(A: A)
    
    //Revese the array
    var rows = TransposedMatrice.count
    var cols = TransposedMatrice[0].count
    for k in 0..<rows{
        var i = 0
        var j = TransposedMatrice[k].count - 1
        while(i < j){
            let value = TransposedMatrice[k][i]
            TransposedMatrice[k][i] = TransposedMatrice[k][j]
            TransposedMatrice[k][j] = value
            i += 1
            j -= 1
        }
    }
    return TransposedMatrice
}

let a =  [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
 ]
print(rotateArray(A: a))
