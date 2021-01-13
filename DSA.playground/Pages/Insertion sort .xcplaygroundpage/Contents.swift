import UIKit

/*
 Insertion Sort
 O n ^ 2
 space O(1)
 slightly more performant than bubble sort
 partially small sorted array could be a good choice for this algorithm
 Swifts sort - n log n
 */

func insertionSort(arr: inout [Int]) {
    guard arr.count >= 2 else {return}
    
    for current in 1..<arr.count {
        for j in (1...current).reversed() {
            print(current, j)
            if arr[j] < arr[j - 1] {
                // swap
                arr.swapAt(j, j - 1)
            } else { // left side is sorted
                break  // continue to outer loop
            }
        }
    }
}

var list = [4, 5, 9, -2]

insertionSort(arr: &list)


func insertionSortPrime(arr: inout [Int]) {
    
    for current in 1..<arr.count {
        var hole = current
        
        while hole > 0 && arr[hole] < arr[hole - 1] {
            arr.swapAt(hole, hole - 1)
            hole -= 1
        }
    }
    
}

insertionSortPrime(arr: &list)
